package sspkm.web.controller;

import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TimeZone;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

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

import com.fasterxml.jackson.annotation.JsonAutoDetect.Visibility;
import com.fasterxml.jackson.annotation.PropertyAccessor;
import com.fasterxml.jackson.databind.ObjectMapper;

import sspkm.models.academic.College;
import sspkm.models.academic.Result;
import sspkm.models.academic.SubCourse;
import sspkm.models.applicant.Applicant;
import sspkm.models.applicant.ApplicantApplication;
import sspkm.models.applicant.CurrentStudentApplication;
import sspkm.models.applicant.dao.ApplicantDao;
import sspkm.models.applicant.dao.CurrentStudentApplicationDao;
import sspkm.models.feedback.dao.FeedBackDao;
import sspkm.models.file.dao.FileDao;
import sspkm.models.hostel.Hostel;
import sspkm.models.hostel.Room;
import sspkm.models.hostel.dao.HostelDao;
import sspkm.models.hostel.dao.RoomDao;
import sspkm.models.invoice.Invoice;
import sspkm.models.invoice.dao.InvoiceDao;
import sspkm.models.parentaldetail.Parent;
import sspkm.models.parentaldetail.Relative;
import sspkm.models.rector.Rector;
import sspkm.models.rector.dao.RectorDao;
import sspkm.models.report.Report;
import sspkm.models.report.dao.ReportDao;
import sspkm.models.student.Student;
import sspkm.models.student.dao.StudentDao;
import sspkm.models.trustee.Trustee;
import sspkm.models.trustee.dao.TrusteeDao;
import sspkm.models.user.User;
import sspkm.models.user.dao.UserDao;
import sspkm.models.util.MailMail;
import sspkm.security.SecurityUtils;

@Controller
public class AdminController {

	private static final String home = "redirect:/admin";

	@Autowired
	private ReportDao reportdao;

	@Autowired
	private UserDao userDao;

	@Autowired
	private HostelDao hostelDao;

	@Autowired
	private RectorDao rectorDao;

	@Autowired
	private TrusteeDao trusteeDao;

	@Autowired
	private ApplicantDao applicantDao;

	@Autowired
	private StudentDao studentDao;

	@Autowired
	private RoomDao roomDao;

	@Autowired
	private FileDao fileDao;

	@Autowired
	private ReportDao reportDao;

	@Autowired
	private HttpSession httpSession;

	@Autowired
	private CurrentStudentApplicationDao currentStudentApplicationDao;

	@Autowired
	private InvoiceDao invoiceDao;

	@Autowired
	JavaMailSender mailSender;

	@Autowired
	PasswordEncoder passwordEncoder;

	@Autowired
	FeedBackDao feedbackDao;

