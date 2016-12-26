package sspkm.web.controller;

import java.sql.Date;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.TimeZone;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import sspkm.models.academic.Result;
import sspkm.models.academic.dao.ResultDao;
import sspkm.models.activity.Activity;
import sspkm.models.activity.dao.ActivityDao;
import sspkm.models.applicant.CurrentStudentApplication;
import sspkm.models.applicant.dao.CurrentStudentApplicationDao;
import sspkm.models.bookportal.Book;
import sspkm.models.bookportal.dao.BookDao;
import sspkm.models.file.dao.FileDao;
import sspkm.models.forum.Question;
import sspkm.models.forum.dao.QuestionDao;
import sspkm.models.hostel.GlobalParam;
import sspkm.models.hostel.dao.GlobalParamDao;
import sspkm.models.request.Achievement;
import sspkm.models.request.Complaint;
import sspkm.models.request.LeaveApplication;
import sspkm.models.request.VehicleRegister;
import sspkm.models.request.dao.AchievementDao;
import sspkm.models.request.dao.ComplaintDao;
import sspkm.models.request.dao.LeaveApplicationDao;
import sspkm.models.request.dao.VehicleRegisterDao;
import sspkm.models.student.Student;
import sspkm.models.student.dao.StudentDao;
import sspkm.models.user.User;
import sspkm.models.user.dao.UserDao;
import sspkm.security.SecurityUtils;

@Controller
public class StudentController {

	private static final String home = "redirect:/student";

	@Autowired
	private StudentDao studentDao;

	@Autowired
	private LeaveApplicationDao leaveApplicationDao;

	@Autowired
	private ComplaintDao complaintDao;

	@Autowired
	private VehicleRegisterDao vehicleRegisterDao;

	@Autowired
	private AchievementDao achievementDao;

	@Autowired
	ResultDao resultDao;

	@Autowired
	private HttpSession httpSession;

	@Autowired
	FileDao fileDao;

	@Autowired
	UserDao userDao;

	@Autowired
	private ActivityDao activityDao;

	@Autowired
	private BookDao bookDao;

	@Autowired
	private QuestionDao questionDao;

	@Autowired
	CurrentStudentApplicationDao currentStudentApplicationDao;

	@Autowired
	GlobalParamDao globalParamDao;

	@RequestMapping(value = { "/student/index", "/student" })
	public String studentIndex(ModelMap models) {
		User user = getUserSession();
		try {

			models.put("user", user);

			List<Activity> news = new ArrayList<Activity>();
			List<Activity> notice = new ArrayList<Activity>();

			List<Activity> activities = activityDao.findAll();

			for (Activity a : activities) {

				if (a.getRector().getUser().getGender().equals(user.getGender()) && a.getType().equals("News")) {
					news.add(a);

				} else if (a.getRector().getUser().getGender().equals(user.getGender())
						&& a.getType().equals("Notice")) {
					notice.add(a);

				}

			}

			List<Book> books = bookDao.getMyBooks(user.getStudent().getStudentId());

			List<LeaveApplication> leave = leaveApplicationDao.getLeaveApplicationByStudent(user.getStudent());
			List<Complaint> complaint = complaintDao.getComplaintByStudent(user.getStudent());
			List<VehicleRegister> vehicle = vehicleRegisterDao.getVehicleByStudent(user.getStudent());
			List<Achievement> achievement = achievementDao.getAchievementByStudent(user.getStudent());
			List<Question> questions = questionDao.findByStudent(user.getStudent());
			Result result = resultDao.findByUser(user);

			models.put("news", news);
			models.put("notice", notice);
			models.put("books", books);
			models.put("leave", leave.size());
			models.put("complaint", complaint.size());
			models.put("vehicle", vehicle.size());
			models.put("achievement", achievement.size());
			models.put("questions", questions);
			models.put("result", result);

		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();

		}
		return "student/index";

	}

	@RequestMapping(value = "/student/profile")
	public String studentProfile(ModelMap models) {
		if ((httpSession.getAttribute("updatePrincipal")) != null) {
			updatePrincipal();
			httpSession.removeAttribute("updatePrincipal");
		}
		models.put("user", getUserSession());
		return "student/profile";
	}

