package sspkm.web.controller;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;

import sspkm.models.admin.Admin;
import sspkm.models.admin.dao.AdminDao;
import sspkm.models.file.dao.FileDao;
import sspkm.models.hostel.Hostel;
import sspkm.models.hostel.dao.HostelDao;
import sspkm.models.rector.Rector;
import sspkm.models.rector.dao.RectorDao;
import sspkm.models.student.dao.StudentDao;
import sspkm.models.trustee.Trustee;
import sspkm.models.trustee.dao.TrusteeDao;
import sspkm.models.user.User;
import sspkm.models.user.dao.UserDao;
import sspkm.models.util.MailMail;
import sspkm.security.SecurityUtils;

@Controller
public class TrusteeController {

	private static final String home = "redirect:/trustee";

	@Autowired
	private UserDao userDao;

	@Autowired
	private AdminDao adminDao;

	@Autowired
	private TrusteeDao trusteeDao;

	@Autowired
	private StudentDao studentDao;

	@Autowired
	private RectorDao rectorDao;

	@Autowired
	private FileDao fileDao;

	@Autowired
	private HostelDao hostelDao;

	@Autowired
	private HttpSession httpSession;

	@Autowired
	private PasswordEncoder passwordEncoder;

	@Autowired
	private JavaMailSender mailSender;

