package sspkm.web.controller;

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

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import sspkm.models.hostel.GlobalParam;
import sspkm.models.hostel.Hostel;
import sspkm.models.hostel.Room;
import sspkm.models.hostel.dao.GlobalParamDao;
import sspkm.models.hostel.dao.HostelDao;
import sspkm.models.hostel.dao.RoomDao;
import sspkm.models.student.dao.StudentDao;
import sspkm.models.user.User;
import sspkm.security.SecurityUtils;

@Controller
public class HostelController {
	private static final String home = "redirect:/admin";

	@Autowired
	private HostelDao hostelDao;

	// @Autowired
	// private ApplicantDao applicantDao;

	@Autowired
	private RoomDao roomDao;
	
	@Autowired
	private StudentDao studentDao;

	@Autowired
	GlobalParamDao globalParamDao;

	@Autowired
	private HttpSession httpSession;

	@RequestMapping(value = "/admin/setAdmissionDetail", method = RequestMethod.GET)
	public String setAdmissionDetail(ModelMap models) {
		try {
			models.put("user", getUserSession());
			models.put("hostels", hostelDao.findAll());
			models.put("hostel", new Hostel());
			GlobalParam g = globalParamDao.findById(1);
			httpSession.setAttribute("globalParam", g);
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}
		return "admin/setAdmissionDetail";
	}

	@RequestMapping(value = "/admin/updateAdmissionStatus", method = RequestMethod.POST)
	public String updateAdmissionStatus(@RequestParam boolean status) {

		try {
			GlobalParam g = (GlobalParam) httpSession.getAttribute("globalParam");
			g.setAdmissionOn(status);
			if (status) {
				studentDao.updateAllStudent(!status);
				roomDao.setRoomCountZero();
			}else{
			studentDao.delectStudent(status);
			httpSession.setAttribute("error", "You have stoped admission process");
			}
			globalParamDao.update(g);
			return "redirect:setAdmissionDetail";
			
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;

		}
	}

	@RequestMapping(value = "/admin/setAdmissionDetail", method = RequestMethod.POST)
	public String setAdmissionDetail(@ModelAttribute Hostel hostel, BindingResult bindingResult, ModelMap models) {
		try {
			models.put("user", getUserSession());
			hostelDao.updateHostel(hostel);
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}

		return "admin/successPage";
	}

	@RequestMapping(value = "/admin/getHostel", method = RequestMethod.POST)
	public @ResponseBody String getHostel(@RequestParam Long id) {
		try {

			ObjectMapper mapper = new ObjectMapper();
			Hostel h = hostelDao.findById(id);
			String response = null;
			try {
				response = mapper.writeValueAsString(h);
			} catch (JsonProcessingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return response;
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return null;
		}
	}

	@RequestMapping(value = "/admin/getRooms", method = RequestMethod.POST)
	public @ResponseBody String getRooms(@RequestParam Long applicantId, @RequestParam Long hostelId) {
		try {
			ObjectMapper mapper = new ObjectMapper();
			Hostel h = hostelDao.findById(hostelId);
			List<Room> rooms = roomDao.fingByHostel(h);
			String response = null;
			response = mapper.writeValueAsString(rooms);
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
