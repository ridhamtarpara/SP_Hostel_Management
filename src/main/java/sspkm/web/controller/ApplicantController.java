package sspkm.web.controller;

import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import sspkm.models.academic.College;
import sspkm.models.academic.Result;
import sspkm.models.academic.SubCourse;
import sspkm.models.academic.dao.CollegeDao;
import sspkm.models.academic.dao.ResultDao;
import sspkm.models.academic.dao.SubCourseDao;
import sspkm.models.applicant.Applicant;
import sspkm.models.applicant.ApplicantApplication;
import sspkm.models.applicant.dao.ApplicantDao;
import sspkm.models.applicant.dao.ApplicationDao;
import sspkm.models.file.dao.FileDao;
import sspkm.models.hostel.GlobalParam;
import sspkm.models.hostel.dao.GlobalParamDao;
import sspkm.models.parentaldetail.Parent;
import sspkm.models.parentaldetail.Relative;
import sspkm.models.parentaldetail.dao.ParentDao;
import sspkm.models.parentaldetail.dao.RelativeDao;
import sspkm.models.user.User;
import sspkm.models.user.dao.UserDao;

@Controller
public class ApplicantController {

	private static final String home = "redirect:/index";

	@Autowired
	private ApplicantDao applicantDao;

	@Autowired
	private UserDao userDao;

	@Autowired
	private ParentDao parentDao;

	@Autowired
	private RelativeDao relativeDao;

	@Autowired
	private ResultDao resultDao;

	@Autowired
	private CollegeDao collegeDao;

	@Autowired
	SubCourseDao scDao;

	@Autowired
	private HttpSession httpSession;

	@Autowired
	private PasswordEncoder passwordEncoder;

	@Autowired
	private GlobalParamDao globalParamDao;
	
	@Autowired
	private ApplicationDao applicationDao;

	@Autowired
	FileDao fileDao;

	@RequestMapping(value = "/basicRegister")
	public String basicRegister(ModelMap m) {
		GlobalParam globalParam = null;
		try {
			globalParam = globalParamDao.findById(1);
		} catch (SQLException e) {
			httpSession.setAttribute("error", "There is some Problem.");
			return "redirect:/";
		}
		if (!globalParam.isAdmissionOn()) {
			httpSession.setAttribute("error",
					"Admission Process has offed, You can not apply for next year until admission process on.");
			return "redirect:/";
		}
		if ((httpSession.getAttribute("userToRegister")) == null) {
			m.put("user", new User());
			return "basicRegister";
		} else
			return "redirect:advanceRegister";
	}

	@RequestMapping(value = "/basicRegister", method = RequestMethod.POST)
	public String basicRegister(@Valid @ModelAttribute User user, @RequestParam MultipartFile self,
			BindingResult bindingResult) {
		try {
			user.setEmail(user.getEmail().toLowerCase());
			if (userDao.getUserByEmail(user.getEmail()) != null) {
				bindingResult.addError(new FieldError("user", "email", "Email Already Register"));
				if (bindingResult.hasErrors()) {
					return "basicRegister";
				}
			}

			if (((self.getContentType().equals("image/jpeg")) || (self.getContentType().equals("image/png")))
					&& self.getSize() <= 524288) {
				user = user.setUserDetail(user);
				user.setPassword(passwordEncoder.encode(user.getPassword()));
				user = userDao.create(user);
				String imageName = fileDao.saveFile(self, "user/" + user.getUserId(),
						"self" + user.getAppliedOn().getTime(), 380, 320);
				if (imageName.equals("error")) {
					bindingResult.addError(
							new ObjectError("imageerror", "Error in uploading image please try after sometime"));
					return "basicRegister";
				}
				httpSession.setAttribute("userToRegister", user);
				return "redirect:advanceRegister";
			} else {
				if (self.getSize() > 524288) {
					bindingResult.addError(new FieldError("user", "userId",
							"Image Size(" + self.getSize() / 1024 + " KB) larger than 500 KB"));
				} else
					bindingResult.addError(
							new FieldError("user", "userId", "Invalid Image!! Only jpg,jpeg and png files allowed"));
				return "basicRegister";
			}
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}
	}

	@RequestMapping(value = "/advanceRegister")
	public String advanceRegister(ModelMap m) {
		User user = (User) httpSession.getAttribute("userToRegister");

		if (user == null) {
			return "redirect:basicRegister";
		}
		m.put("parent", new Parent());
		m.put("relative", new Relative());

		return "advanceRegister";
	}

	@RequestMapping(value = "/advanceRegister", method = RequestMethod.POST)
	public String advanceRegister(@ModelAttribute Parent parent, BindingResult resultParent,
			@ModelAttribute Relative relative, BindingResult resultRelative, @RequestParam MultipartFile parentImage,
			@RequestParam MultipartFile relativeImage) {
		try {
			if ((((parentImage.getContentType().equals("image/jpeg"))
					|| (parentImage.getContentType().equals("image/png"))) && (parentImage.getSize() <= 524288))
					&& (((relativeImage.getContentType().equals("image/jpeg"))
							|| (relativeImage.getContentType().equals("image/png")))
							&& (relativeImage.getSize() <= 524288))) {

				User user = (User) httpSession.getAttribute("userToRegister");
				fileDao.saveFile(parentImage, "user/" + String.valueOf(user.getUserId()),
						"parent" + user.getAppliedOn().getTime(), 380, 320);
				fileDao.saveFile(relativeImage, "user/" + String.valueOf(user.getUserId()),
						"relative" + user.getAppliedOn().getTime(), 380, 320);

				parent.setUser(user);
				relative.setUser(user);
				parent = parentDao.create(parent);
				relative = relativeDao.create(relative);
				httpSession.setAttribute("advance1", "done");

				return "redirect:advanceRegister2";
			} else {
				if (parentImage.getSize() > 524288) {
					resultParent.addError(new FieldError("user", "userId",
							"Image Size(" + parentImage.getSize() / 1024 + " KB) larger than 500 KB"));
				} else
					resultParent.addError(
							new FieldError("user", "userId", "Invalid Image!! Only jpg,jpeg and png files allowed"));
				return "advanceRegister";
			}
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}
	}