	@RequestMapping(value = "/student/addRequest")
	public String studentAddRequest(ModelMap models) {
		User user = getUserSession();
		try {
			List<LeaveApplication> leave = leaveApplicationDao.getLeaveApplicationByStudent(user.getStudent());
			List<Complaint> complaint = complaintDao.getComplaintByStudent(user.getStudent());
			List<VehicleRegister> vehicle = vehicleRegisterDao.getVehicleByStudent(user.getStudent());
			List<Achievement> achievement = achievementDao.getAchievementByStudent(user.getStudent());

			models.put("leave", leave.size());
			models.put("complaint", complaint.size());
			models.put("vehicle", vehicle.size());
			models.put("achievement", achievement.size());
			models.put("user", getUserSession());
		} catch (Exception e) {
			e.printStackTrace();
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
		}
		return "student/addRequest";
	}

	@RequestMapping(value = "/student/viewRequest", method = RequestMethod.GET)
	public String studentViewRequest(ModelMap models) {
		try {
			models.put("user", getUserSession());
			models.put("leaveApplications",
					leaveApplicationDao.getLeaveApplicationByStudent(getUserSession().getStudent()));
			models.put("complaints", complaintDao.getComplaintByStudent(getUserSession().getStudent()));
			models.put("vehicleRegisters", vehicleRegisterDao.getVehicleByStudent(getUserSession().getStudent()));
			models.put("achievements", achievementDao.getAchievementByStudent(getUserSession().getStudent()));
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}
		return "student/viewRequest";
	}

	@RequestMapping(value = "/viewRequest", method = RequestMethod.POST)
	public @ResponseBody String studentViewRequest(@RequestParam Long leaveApplicatioId, @RequestParam Long complaintId,
			@RequestParam Long vehicleRegisterId, @RequestParam Long achievementId) {
		try {
			ObjectMapper mapper = new ObjectMapper();
			String response = null;

			if (leaveApplicatioId != null)
				response = mapper.writeValueAsString(leaveApplicationDao.findById(leaveApplicatioId));
			if (complaintId != null)
				response = mapper.writeValueAsString(complaintDao.findById(complaintId));
			if (vehicleRegisterId != null)
				response = mapper.writeValueAsString(vehicleRegisterDao.findById(vehicleRegisterId));
			if (achievementId != null)
				response = mapper.writeValueAsString(achievementDao.findById(achievementId));

			return response;
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return null;
		}
	}

	@RequestMapping(value = "/student/leaveApplication")
	public String leaveApplication(ModelMap models) {
		models.put("user", getUserSession());
		models.put("leaveApplication", new LeaveApplication());
		return "student/leaveApplication";
	}

	@RequestMapping(value = "/student/leaveApplication", method = RequestMethod.POST)
	public String leaveApplication(@Valid @ModelAttribute LeaveApplication leaveApplication,
			BindingResult bindingResult) {

		if (bindingResult.hasErrors()) {
			return "student/leaveApplication";
		}

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date parsedleave = null;
		Date parsedreturn = null;
		try {
			parsedleave = new Date(format.parse(leaveApplication.getDate().substring(0, 10)).getTime());
			parsedreturn = new Date(format.parse(leaveApplication.getDate().substring(13, 23)).getTime());
		} catch (ParseException e) {

			e.printStackTrace();
		}
		try {
			leaveApplication.setLeaveDate(parsedleave);
			leaveApplication.setReturnDate(parsedreturn);
			leaveApplication.setStatus("Not Approved");
			leaveApplication.setStudent(getUserSession().getStudent());
			leaveApplication = leaveApplicationDao.create(leaveApplication);
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}
		return "redirect:viewRequest";
	}

	@RequestMapping(value = "/student/complaint")
	public String complaint(ModelMap models) {
		models.put("user", getUserSession());
		models.put("complaint", new Complaint());
		return "student/complaint";
	}