	@RequestMapping(value = { "/admin/index", "/admin" })
	public String adminIndex(ModelMap models, HttpServletRequest request) {
		User user = getUserSession();
		try {

			List<Student> students = studentDao.getStudentsByGender(user.getGender());
			List<Applicant> applicants = applicantDao.getApplicantsByGender(user.getGender());
			List<Applicant> approvedApplicants = new ArrayList<Applicant>();

			for (Applicant a : applicants) {
				if (a.getApplication().getStatus().equals("Approved")) {
					approvedApplicants.add(a);
				}
			}

			List<Rector> rectors = rectorDao.getRectorByGender(user.getGender());
			List<Trustee> trustees = trusteeDao.findAll();
			List<Report> reports = reportDao.findAll();
			List<Hostel> hostels = hostelDao.findAll();
			Collections.reverse(reports);

			models.put("approvedApplicants", approvedApplicants.size());
			models.put("students", students.size());
			models.put("applicants", applicants.size());
			models.put("rectors", rectors);
			models.put("trustees", trustees);
			models.put("reports", reports);
			models.put("user", user);
			models.put("hostels", hostels);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/index";
	}

	@RequestMapping(value = "/admin/profile")
	public String adminProfile(ModelMap models) {
		models.put("user", getUserSession());
		return "admin/profile";
	}

	@RequestMapping(value = "/admin/viewSeatMatrix")
	public String viewSeatMatrix(ModelMap models) {
		models.put("user", getUserSession());
		return "admin/viewSeatMatrix";
	}

	@RequestMapping(value = "/admin/viewNewApplications")
	public String viewNewApplicantions(ModelMap models) {
		User user = getUserSession();
		try {

			models.put("applicantList", applicantDao.getApplicantsByGender(user.getGender()));
			models.put("user", user);
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}
		return "admin/viewNewApplications";
	}

	@RequestMapping(value = "/admin/viewStudentApplications")
	public String viewStudentApplicantions(ModelMap models) {
		try {

			List<CurrentStudentApplication> csal = currentStudentApplicationDao
					.findStudentApplicationByType("RenewAdmission");
			List<CurrentStudentApplication> modelList = new ArrayList<CurrentStudentApplication>();
			for (CurrentStudentApplication currentStudentApplication : csal) {
				if ((currentStudentApplication.getStudent().getUser().getGender())
						.equals((getUserSession().getGender()))) {
					modelList.add(currentStudentApplication);
				}
			}
			models.put("user", getUserSession());
			models.put("applicantList", modelList);
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}
		return "admin/viewStudentApplications";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/admin/viewApplicant", method = RequestMethod.POST)
	public @ResponseBody String viewApplicant(@RequestParam Long id, HttpServletRequest request) {
		try {

			ObjectMapper mapper = new ObjectMapper();
			Applicant applicant = applicantDao.findById(id);
			User user = applicant.getUser();
			College college = applicant.getCollege();
			SubCourse course = applicant.getCourse();
			Parent parent = user.getParent();
			Relative relative = user.getRelative();
			Result result = user.getResult();
			String urlself = request.getContextPath() + "/dist/img/user/" + user.getUserId() + "/self"
					+ user.getAppliedOn().getTime() + ".jpg";
			String urlparent = request.getContextPath() + "/dist/img/user/" + user.getUserId() + "/parent"
					+ user.getAppliedOn().getTime() + ".jpg";
			String urlrelative = request.getContextPath() + "/dist/img/user/" + user.getUserId() + "/relative"
					+ user.getAppliedOn().getTime() + ".jpg";

			String response = null;
			String response1 = mapper.writeValueAsString(user);
			String response2 = mapper.writeValueAsString(college);
			String response3 = mapper.writeValueAsString(course);
			String response4 = mapper.writeValueAsString(parent);
			String response5 = mapper.writeValueAsString(relative);
			String response6 = mapper.writeValueAsString(result);

			Map<String, String> map1 = mapper.readValue(response1, Map.class);
			Map<String, String> map2 = mapper.readValue(response2, Map.class);
			Map<String, String> map3 = mapper.readValue(response3, Map.class);
			Map<String, String> map4 = mapper.readValue(response4, Map.class);
			Map<String, String> map5 = mapper.readValue(response5, Map.class);
			Map<String, String> map6 = mapper.readValue(response6, Map.class);

			Map<String, String> merged = new HashMap<String, String>(map1);
			merged.putAll(map2);
			merged.putAll(map3);
			merged.putAll(map4);
			merged.putAll(map5);
			merged.putAll(map6);
			merged.put("urlSelf", urlself);
			merged.put("urlParent", urlparent);
			merged.put("urlRelative", urlrelative);

			response = mapper.writeValueAsString(merged);

			return response;
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return null;
		}
	}

	@RequestMapping(value = "/admin/getApplicantDetail", method = RequestMethod.GET)
	public String getApplicant(@RequestParam long id, ModelMap models) {
		try {
			models.put("applicant", applicantDao.findById(id));
			models.put("user", getUserSession());
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}
		return "admin/applicantDetail";
	}

	@RequestMapping(value = "/admin/getStudentDetail", method = RequestMethod.GET)
	public String getStudent(@RequestParam long id, ModelMap models) {
		try {
			models.put("student", studentDao.findById(id));
			models.put("user", getUserSession());
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}
		return "admin/studentDetail";
	}

	@RequestMapping(value = "/admin/approveAdmission", method = RequestMethod.GET)
	public String approveAdmission(@RequestParam long id, HttpServletRequest request) {
		try {
			// mail to applicant about Admission
			MailMail mail = new MailMail();
			String UUID = java.util.UUID.randomUUID().toString();
			Applicant applicant = applicantDao.findById(id);
			applicant.getApplication().setStatus("Approved");
			applicant.getApplication().setToken(UUID);
			String url = "http://localhost:8080" + request.getContextPath() + "/printAdmissionLetter?applicant=" + UUID;

			if (mail.sendAdmissionLetter(mailSender, applicant.getUser(), url)) {
				applicant.getApplication().setStatus("Approved");
				applicant.getApplication().setToken(UUID);
				applicant = applicantDao.update(applicant);
				return "redirect:viewNewApplications";
			} else {
				httpSession.setAttribute("error", "There is some problem. Try again later");
				return "redirect:/admin/getApplicantDetail?id=" + id;
			}

		} catch (Exception exp) {
			httpSession.setAttribute("error", "There is some problem. Try again later");
			exp.printStackTrace();
			return "redirect:/admin/getApplicantDetail?id=" + id;
		}
	}

	@RequestMapping(value = "/admin/approveStudentAdmission", method = RequestMethod.GET)
	public String approveStudentAdmission(@RequestParam long id, HttpServletRequest request) {

		try {
			CurrentStudentApplication c = currentStudentApplicationDao.findById(id);

			if (c.getType().equals("CancelAdmission")) {

				// generate PDF and mail to student

				return "redirect:cancelAdmissionApplications";
			}

			MailMail mail = new MailMail();
			String UUID = java.util.UUID.randomUUID().toString();
			c.setStatus("Approved");
			c.setToken(UUID);
			String url = "http://localhost:8080" + request.getContextPath() + "/printStudentAdmissionLetter?applicant="
					+ UUID;

			if (mail.sendAdmissionLetter(mailSender, c.getStudent().getUser(), url)) {
				currentStudentApplicationDao.update(c);
				return "redirect:viewNewApplications";
			} else {
				httpSession.setAttribute("error", "There is some problem. Try again later");
				return "redirect:/admin/getApplicantDetail?id=" + id;
			}

		} catch (Exception e) {

			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}

		// mail to applicant about Admission

	}

	@RequestMapping(value = "/admin/confirmAdmission", method = RequestMethod.GET)
	public String confirmAdmission(ModelMap models) {
		models.put("user", getUserSession());
		models.put("applicantApplication", new ApplicantApplication());
		return "admin/confirmAdmission";

	}

	@RequestMapping(value = "/admin/confirmAdmission", method = RequestMethod.POST)
	public String confirmAdmission(@ModelAttribute ApplicantApplication application, BindingResult bindingResult,
			ModelMap models) {
		Applicant applicant;
		models.put("user", getUserSession());
		try {
			application = applicantDao.checkOut(application.getApplicationId());

			if (application == null) {
				httpSession.setAttribute("applicationerror", "Application Id Not Found...!!!");
				return "admin/confirmAdmission";
			} else if (application.getStatus() != "Approved") {
				httpSession.setAttribute("applicationerror", "Application is Not Approved...!!!");
				return "admin/confirmAdmission";
			}
			applicant = application.getApplicant();
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}
		return "redirect:/admin/confirmAdmissionDetail?id=" + applicant.getApplicantId();

	}

	@RequestMapping(value = { "/admin/confirmAdmissionDetail",
			"/admin/confirmAdmissionDetail/{id}" }, method = RequestMethod.GET)
	public String confirmAdmissionDetail(@RequestParam long id, ModelMap models) {
		try {
			Applicant applicant = applicantDao.findById(id);
			if (applicant == null) {
				return "redirect:/admin/viewNewApplications";
			}
			models.put("applicantToConfirm", applicant);
			models.put("hostels", hostelDao.findAll());
			models.put("hostel", new Hostel());
			models.put("room", new Room());
			models.put("user", getUserSession());
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}

		return "admin/confirmAdmissionDetail";

	}

	@RequestMapping(value = "/admin/confirmStudentAdmissionDetail", method = RequestMethod.GET)
	public String confirmStudentAdmissionDetail(@RequestParam long id, ModelMap models) {
		try {
			CurrentStudentApplication csa = currentStudentApplicationDao.findById(id);
			if (csa == null) {
				return "redirect:/admin/viewStudentApplications";
			}
			models.put("studentToConfirm", csa.getStudent());
			models.put("hostels", hostelDao.findAll());
			models.put("hostel", new Hostel());
			models.put("room", new Room());
			models.put("user", getUserSession());
			httpSession.setAttribute("csa", csa);
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}
		return "admin/confirmStudentAdmissionDetail";

	}

	@RequestMapping(value = "/admin/confirmAdmissionDetail", method = RequestMethod.POST)
	public String confirmAdmissionDetail(@ModelAttribute Hostel hostel, BindingResult bindingHostel,
			@ModelAttribute Room room, BindingResult bindingRoom, @RequestParam long applicantId,
			@RequestParam String paymentType, @RequestParam long hostelSelect, @RequestParam Long currentYear,
			ModelMap models) {

		try {
			models.put("user", getUserSession());
			Hostel hostelObj = new Hostel();
			hostelObj = hostelDao.findById(hostel.getHostelId());

			Applicant applicant = applicantDao.findById(applicantId);
			Student student = new Student();
			student.setUser(applicant.getUser());
			student.setCourse(applicant.getCourse());
			student.setCurrentYear(currentYear);
			student.setCollege(applicant.getCollege());
			student.setRoom(roomDao.findById(room.getRoomId()));
			roomDao.updateRoomNumber(roomDao.findById(room.getRoomId()));

			student.setHostel(hostelObj);
			student = studentDao.create(student);
			applicantDao.delete(applicant);
			httpSession.setAttribute("users", student.getUser());

			// Mail User name And Password to student
			Invoice invoice1 = new Invoice();
			Invoice invoice2 = new Invoice();
			Invoice invoice3 = new Invoice();
			java.util.Date date = new java.util.Date();
			DateFormat dateFormat = new SimpleDateFormat("MM-dd-yyyy");
			dateFormat.setTimeZone(TimeZone.getTimeZone("ISD"));
			dateFormat.format(date);

			java.sql.Date sqlDate = new java.sql.Date(date.getTime());
			// SHREE DONATION
			invoice1.setAmount(hostel.getFee());
			invoice1.setTotalAmount(hostelObj.getFee());
			invoice1.setUser(student.getUser());
			invoice1.setInvoiceType("SHREE DONATION");
			invoice1.setPaymentType(paymentType);
			invoice1.setInvoiceDate(sqlDate);
			invoice1 = invoiceDao.create(invoice1);

			// Food Bill
			invoice2.setAmount(hostel.getFoodBill());
			invoice2.setTotalAmount(hostelObj.getFoodBill());
			invoice2.setUser(student.getUser());
			invoice2.setInvoiceType("FOOD BILL");
			invoice2.setPaymentType(paymentType);
			invoice2.setInvoiceDate(sqlDate);
			invoice2 = invoiceDao.create(invoice2);

			// Deposit
			invoice3.setAmount(hostel.getDeposit());
			invoice3.setTotalAmount(hostelObj.getDeposit());
			invoice3.setUser(student.getUser());
			invoice3.setInvoiceType("DEPOSIT");
			invoice3.setPaymentType(paymentType);
			invoice3.setInvoiceDate(sqlDate);
			invoice3 = invoiceDao.create(invoice3);
			MailMail mail = new MailMail();
			User user = student.getUser();
			String password = user.generatePassword();
			user.setPassword(passwordEncoder.encode(password));
			userDao.update(user);
			if (mail.sendUserCredential(mailSender, user, password)) {
				return "redirect:/admin/admissionInvoice";
			} else {
				httpSession.setAttribute("error", "There is some problem. Try again later");
				return "redirect:viewNewApplications";
			}

		} catch (Exception exp) {
			return "400";
		}

	}

	@RequestMapping(value = "/admin/admissionInvoice")
	public String admissionInvoice(ModelMap models) {
		try {
			models.put("user", getUserSession());
			java.util.Date date = new java.util.Date();
			DateFormat dateFormat = new SimpleDateFormat("MM-dd-yyyy");
			dateFormat.setTimeZone(TimeZone.getTimeZone("ISD"));
			dateFormat.format(date);

			java.sql.Date sqlDate = new java.sql.Date(date.getTime());
			httpSession.setAttribute("invoices",
					invoiceDao.getInvoiceByUser((User) httpSession.getAttribute("users"), sqlDate));
			httpSession.removeAttribute("student");
			return "admin/admissionInvoice";
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/admin/print")
	public String print(ModelMap models) {
		models.put("invoices", (List<Invoice>) httpSession.getAttribute("invoices"));
		httpSession.removeAttribute("invoices");
		return "admin/print";
	}

	@RequestMapping(value = "/admin/confirmStudentAdmissionDetail", method = RequestMethod.POST)
	public String confirmStudentAdmissionDetail(@ModelAttribute Hostel hostel, BindingResult bindingHostel,
			@RequestParam String paymentType, @ModelAttribute Room room, BindingResult bindingRoom,
			@RequestParam long studentId, @RequestParam long hostelSelect) {

		CurrentStudentApplication csa = (CurrentStudentApplication) httpSession.getAttribute("csa");

		try {
			Hostel hostelObj = hostelDao.findById(hostel.getHostelId());
			Student student = studentDao.findById(studentId);
			Room r = roomDao.findById(room.getRoomId());
			student.setCurrentYear(student.getCurrentYear() + 1);
			student.setRoom(r);
			roomDao.updateRoomNumber(r);
			student.setHostel(hostelObj);
			student.setStudentValid(true);
			student = studentDao.update(student);
			currentStudentApplicationDao.delete(csa);
			httpSession.removeAttribute("csa");
			httpSession.setAttribute("users", student.getUser());
			Invoice invoice1 = new Invoice();
			Invoice invoice = new Invoice();
			java.util.Date date = new java.util.Date();
			DateFormat dateFormat = new SimpleDateFormat("MM-dd-yyyy");
			dateFormat.setTimeZone(TimeZone.getTimeZone("ISD"));
			dateFormat.format(date);

			java.sql.Date sqlDate = new java.sql.Date(date.getTime());

			// SHREE DONATION
			invoice1.setAmount(hostel.getFee());
			invoice1.setTotalAmount(hostelObj.getFee());
			invoice1.setUser(student.getUser());
			invoice1.setInvoiceType("SHREE DONATION");
			invoice1.setPaymentType(paymentType);
			invoice1.setInvoiceDate(sqlDate);
			invoice1 = invoiceDao.create(invoice1);
			invoice1.setReceiptNumber(invoice1.getReceiptNumber());
			// Food Bill
			invoice.setAmount(hostel.getFoodBill());
			invoice.setTotalAmount(hostelObj.getFoodBill());
			invoice.setUser(student.getUser());
			invoice.setInvoiceType("FOOD BILL");
			invoice.setPaymentType(paymentType);
			invoice.setInvoiceDate(sqlDate);
			invoice = invoiceDao.create(invoice);

			return "redirect:/admin/admissionInvoice";

		} catch (Exception e) {
			e.printStackTrace();
			return "admin/index";
		}

	}

	@RequestMapping(value = "/admin/cancelAdmissionApplications")
	public String cancelAdmissionApplications(ModelMap models) {
		try {

			List<CurrentStudentApplication> applications = currentStudentApplicationDao
					.findStudentApplicationByType("CancelAdmission");
			List<CurrentStudentApplication> applicationList = new ArrayList<CurrentStudentApplication>();

			for (CurrentStudentApplication currentStudentApplication : applications) {
				if ((currentStudentApplication.getStudent().getUser().getGender())
						.equals((getUserSession().getGender()))) {
					applicationList.add(currentStudentApplication);
				}
			}

			models.put("ApplicationList", applicationList);
			models.put("user", getUserSession());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/cancelAdmissionApplications";

	}

	@RequestMapping(value = "/admin/cancelAdmission", method = RequestMethod.GET)
	public String cancelAdmission(ModelMap models) {

		models.put("users", new User());
		models.put("user", getUserSession());

		return "admin/cancelAdmission";

	}

	@RequestMapping(value = "/admin/cancelAdmission", method = RequestMethod.POST)
	public String cancelAdmission(@ModelAttribute User users, BindingResult bindingResult, ModelMap models) {

		User user = getUserSession();

		if (bindingResult.hasErrors()) {
			System.out.println("Binding error");
			return "redirect:/admin/cancelAdmission";
		}

		try {
			String email = users.getEmail().toLowerCase();
			User u = userDao.getUserByEmail(email);

			if (u == null) {
				httpSession.setAttribute("emailerror", "Email Id Not Found...!!!");
				return "redirect:/admin/cancelAdmission";
			} else if (!(u.getGender().equals(user.getGender()))) {
				httpSession.setAttribute("emailerror", "Email Id Not Found...!!!");
				return "redirect:/admin/cancelAdmission";
			}
			return "redirect:/admin/cancelAdmissionLetter?id=" + u.getStudent().getStudentId();
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}
	}

	@RequestMapping(value = { "/admin/cancelAdmissionLetter", "/admin/cancelAdmissionLetter/{id}" })
	public String cancelAdmission(@RequestParam long id, ModelMap models) {
		try {
			Student student = studentDao.findById(id);
			if (student != null) {
				models.put("student", student);
				httpSession.setAttribute("Student", student);

				models.put("user", getUserSession());
				return "admin/cancelAdmissionLetter";
			} else {
				return "redirect:/admin/cancelAdmission";
			}
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}

	}

	@RequestMapping(value = "/admin/printCancelAdmissionLetter", method = RequestMethod.GET)
	public String printCancelAdmissionLetter(ModelMap models) {
		Student s = (Student) httpSession.getAttribute("Student");
		if (s != null) {
			models.put("student", s);
			models.put("user", getUserSession());
			return "admin/printCancelAdmissionLetter";
		} else {
			return "redirect:/admin/cancelAdmissionLetter";
		}
	}

	@RequestMapping(value = "/admin/cancelAdmissionLetter", method = RequestMethod.POST)
	public String cancelAdmissionLetter(@RequestParam long deposit, ModelMap models) {
		Student s = (Student) httpSession.getAttribute("Student");
		if (s != null) {
			models.put("student", s);
			httpSession.setAttribute("deposit", deposit);
			models.put("user", getUserSession());
			try {
				User user = s.getUser();
				user.setActive(false);
				userDao.update(user);
				currentStudentApplicationDao.delete(s.getCurrentStudentApplication());
			} catch (Exception e) {
				httpSession.setAttribute("error",
						"Sorry For inconvience !! Something went wrong please try again later.");
				e.printStackTrace();
				return home;
			}
			return "admin/depositInvoice";
		} else {
			return "redirect:/admin/cancelAdmissionLetter?id=";
		}
	}

	@RequestMapping(value = "/admin/depositInvoice", method = RequestMethod.GET)
	public String depositeInvoice(ModelMap models) {

		return "admin/depositeInvoice";

	}

	@RequestMapping(value = "/admin/printDeposit")
	public String printDeposit(ModelMap models) {
		Student s = (Student) httpSession.getAttribute("Student");
		if (s != null) {
			models.put("student", s);
			models.put("deposit", (Long) httpSession.getAttribute("deposit"));

			httpSession.removeAttribute("student");
			httpSession.removeAttribute("deposit");
			return "admin/printDeposit";
		} else {
			return "redirect:/admin/cancelAdmission";
		}
	}

	@RequestMapping(value = { "/admin/viewStudents", "/rector/viewStudents" })
	public String viewStudents(ModelMap models) {
		try {
			models.put("user", getUserSession());
			models.put("studentList", studentDao.getStudentsByGender(getUserSession().getGender()));
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}
		if (getUserSession().isUserAdmin()) {
			return "admin/viewStudents";
		} else if (getUserSession().isUserRector()) {
			return "rector/viewStudents";
		} else
			return "trustee/viewStudents";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/viewStudent", method = RequestMethod.POST)
	public @ResponseBody String viewStudent(@RequestParam Long studentid, HttpServletRequest request) {
		try {
			ObjectMapper mapper = new ObjectMapper();
			mapper.setVisibility(PropertyAccessor.FIELD, Visibility.ANY);
			Student student = studentDao.findById(studentid);
			User user = student.getUser();
			College college = student.getCollege();
			SubCourse course = student.getCourse();
			Parent parent = user.getParent();
			Relative relative = user.getRelative();
			Result result = user.getResult();
			Hostel hostel = student.getHostel();
			Room room = student.getRoom();
			String urlself = request.getContextPath() + "/dist/img/user/" + user.getUserId() + "/self"
					+ user.getAppliedOn().getTime() + ".jpg";
			String urlparent = request.getContextPath() + "/dist/img/user/" + user.getUserId() + "/parent"
					+ user.getAppliedOn().getTime() + ".jpg";
			String urlrelative = request.getContextPath() + "/dist/img/user/" + user.getUserId() + "/relative"
					+ user.getAppliedOn().getTime() + ".jpg";

			String response = null;
			try {
				String response1 = mapper.writeValueAsString(user);
				String response2 = mapper.writeValueAsString(college);
				String response3 = mapper.writeValueAsString(course);
				String response4 = mapper.writeValueAsString(parent);
				String response5 = mapper.writeValueAsString(relative);
				String response6 = mapper.writeValueAsString(result);
				String response7 = mapper.writeValueAsString(hostel);
				String response8 = mapper.writeValueAsString(room);

				Map<String, String> map1 = mapper.readValue(response1, Map.class);
				Map<String, String> map2 = mapper.readValue(response2, Map.class);
				Map<String, String> map3 = mapper.readValue(response3, Map.class);
				Map<String, String> map4 = mapper.readValue(response4, Map.class);
				Map<String, String> map5 = mapper.readValue(response5, Map.class);
				Map<String, String> map6 = mapper.readValue(response6, Map.class);
				Map<String, String> map7 = mapper.readValue(response7, Map.class);
				Map<String, String> map8 = mapper.readValue(response8, Map.class);

				Map<String, String> merged = new HashMap<String, String>(map1);
				merged.putAll(map2);
				merged.putAll(map3);
				merged.putAll(map4);
				merged.putAll(map5);
				merged.putAll(map6);
				merged.putAll(map7);
				merged.putAll(map8);
				merged.put("urlSelf", urlself);
				merged.put("urlParent", urlparent);
				merged.put("urlRelative", urlrelative);

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

	@RequestMapping(value = "/admin/addRector", method = RequestMethod.GET)
	public String addRector(ModelMap m) {
		try {
			m.put("user", getUserSession());
			m.put("users", new User());
			m.put("rector", new Rector());
			m.put("hostels", hostelDao.findAll());
			m.put("hostel", new Hostel());
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}
		return "admin/addRector";
	}

	@RequestMapping(value = "/admin/addRector", method = RequestMethod.POST)
	public String addRector(@Valid @ModelAttribute User user, @ModelAttribute Hostel hostel, BindingResult resultUser,
			@ModelAttribute Rector rector, BindingResult bindingResult, ModelMap models,
			@RequestParam MultipartFile self) {
		user.setEmail(user.getEmail().toLowerCase());
		try {
			if (userDao.getUserByEmail(user.getEmail()) != null) {
				httpSession.setAttribute("error", "Email Already Register");
				return "redirect:/admin/addRector";
			}

			if (user.isEmpty() || rector.getQualifications() == null || hostel.getHostelId() == null) {
				httpSession.setAttribute("error", "Please fill all fields");
				return "redirect:/admin/addTrustee";
			}

			if (((self.getContentType().equals("image/jpeg")) || (self.getContentType().equals("image/png")))
					&& self.getSize() <= 524288) {

				Set<String> h = new HashSet<String>();
				h.add("ROLE_RECTOR");
				user.setRoles(h);
				user = user.setUserDetail(user);
				String password = user.generatePassword();
				user.setPassword(passwordEncoder.encode(password));
				user = userDao.create(user);
				String imageName = fileDao.saveFile(self, "user\\" + user.getUserId(),
						"self" + user.getAppliedOn().getTime(), 380, 320);
				if (imageName.equals("error")) {
					httpSession.setAttribute("error", "Error in uploading image please try after sometime");
					return "redirect:/admin/addRector";
				}
				rector.setUser(user);
				rector.setHostel(hostelDao.findById(hostel.getHostelId()));
				rector = rectorDao.create(rector);
				MailMail mail = new MailMail();
				if (mail.sendUserCredential(mailSender, user, password)) {
					return "redirect:viewRectors";
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
				return "admin/addRector";
			}
		} catch (Exception e) {

			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;

		}

	}

	@RequestMapping(value = "/admin/viewRectors", method = RequestMethod.GET)
	public String viewRectors(ModelMap models) {
		try {
			models.put("user", getUserSession());
			models.put("rectors", rectorDao.getRectorByGender(getUserSession().getGender()));
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}
		return "admin/viewRectors";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/viewRectors", method = RequestMethod.POST)
	public @ResponseBody String viewRectors(@RequestParam Long id, HttpServletRequest request) {
		try {
			ObjectMapper mapper = new ObjectMapper();
			mapper.setVisibility(PropertyAccessor.FIELD, Visibility.ANY);
			Rector rector = rectorDao.findById(id);
			User user = rector.getUser();
			Hostel hostel = rector.getHostel();
			String photo = request.getContextPath() + "/dist/img/user/" + user.getUserId() + "/self"
					+ user.getAppliedOn().getTime() + ".jpg";
			String response = null;

			String response1 = mapper.writeValueAsString(user);
			String response2 = mapper.writeValueAsString(rector);
			String response3 = mapper.writeValueAsString(hostel);

			Map<String, String> map1 = mapper.readValue(response1, Map.class);
			Map<String, String> map2 = mapper.readValue(response2, Map.class);
			Map<String, String> map3 = mapper.readValue(response3, Map.class);

			Map<String, String> merged = new HashMap<String, String>(map1);
			merged.putAll(map2);
			merged.putAll(map3);
			merged.put("photo", photo);

			response = mapper.writeValueAsString(merged);

			return response;
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return null;
		}
	}

	@RequestMapping(value = "/admin/rectorDelete", method = RequestMethod.GET)
	public String deleteRector(@RequestParam long id) {
		try {
			User user = rectorDao.findById(id).getUser();
			user.setActive(false);
			userDao.update(user);
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}
		return "redirect:/admin/viewRectors";
	}

	@RequestMapping(value = "/admin/addReport")
	public String addReport(ModelMap models) {
		models.put("report", new Report());
		models.put("user", getUserSession());
		return "admin/addReport";
	}

	@RequestMapping(value = "/admin/addReport", method = RequestMethod.POST)
	public String addReport(@Valid @ModelAttribute Report report, BindingResult bindingResult, ModelMap models) {
		if (bindingResult.hasErrors()) {
			return "admin/addReport";
		}
		try {
			Date date = new Date();
			DateFormat dateFormat = new SimpleDateFormat("MM-dd-yyyy");
			dateFormat.setTimeZone(TimeZone.getTimeZone("ISD"));
			dateFormat.format(date);

			java.sql.Date sqlDate = new java.sql.Date(date.getTime());
			report.setDate(sqlDate);
			report = reportdao.create(report);
			models.put("user", getUserSession());
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}
		return "redirect:/admin/viewReports";
	}

	@RequestMapping(value = "/admin/viewReports", method = RequestMethod.GET)
	public String viewReports(ModelMap m) {
		try {
			m.put("reports", reportdao.findAll());
			m.put("user", getUserSession());
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}
		return "admin/viewReports";
	}

	@RequestMapping(value = "/admin/viewReports", method = RequestMethod.POST)
	public @ResponseBody String viewReports(@RequestParam Long id) {
		try {
			ObjectMapper mapper = new ObjectMapper();
			Report report = reportdao.findById(id);
			String response = null;
			response = mapper.writeValueAsString(report);
			return response;
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return null;
		}

	}

	@RequestMapping(value = "/admin/confirmStudentDetail", method = RequestMethod.GET)
	public String confirmStudentDetail(ModelMap models) {
		try {
			models.put("hostels", hostelDao.findAll());
			models.put("hostel", new Hostel());
			models.put("user", getUserSession());
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}
		return "admin/confirmStudentDetail";
	}

	@RequestMapping(value = "/admin/studentReceipt", method = RequestMethod.GET)
	public String receipt(ModelMap models) {
		models.put("user", getUserSession());
		return "admin/studentReceipt";
	}

	@RequestMapping(value = "/admin/studentReceipt", method = RequestMethod.POST)
	public String studentReceipt(@RequestParam String email, @RequestParam String date, ModelMap models) {
		models.put("user", getUserSession());
		try {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			java.sql.Date startDate = null;
			java.sql.Date endDate = null;

			startDate = new java.sql.Date(format.parse(date.substring(0, 10)).getTime());
			endDate = new java.sql.Date(format.parse(date.substring(13, 23)).getTime());

			List<Invoice> invoices = invoiceDao.getInvoiceByUser(userDao.getUserByEmail(email), startDate, endDate);
			httpSession.setAttribute("invoices", invoices);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/admissionInvoice";
	}

	@RequestMapping(value = "/admin/viewAllReceipt")
	public String viewAllReceipt(ModelMap models) {
		models.put("user", getUserSession());
		return "admin/viewAllReceipt";
	}

	@RequestMapping(value = "admin/receipt", method = RequestMethod.POST)
	public String receipt(@RequestParam String type, @RequestParam String date, ModelMap models) {
		try {
			models.put("user", getUserSession());
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			java.sql.Date startDate = null;
			java.sql.Date endDate = null;

			startDate = new java.sql.Date(format.parse(date.substring(0, 10)).getTime());
			endDate = new java.sql.Date(format.parse(date.substring(13, 23)).getTime());
			if (type.equalsIgnoreCase("all")) {
				models.put("invoices", invoiceDao.getInvoiceByDate(startDate, endDate, getUserSession().getGender()));
				return "admin/receipt";
			}
			if (type.toUpperCase().equals("SHREE DONATION")) {
				models.put("invoices", invoiceDao.getInvoiceByType(type.toUpperCase(), startDate, endDate,
						getUserSession().getGender()));
				return "admin/receipt";

			}
			if (type.toUpperCase().equals("FOOD BILL")) {
				models.put("invoices", invoiceDao.getInvoiceByType(type.toUpperCase(), startDate, endDate,
						getUserSession().getGender()));
				return "admin/receipt";
			}
			if (type.toUpperCase().equals("DEPOSIT")) {
				models.put("invoices", invoiceDao.getInvoiceByType(type.toUpperCase(), startDate, endDate,
						getUserSession().getGender()));
				return "admin/receipt";
			} else {
				return "redirect:/admin/index";
			}

		} catch (Exception e) {
			return "redirect:/admin/index";
		}
	}

	@RequestMapping(value = "/admin/feedback")
	public String feedback(ModelMap models) {
		models.put("user", getUserSession());
		try {
			models.put("feedbacks", feedbackDao.findAll());
		} catch (SQLException e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}

		return "admin/feedback";
	}

	@RequestMapping(value = { "/admin/availableSeats", "/trustee/availableSeats" })
	public String availableSeats(ModelMap models) {
		models.put("user", getUserSession());
		try {
			List<Hostel> tempHostels = hostelDao.findAll();
			List<Hostel> hostels = new ArrayList<Hostel>();
			for (Hostel hostel : tempHostels) {
				Hostel h = hostel;
				int studentCount = studentDao.getStudentCountByHostel(h.getHostelId());
				h.setAvailableSeats(h.getSeats() - studentCount);
				hostels.add(h);
			}
			models.put("hostels", hostels);
			if (getUserSession().isUserAdmin()) {
				return "admin/availableSeats";
			} else
				return "trustee/availableSeats";
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
}