	@RequestMapping(value = "/advanceRegister2")
	public String advanceRegister2(ModelMap m) {
		try {
			if (httpSession.getAttribute("advance1") == null) {
				return "redirect:advanceRegister";
			}
			List<SubCourse> courses = scDao.getSortedList();
			List<College> colleges = collegeDao.getSortedList();
			m.put("courses", courses);
			m.put("colleges", colleges);
			m.put("course", new SubCourse());
			m.put("college", new College());
			m.put("result", new Result());
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}
		return "advanceRegister2";
	}

	@RequestMapping(value = "/advanceRegister2", method = RequestMethod.POST)
	public String advanceRegister2(@ModelAttribute Result result, BindingResult resultResult,
			@ModelAttribute SubCourse course, BindingResult resultCourse, @ModelAttribute College college,
			BindingResult resultCollege, ModelMap m) {
		try {
			User user = (User) httpSession.getAttribute("userToRegister");
			result.setUser(user);
			college = collegeDao.findById(college.getCollegeId());
			course = scDao.findById(course.getSubCourseId());
			Applicant applicant = new Applicant();
			applicant.setUser(user);
			applicant.setCollege(college);
			applicant.setCourse(course);
			result = resultDao.create(result);
			applicant = applicantDao.create(applicant);
			Date date = new Date();
			DateFormat dateFormat = new SimpleDateFormat("MM-dd-yyyy");
			dateFormat.setTimeZone(TimeZone.getTimeZone("ISD"));
			dateFormat.format(date);
			java.sql.Date sqlDate = new java.sql.Date(date.getTime());
			ApplicantApplication applicantApplication = new ApplicantApplication();
			applicantApplication.setApplicant(applicant);
			applicantApplication.setStatus("Not Approved");
			applicantApplication.setDate(sqlDate);
			applicantApplication = applicationDao.create(applicantApplication);
			httpSession.invalidate();
			httpSession.setAttribute("application", applicantApplication);
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}
		return "redirect:success";

	}

	@RequestMapping(value = "/success")
	public String success(ModelMap m) {
		try {

			ApplicantApplication aa = (ApplicantApplication) httpSession.getAttribute("application");
			if (aa != null) {
				m.put("application", aa);
			} else {
				return "redirect:/";
			}
		} catch (Exception e) {
			return "redirect:/";
		}
		return "success";
	}

	@RequestMapping(value = "/checkStatus", method = RequestMethod.GET)
	public String checkStatus(ModelMap model) {
		model.put("applicantApplication", new ApplicantApplication());
		return "checkStatus";
	}

	@RequestMapping(value = "/checkStatus", method = RequestMethod.POST)
	public String checkStatus(@Valid @ModelAttribute ApplicantApplication applicantApplication,
			BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {
			return "checkStatus";
		}
		try {
			applicantApplication = applicantDao.checkOut(applicantApplication.getApplicationId());
			if (applicantApplication == null) {
				bindingResult.addError(new FieldError("applicantApplication", "applicationId", "No Applicant Found"));
				return "checkStatus";
			}
			System.out.println(applicantApplication.getStatus());
			httpSession.setAttribute("application", applicantApplication);
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}

		return "applicationStatus";
	}

	@RequestMapping(value = "/printAdmissionLetter", method = RequestMethod.GET)
	public String printAdmissionLetter(ModelMap model, @RequestParam String applicant) {
		if (applicant == "" || applicant == null) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			return home;
		}
		try {
			ApplicantApplication aa = applicationDao.getApplicationByToken(applicant);
			if (aa == null) {
				httpSession.setAttribute("error",
						"Sorry For inconvience !! Something went wrong please try again later.");
				return home;
			} else {
				httpSession.setAttribute("application", aa);
				return "printAdmissionLetter";
			}
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}
	}

	@RequestMapping(value = "/printFinalAdmissionLetter", method = RequestMethod.GET)
	public String printFinalAdmissionLetter(ModelMap model) {
		try {
			ApplicantApplication aa = (ApplicantApplication) httpSession.getAttribute("application");
			if (aa == null) {

				httpSession.setAttribute("error",
						"Sorry For inconvience !! Something went wrong please try again later.");
				return home;
			} else {
				model.put("application", aa);
				httpSession.removeAttribute("application");
				return "printFinalAdmissionLetter";
			}
		} catch (Exception e) {

			System.out.println("3");
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}
	}

}

/*
 * File file = new File("E:/password.txt"); try { if (!file.exists()) {
 * file.createNewFile(); } FileWriter fw = new
 * FileWriter(file.getAbsoluteFile(), true); BufferedWriter bw = new
 * BufferedWriter(fw); bw.write(user.getEmail() + "=="); bw.write(password);
 * bw.newLine(); bw.flush(); bw.close(); } catch (IOException e) {
 * e.printStackTrace(); }
 */
//