	@RequestMapping(value = "/student/complaint", method = RequestMethod.POST)
	public String complaint(@Valid @ModelAttribute Complaint complaint, BindingResult bindingResult) {

		if (bindingResult.hasErrors()) {
			return "student/complaint";
		}
		try {
			java.util.Date date = new java.util.Date();
			DateFormat dateFormat = new SimpleDateFormat("MM-dd-yyyy");
			dateFormat.setTimeZone(TimeZone.getTimeZone("ISD"));
			dateFormat.format(date);

			java.sql.Date sqlDate = new java.sql.Date(date.getTime());
			complaint.setDate(sqlDate);
			complaint.setStudent(getUserSession().getStudent());
			complaint.setStatus("Not Approved");
			complaint = complaintDao.create(complaint);
			return "redirect:viewRequest";
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}
	}

	@RequestMapping(value = "/student/vehicleRegister")
	public String vehicleRagister(ModelMap models) {
		models.put("user", getUserSession());
		models.put("vehicleRegister", new VehicleRegister());
		return "student/vehicleRegister";
	}

	@RequestMapping(value = "/student/vehicleRegister", method = RequestMethod.POST)
	public String vehicleRegister(@Valid @ModelAttribute VehicleRegister vehicleRegister, BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {
			return "student/vehicleRegister";
		}
		try {
			vehicleRegister.setStatus("Not Approved");
			vehicleRegister.setStudent(getUserSession().getStudent());
			vehicleRegister = vehicleRegisterDao.create(vehicleRegister);
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}
		return "redirect:viewRequest";
	}

	@RequestMapping(value = "/student/achievement")
	public String achievement(ModelMap models) {
		models.put("achievement", new Achievement());
		models.put("user", getUserSession());
		return "student/achievement";
	}

	@RequestMapping(value = "/student/achievement", method = RequestMethod.POST)
	public String achievement(@Valid @ModelAttribute Achievement achievement, BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {
			return "student/achievement";
		}
		try {
			achievement.setStatus("Not Approved");
			achievement.setStudent(getUserSession().getStudent());
			achievement = achievementDao.create(achievement);
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}
		return "redirect:viewRequest";
	}

	@RequestMapping(value = "/student/applyForNextYear")
	public String applyForNextYear(ModelMap models) {
		GlobalParam globalParam = null;
		try {
			globalParam = globalParamDao.findById(1);
		} catch (SQLException e) {
			httpSession.setAttribute("error", "There is some Problem.");
			return "redirect:/student/profile";
		}
		if (!globalParam.isAdmissionOn()) {
			httpSession.setAttribute("error",
					"Admission Process has offed, You can not apply for next year until admission process on.");
			return "redirect:/student/profile";
		}
		Student s = getUserSession().getStudent();
		if (s.getCurrentStudentApplication() != null) {
			httpSession.setAttribute("error", "You have already applied for next year");
			return "redirect:/student/profile";
		}
		if ((s.getCurrentYear() + 1) <= (s.getCourse().getDurationInYear())) {
			models.put("user", getUserSession());
			httpSession.setAttribute("viewed", true);
			return "student/applyForNextYear";
		} else {
			httpSession.setAttribute("error", "You can not apply for next year");
			return "redirect:/student/profile";
		}

	}

	@RequestMapping(value = "/student/additionalDetail")
	public String additionalDetail(ModelMap models) {
		if (httpSession.getAttribute("viewed") != null) {
			httpSession.removeAttribute("viewed");
			models.put("user", getUserSession());
			models.put("result", new Result());
			return "student/additionalDetail";
		} else
			return "redirect:/student/applyForNextYear";
	}