	@RequestMapping(value = { "/trustee/index", "/trustee" })
	public String trusteeIndex(ModelMap models) {
		User user = getUserSession();
		try {
			List<Rector> rectors = rectorDao.getAllActiveRector();
			List<Admin> admins = adminDao.getAllActiveAdmin();
			List<Trustee> trustees = trusteeDao.findAll();
			List<Hostel> hostels = hostelDao.findAll();
			models.put("rectors", rectors);
			models.put("admins", admins);
			models.put("trustees", trustees);
			models.put("user", user);
			models.put("hostels", hostels);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "trustee/index";
	}

	@RequestMapping(value = "/trustee/profile")
	public String adminProfile(ModelMap models) {
		models.put("user", getUserSession());
		return "trustee/profile";
	}

	@RequestMapping(value = "/trustee/viewBoyStudents")
	public String viewBoyStudents(ModelMap models) {
		try {
			models.put("user", getUserSession());
			models.put("studentList", studentDao.getStudentsByGender("MALE"));
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}

		return "trustee/viewBoyStudents";
	}

	@RequestMapping(value = "/trustee/viewGirlStudents")
	public String viewGirlStudents(ModelMap models) {
		try {
			models.put("user", getUserSession());
			models.put("studentList", studentDao.getStudentsByGender("FEMALE"));
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}
		return "trustee/viewGirlStudents";
	}

	@RequestMapping(value = "/trustee/addTrustee", method = RequestMethod.GET)
	public String addTrustee(ModelMap m) {
		m.put("user", getUserSession());
		m.put("users", new User());
		m.put("trustee", new Trustee());
		if (!(getUserSession().getTrustee().getDesignation()).equals("President")) {
			httpSession.setAttribute("error", "Only President Can Add Trustee");
			return home;
		}
		return "trustee/addTrustee";
	}

	@RequestMapping(value = "/trustee/addTrustee", method = RequestMethod.POST)
	public String addTrustee(@ModelAttribute User user, BindingResult bindingResult, @ModelAttribute Trustee trustee,
			ModelMap models, @RequestParam MultipartFile self) {
		try {
			user.setEmail(user.getEmail().toLowerCase());

			if (userDao.getUserByEmail(user.getEmail()) != null) {
				httpSession.setAttribute("error", "Email Already Register");
				return "redirect:/trustee/addTrustee";
			}
			if (user.isEmpty() || trustee.getDesignation() == null) {
				httpSession.setAttribute("error", "Please fill all fields");
				return "redirect:/trustee/addTrustee";
			}

			if (((self.getContentType().equals("image/jpeg")) || (self.getContentType().equals("image/png")))
					&& self.getSize() <= 524288) {
				Set<String> h = new HashSet<String>();
				h.add("ROLE_TRUSTEE");
				user.setRoles(h);
				user = user.setUserDetail(user);
				String password = user.generatePassword();
				user.setPassword(passwordEncoder.encode(password));
				user = userDao.create(user);
				String imageName = fileDao.saveFile(self, "user\\" + user.getUserId(),
						"self" + user.getAppliedOn().getTime(), 380, 320);
				if (imageName.equals("error")) {
					httpSession.setAttribute("error", "Error in registering trustee please try after sometime");
					return "redirect:/trustee/addTrustee";
				}
				trustee.setUser(user);
				trustee = trusteeDao.create(trustee);
				MailMail mail = new MailMail();
				if (mail.sendUserCredential(mailSender, user, password)) {
					return "redirect:viewTrustees";
				} else {
					httpSession.setAttribute("error", "There is some problem. Try again later");
					return "redirect:viewNewApplications";
				}

			} else {
				if (self.getSize() > 524288) {
					httpSession.setAttribute("error",
							"Image Size(" + self.getSize() / 1024 + " KB) larger than 500 KB");
				} else
					httpSession.setAttribute("error", "Invalid Image!! Only jpg,jpeg and png files allowed");
				return "redirect:/trustee/addTrustee";
			}
		} catch (Exception e) {
			return home;
		}
	}

	@RequestMapping(value = "/trustee/viewTrustees", method = RequestMethod.GET)
	public String viewTrustees(ModelMap models) {
		try {
			models.put("trustees", trusteeDao.findAll());
			models.put("user", getUserSession());
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}
		return "trustee/viewTrustees";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/trustee/viewTrustees", method = RequestMethod.POST)
	public @ResponseBody String viewTrustees(@RequestParam Long id) {
		try {
			ObjectMapper mapper = new ObjectMapper();
			Trustee trustee = trusteeDao.findById(id);
			User user = trustee.getUser();

			String response = null;
			try {
				String response1 = mapper.writeValueAsString(user);
				String response2 = mapper.writeValueAsString(trustee);

				Map<String, String> map1 = mapper.readValue(response1, Map.class);
				Map<String, String> map2 = mapper.readValue(response2, Map.class);

				Map<String, String> merged = new HashMap<String, String>(map1);
				merged.putAll(map2);

				response = mapper.writeValueAsString(merged);

			} catch (Exception e) {
				e.printStackTrace();
			}
			return response;
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return null;
		}
	}

	@RequestMapping(value = "/trustee/editTrustee", method = RequestMethod.GET)
	public String trusteeEdit(@RequestParam long id, ModelMap models) {
		try {
			models.put("trustee", trusteeDao.findById(id));
			models.put("user", getUserSession());
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}
		return "trustee/editTrustee";
	}

	@RequestMapping(value = "/trustee/editTrustee", method = RequestMethod.POST)
	public String rectorEdit(@RequestParam Long trusteeId, @RequestParam String designation) {
		try {
			Trustee t = trusteeDao.findById(trusteeId);
			t.setDesignation(designation);
			trusteeDao.update(t);
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}
		return "redirect:/trustee/viewTrustees";
	}

	@RequestMapping(value = "/trustee/addAdmin", method = RequestMethod.GET)
	public String addAdmin(ModelMap m) {
		try {
			m.put("user", getUserSession());
			m.put("users", new User());
			m.put("admin", new Admin());
			m.put("hostels", hostelDao.findAll());
			m.put("hostel", new Hostel());
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}
		if (!(getUserSession().getTrustee().getDesignation()).equals("President")) {
			httpSession.setAttribute("error", "Only President Can Add Admin");
			return home;
		} else {
			return "trustee/addAdmin";
		}
	}

	@RequestMapping(value = "/trustee/addAdmin", method = RequestMethod.POST)
	public String addAdmin(@ModelAttribute User user, @ModelAttribute Hostel hostel, BindingResult resultUser,
			@ModelAttribute Admin admin, BindingResult resultAdmin, ModelMap models, @RequestParam MultipartFile self) {
		user.setEmail(user.getEmail().toLowerCase());
		try {
			if (userDao.getUserByEmail(user.getEmail()) != null) {
				httpSession.setAttribute("error", "Email Already Register");
				return "redirect:/trustee/addAdmin";
			}
			if (user.isEmpty() || admin.getQualifications() == null || hostel.getHostelId() == null) {
				httpSession.setAttribute("error", "Please fill all fields");
				return "redirect:/trustee/addAdmin";
			}

			if (((self.getContentType().equals("image/jpeg")) || (self.getContentType().equals("image/png")))
					&& self.getSize() <= 524288) {
				Set<String> roles = new HashSet<String>();
				roles.add("ROLE_ADMIN");
				user.setRoles(roles);
				user = user.setUserDetail(user);
				String password = user.generatePassword();
				user.setPassword(passwordEncoder.encode(password));
				user = userDao.create(user);
				String imageName = fileDao.saveFile(self, "user\\" + user.getUserId(),
						"self" + user.getAppliedOn().getTime(), 380, 320);
				if (imageName.equals("error")) {
					httpSession.setAttribute("error", "Error in uploading image please try after sometime");
					return "redirect:/trustee/addAdmin";
				}
				admin.setUser(user);
				admin.setHostel(hostelDao.findById(hostel.getHostelId()));
				admin = adminDao.create(admin);
				models.put("user", getUserSession());
				MailMail mail = new MailMail();
				if (mail.sendUserCredential(mailSender, user, password)) {
					return "redirect:/trustee/viewAdmins";
				} else {
					httpSession.setAttribute("error", "There is some problem. Try again later");
					return "redirect:viewNewApplications";
				}
				
			
			} else {
				if (self.getSize() > 524288) {
					httpSession.setAttribute("error",
							"Image Size(" + self.getSize() / 1024 + " KB) larger than 500 KB");
				} else
					httpSession.setAttribute("error", "Invalid Image!! Only jpg,jpeg and png files allowed");
				return "redirect:/trustee/addAdmin";
			}
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}
	}

	@RequestMapping(value = "/trustee/viewAdmins", method = RequestMethod.GET)
	public String viewAdmins(ModelMap models) {
		try {
			models.put("admins", adminDao.getAllActiveAdmin());
			models.put("user", getUserSession());
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}
		return "trustee/viewAdmins";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/trustee/viewAdmins", method = RequestMethod.POST)
	public @ResponseBody String viewAdmins(@RequestParam Long id, HttpServletRequest request) {
		try {
			ObjectMapper mapper = new ObjectMapper();
			Admin admin = adminDao.findById(id);
			User user = admin.getUser();
			String photo = request.getContextPath() + "/dist/img/user/" + user.getUserId() + "/self"
					+ user.getAppliedOn().getTime() + ".jpg";
			String response = null;
			String response1 = mapper.writeValueAsString(user);
			String response2 = mapper.writeValueAsString(admin);

			Map<String, String> map1 = mapper.readValue(response1, Map.class);
			Map<String, String> map2 = mapper.readValue(response2, Map.class);

			Map<String, String> merged = new HashMap<String, String>(map1);
			merged.putAll(map2);
			merged.put("photo", photo);
			response = mapper.writeValueAsString(merged);

			return response;
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return null;
		}
	}

	@RequestMapping(value = "/trustee/adminDelete", method = RequestMethod.GET)
	public String deleteAdmin(@RequestParam long id, ModelMap models) {
		try {
			User user = adminDao.findById(id).getUser();
			user.setActive(false);
			userDao.update(user);
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}
		return "redirect:/trustee/viewAdmins";
	}

	@RequestMapping(value = "/trustee/viewRectors", method = RequestMethod.GET)
	public String viewRectors(ModelMap models) {
		try {
			models.put("user", getUserSession());
			models.put("rectors", rectorDao.getAllActiveRector());
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}
		return "trustee/viewRectors";
	}

	public User getUserSession() {
		User user = SecurityUtils.getUser();
		return user;
	}

}