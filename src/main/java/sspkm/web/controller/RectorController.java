package sspkm.web.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import sspkm.models.activity.Activity;
import sspkm.models.activity.dao.ActivityDao;
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
import sspkm.security.SecurityUtils;

@Controller
public class RectorController {

	private static final String home = "redirect:/rector";

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
	private ActivityDao activityDao;

	@Autowired
	private HttpSession httpSession;

	@RequestMapping(value = { "/rector/index", "/rector" })
	public String rectorIndex(ModelMap models) {
		User user = getUserSession();
		try {
			models.put("user", user);

			List<Activity> news = new ArrayList<Activity>();
			List<Activity> notice = new ArrayList<Activity>();

			List<Activity> activities = activityDao.findAll();

			int activity = 0;
			for (Activity a : activities) {

				if (a.getRector().getUser().getGender().equals(user.getGender()) && a.getType().equals("News")) {
					news.add(a);
					activity++;
				} else if (a.getRector().getUser().getGender().equals(user.getGender())
						&& a.getType().equals("Notice")) {
					notice.add(a);
					activity++;
				} else if (a.getRector().getUser().getGender().equals(user.getGender())
						&& a.getType().equals("Event")) {
					activity++;
				}

			}

			List<Complaint> complaints = complaintDao.getComplaintByRector(user.getRector());
			List<LeaveApplication> leaveApplications = leaveApplicationDao
					.getLeaveApplicationByRector(user.getRector());
			List<VehicleRegister> vehicles = vehicleRegisterDao.getVehicleByRector(user.getRector());
			List<Achievement> achievements = achievementDao.getAchievementByRector(user.getRector());
			List<Student> students = studentDao.getStudentsByGender(user.getGender());

			models.put("news", news);
			models.put("notice", notice);
			models.put("complaints", complaints.size());
			models.put("leave", leaveApplications.size());
			models.put("vehicle", vehicles.size());
			models.put("achievement", achievements.size());
			models.put("students", students.size());
			models.put("activities", activity);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "rector/index";
	}

	@RequestMapping(value = "/rector/profile")
	public String adminProfile(ModelMap models) {
		models.put("user", getUserSession());
		return "rector/profile";
	}

	@RequestMapping(value = "/rector/viewRequest")
	public String viewLeaveRequest(ModelMap models) {
		User user = getUserSession();
		try {

			models.put("leaveApplications", leaveApplicationDao.getLeaveApplicationByRector(user.getRector()));
			models.put("complaints", complaintDao.getComplaintByRector(user.getRector()));
			models.put("vehicleRegisters", vehicleRegisterDao.getVehicleByRector(user.getRector()));
			models.put("achievements", achievementDao.getAchievementByRector(user.getRector()));
			models.put("user", user);
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}
		return "rector/viewRequest";
	}

	@RequestMapping(value = "/rector/approveStudentLeaveRequest")
	public String approveStudentLeaveRequest(@RequestParam long id) {
		try {
			LeaveApplication leaveapplication = leaveApplicationDao.findById(id);
			leaveapplication.setStatus("Approved");
			leaveapplication = leaveApplicationDao.update(leaveapplication);
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}
		return "redirect:viewRequest";
	}

	@RequestMapping(value = "/rector/approveStudentComplaintRequest")
	public String approveStudentComplaintRequest(@RequestParam long id) {
		try {
			Complaint complaint = complaintDao.findById(id);
			complaint.setStatus("Approved");
			complaint = complaintDao.update(complaint);
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}
		return "redirect:viewRequest";
	}

	@RequestMapping(value = "/rector/approveStudentVehicleRequest")
	public String approveStudentVehicleRequest(@RequestParam long id) {
		try {
			VehicleRegister vehicleRegister = vehicleRegisterDao.findById(id);
			vehicleRegister.setStatus("Approved");
			vehicleRegister = vehicleRegisterDao.update(vehicleRegister);
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}
		return "redirect:viewRequest";
	}

	@RequestMapping(value = "/rector/approveStudentAchievementRequest")
	public String approveStudentAchievementRequest(@RequestParam long id) {
		try {
			Achievement achievement = achievementDao.findById(id);
			achievement.setStatus("Approved");
			achievement = achievementDao.update(achievement);
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}
		return "redirect:viewRequest";
	}

	@RequestMapping(value = "/rector/addActivities")
	public String addActivities(ModelMap m) {
		m.put("acitivity", new Activity());
		m.put("user", getUserSession());
		return "rector/addActivities";
	}

	@RequestMapping(value = "/rector/addActivities", method = RequestMethod.POST)
	public String addActivities(@ModelAttribute Activity activity, BindingResult bindingResult, ModelMap models) {
		try {
			activity.setRector(getUserSession().getRector());
			activity = activityDao.create(activity);
			models.put("user", getUserSession());
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}
		return "admin/successPage";
	}

	@RequestMapping(value = "/rector/viewActivities", method = RequestMethod.GET)
	public String viewActivities(ModelMap m) {
		try {
			m.put("activities", activityDao.findAll());
			m.put("user", getUserSession());
			return "rector/viewActivities";
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}
	}

	@RequestMapping(value = "/rector/viewActivities", method = RequestMethod.POST)
	public @ResponseBody String viewActivities(@RequestParam Long id) {
		try {
			ObjectMapper mapper = new ObjectMapper();
			Activity a = activityDao.findById(id);
			String response = null;

			response = mapper.writeValueAsString(a);

			return response;
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return null;
		}

	}

	public User getUserSession() {
		User user = SecurityUtils.getUser();
		return user;
	}
}