	@RequestMapping(value = "/student/additionalDetail", method = RequestMethod.POST)
	public String additionalDetail(@ModelAttribute Result result, @RequestParam Boolean sameRoomPreference,
			ModelMap models) {
		User user = getUserSession();

		Long currentYear = user.getStudent().getCurrentYear();
		Result currentResult = user.getResult();
		if (currentYear == 1) {
			currentResult.setSem1(result.getSem1());
			currentResult.setSem2(result.getSem2());
			currentResult.setSem3(0F);
		} else if (currentYear == 2) {
			currentResult.setSem2(result.getSem2());
			currentResult.setSem3(result.getSem3());
			currentResult.setSem4(result.getSem4());
			currentResult.setSem5(0F);
		} else if (currentYear == 3) {
			currentResult.setSem4(result.getSem4());
			currentResult.setSem5(result.getSem5());
			currentResult.setSem6(result.getSem6());
			currentResult.setSem7(0F);
		} else {
			currentResult.setSem6(result.getSem6());
			currentResult.setSem7(result.getSem7());
			currentResult.setSem8(result.getSem8());
			currentResult.setSem9(0F);
		}
		CurrentStudentApplication c = new CurrentStudentApplication();
		c.setDate(new Date(new java.util.Date().getTime()));
		c.setStatus("Not Approved");
		c.setType("RenewAdmission");
		c.setStudent(user.getStudent());
		c.setSameRoomPreference(sameRoomPreference);
		try {
			resultDao.update(currentResult);
			currentStudentApplicationDao.create(c);
		} catch (Exception e) {
			e.printStackTrace();
		}

		httpSession.setAttribute("success", "You have successfully applied for the next year");
		httpSession.setAttribute("updatePrincipal", "true");
		return "redirect:/student/profile";
	}

	@RequestMapping(value = "/student/applyForCancelAdmission/{id}")
	public String applyForCancelAdmission(@PathVariable Long id) {

		User user = getUserSession();
		Student s = user.getStudent();
		try {
			Student student = studentDao.findById(id);

			if (student.getStudentId() == s.getStudentId()) {

				if (student.getCurrentStudentApplication() != null) {
					httpSession.setAttribute("error", "You have already applied for cancel admission");

				} else {
					CurrentStudentApplication current = new CurrentStudentApplication();
					current.setDate(new Date(new java.util.Date().getTime()));
					current.setStatus("Not Approved");
					current.setStudent(student);
					current.setType("CancelAdmission");

					try {
						currentStudentApplicationDao.create(current);
					} catch (Exception e) {
						e.printStackTrace();
					}

					httpSession.setAttribute("success", "You have successfully applied for Cancel Admission");
					httpSession.setAttribute("updatePrincipal", "true");
					return "redirect:/student/profile";
				}
			} else {
				httpSession.setAttribute("error", "You can not apply for cancel admission");

			}

		} catch (Exception e) {
			e.printStackTrace();
			httpSession.setAttribute("error", "You can not apply for cancel admission");
		}
		return "redirect:/student/profile";
	}

	@RequestMapping(value = "/printStudentAdmissionLetter", method = RequestMethod.GET)
	public String printAdmissionLetter(ModelMap model, @RequestParam String applicant) {
		if (applicant == "" || applicant == null) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			return home;
		}
		try {
			CurrentStudentApplication aa = currentStudentApplicationDao.getApplicationByToken(applicant);

			if (aa == null) {
				httpSession.setAttribute("error",
						"Sorry For inconvience !! Something went wrong please try again later.");
				return home;
			} else {
				System.out.println("method csa :" + aa.getStudent().getUser().getName());
				httpSession.setAttribute("application", aa);
				return "printStudentAdmissionLetter";
			}
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}
	}

	@RequestMapping(value = "/printFinalStudentAdmissionLetter", method = RequestMethod.GET)
	public String printFinalAdmissionLetter(ModelMap model) {
		try {
			CurrentStudentApplication aa = (CurrentStudentApplication) httpSession.getAttribute("application");
			if (aa == null) {

				httpSession.setAttribute("error",
						"Sorry For inconvience !! Something went wrong please try again later.");
				return home;
			} else {
				model.put("application", aa);
				httpSession.removeAttribute("application");
				return "printFinalStudentAdmissionLetter";
			}
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}
	}

	public User getUserSession() {
		User user = SecurityUtils.getUser();
		return user;
	}

	public void updatePrincipal() {
		try {
			User u = userDao.findById(getUserSession().getUserId());
			Authentication authentication = new UsernamePasswordAuthenticationToken(u, u.getPassword(),
					u.getAuthorities());
			SecurityContextHolder.getContext().setAuthentication(authentication);
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();

		}
	}
}