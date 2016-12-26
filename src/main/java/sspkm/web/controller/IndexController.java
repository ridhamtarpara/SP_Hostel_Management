package sspkm.web.controller;

import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.TimeZone;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import sspkm.models.feedback.FeedBack;
import sspkm.models.feedback.dao.FeedBackDao;
import sspkm.models.hostel.GlobalParam;
import sspkm.models.hostel.dao.GlobalParamDao;
import sspkm.models.report.Report;
import sspkm.models.report.dao.ReportDao;
import sspkm.models.user.PasswordToken;
import sspkm.models.user.User;
import sspkm.models.user.dao.PasswordTokenDao;
import sspkm.models.user.dao.UserDao;
import sspkm.models.util.MailMail;
import sspkm.security.SecurityUtils;

@Controller
public class IndexController {

	@Autowired
	private ReportDao reportDao;

	@Autowired
	private FeedBackDao feedbackDao;

	@Autowired
	GlobalParamDao globalParamDao;

	@Autowired
	UserDao userDao;

	@Autowired
	JavaMailSender mailSender;

	@Autowired
	private HttpSession httpSession;

	@Autowired
	PasswordEncoder passwordEncoder;

	@Autowired
	PasswordTokenDao passwordTokenDao;

	@RequestMapping(value = { "/index", "/" }, method = RequestMethod.GET)
	public String index(ModelMap models) {
//		 System.out.println(httpSession.getServletContext().getRealPath(""));
		try {
			GlobalParam g = globalParamDao.findById(1);
			models.put("globalPara", g);
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
		}
		models.put("user", getUserSession());
		models.put("feedback", new FeedBack());
		return "index";
	}

	@RequestMapping(value = { "/index", "/" }, method = RequestMethod.POST)
	public @ResponseBody boolean index(@RequestParam String name, @RequestParam String email, @RequestParam Long phone,
			@RequestParam String message) {
		if (name.isEmpty() || email.isEmpty() || message.isEmpty() || phone == null)
			return false;
		else {
			FeedBack feedback = new FeedBack();
			feedback.setEmail(email);
			feedback.setName(name);
			feedback.setMobileNumber(phone);
			feedback.setMessage(message);
			java.util.Date date = new java.util.Date();
			DateFormat dateFormat = new SimpleDateFormat("MM-dd-yyyy");
			dateFormat.setTimeZone(TimeZone.getTimeZone("ISD"));
			dateFormat.format(date);

			java.sql.Date sqlDate = new java.sql.Date(date.getTime());
			feedback.setDate(sqlDate);
			try {
				feedbackDao.create(feedback);
				return true;
			} catch (Exception e) {
				return false;
			}
		}

	}

	@RequestMapping(value = "/aboutus")
	public String aboutUs(ModelMap models) {
		models.put("user", getUserSession());
		return "aboutus";
	}

	@RequestMapping(value = "/facilities")
	public String facilities(ModelMap models) {
		models.put("user", getUserSession());
		return "facilities";
	}

	@RequestMapping(value = "/diningHall")
	public String diningHall(ModelMap models) {
		models.put("user", getUserSession());
		return "diningHall";
	}

	@RequestMapping(value = "/gym")
	public String gym(ModelMap models) {
		models.put("user", getUserSession());
		return "gym";
	}

	@RequestMapping(value = "/tuition")
	public String tuition(ModelMap models) {
		models.put("user", getUserSession());
		return "tuition";
	}

	@RequestMapping(value = "/library")
	public String library(ModelMap models) {
		models.put("user", getUserSession());
		return "library";
	}

	@RequestMapping(value = "/otherFacility")
	public String otherFacility(ModelMap models) {
		models.put("user", getUserSession());
		return "otherFacility";
	}

	@RequestMapping(value = "/activities")
	public String activities(ModelMap models) {
		models.put("user", getUserSession());
		return "activities";
	}

	@RequestMapping(value = "/navratri")
	public String navratri(ModelMap models) {
		models.put("user", getUserSession());
		return "navratri";
	}

	@RequestMapping(value = "/independenceDay")
	public String independenceDay(ModelMap models) {
		models.put("user", getUserSession());
		return "independenceDay";
	}

	@RequestMapping(value = "/republicDay")
	public String republicDay(ModelMap models) {
		models.put("user", getUserSession());
		return "republicDay";
	}

	@RequestMapping(value = "/satraPrarambh")
	public String satraPrarambh(ModelMap models) {
		models.put("user", getUserSession());
		return "satraPrarambh";
	}

	@RequestMapping(value = "/trust")
	public String trust(ModelMap models) {
		models.put("user", getUserSession());
		return "trust";
	}

	@RequestMapping(value = "/reports")
	public String reports(ModelMap models) {
		models.put("user", getUserSession());
		try {
			List<Report> reports = reportDao.findAll();
			models.put("reports", reports);
		} catch (SQLException e) {
			e.printStackTrace();
			return "400";
		}
		return "reports";
	}

	@RequestMapping(value = "/components")
	public String components(ModelMap models) {
		models.put("user", getUserSession());
		return "components";
	}

	@RequestMapping(value = "/forgetPassword")
	public String forgetPassword(ModelMap models) {

		return "forgetPassword";
	}

	@RequestMapping(value = "/forgetPassword", method = RequestMethod.POST)
	public String forgetPassword(ModelMap models, @RequestParam String email, HttpServletRequest request) {
		try {
			User user = userDao.getUserByEmail(email);
			if (user != null) {
				PasswordToken p = new PasswordToken();
				p.setToken(passwordEncoder.encode(p.getToken()));
				p.setUser(user);
				try {
					p = passwordTokenDao.create(p);
				} catch (Exception e) {
					return "redirect:/";
				}
				String url = "http://localhost:8080" + request.getContextPath() + "/resetPassword?token="
						+ p.getToken();
				MailMail mail = new MailMail();
				mail.resetPassword(mailSender, p.getUser(), url);
				httpSession.setAttribute("message",
						"You have got mail with password reset link if " + email + " is registered email with us.");
				return "forgetPassword";
			}
		} catch (SQLException e) {
			System.out.println("error");
			e.printStackTrace();
			return "redirect:/";
		}
		return "forgetPassword";
	}

	@RequestMapping(value = "/resetPassword")
	public String resetpassword(@RequestParam String token) {
		try {
			PasswordToken passwordToken = passwordTokenDao.findByToken(token);
			if (passwordToken != null) {
				httpSession.setAttribute("user", passwordToken.getUser());
				passwordTokenDao.delete(passwordToken);
			} else
				return "redirect:/";
		} catch (SQLException e) {
			e.printStackTrace();
			return "redirect:/";
		}
		return "resetPassword";
	}

	@RequestMapping(value = "/resetPassword", method = RequestMethod.POST)
	public String resetpassword(ModelMap models, @RequestParam String password) {
		User user = (User) httpSession.getAttribute("user");
		user.setPassword(passwordEncoder.encode(password));
		try {
			userDao.update(user);
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/";
		}
		return "login";
	}

	public User getUserSession() {
		User user = SecurityUtils.getUser();
		return user;
	}

}