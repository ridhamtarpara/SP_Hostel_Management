package sspkm.web.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import sspkm.models.user.User;
import sspkm.models.user.UserSearchModel;
import sspkm.models.user.dao.UserDao;
import sspkm.security.SecurityUtils;

@Controller
public class UserController {

	@Autowired
	private UserDao userDao;

	@Autowired
	private HttpSession httpSession;

	@RequestMapping(value = "/user", method = RequestMethod.POST)
	public @ResponseBody String searchUser(@RequestParam String name) {
		String output = null;
		User currentUser = getUserSession();
		List<UserSearchModel> usm = new ArrayList<UserSearchModel>();
		try {
			List<User> users = userDao.getUserByName(name, currentUser.getGender());
			for (User user : users) {
				if (!user.isUserApplicant() && (user.getUserId() != currentUser.getUserId())&&user.isEvaluator()) {
					UserSearchModel u = new UserSearchModel();
					u.setName(user.getFirstName() + " " + user.getLastName());
					u.setUserId(user.getUserId());
					usm.add(u);
				}
			}
			ObjectMapper om = new ObjectMapper();
			if (usm.isEmpty()) {
				usm.add(new UserSearchModel(-99L, "No Result"));
			}
			output = om.writeValueAsString(usm);

		} catch (NullPointerException e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			if (currentUser.isUserAdmin()) {
				return "redirect:/admin";
			} else if (currentUser.isUserRector()) {
				return "redirect:/rector";
			} else if (currentUser.isUserTrustee()) {
				return "redirect:/trustee";
			}else {
				return "redirect:/student";
			}
		} catch (JsonProcessingException e1) {
			e1.printStackTrace();
			return null;
		} catch (SQLException e2) {
			e2.printStackTrace();
		}
		return output;

	}

	@RequestMapping(value = { "student/searchuser/profile", "rector/searchuser/profile",
			"admin/searchuser/profile" }, method = RequestMethod.POST)
	public String userProfile(@RequestParam Long id) {
		if (id != null) {
			if (getUserSession().isUserAdmin()) {
				return "redirect:/admin/searchuser/profile?userid=" + id;
			} else if (getUserSession().isUserRector()) {
				return "redirect:/rector/searchuser/profile?userid=" + id;
			} else if (getUserSession().isUserTrustee()) {
				return "redirect:/trustee/searchuser/profile?userid=" + id;
			} else {
				return "redirect:/student/searchuser/profile?userid=" + id;
			}
		} else
			return "400";
	}

	@RequestMapping(value = { "admin/searchuser/profile", "rector/searchuser/profile",
			"student/searchuser/profile" }, method = RequestMethod.GET)
	public String searchProfile(@RequestParam Long userid, ModelMap m) {
		User currentUser = getUserSession();
		try {
			User u = userDao.findById(userid);
			if (u != null) {
				if (u.getUserId() == currentUser.getUserId()) {
					if (currentUser.isUserAdmin()) {
						return "redirect:/admin/profile";
					} else if (currentUser.isUserRector()) {
						return "redirect:/rector/profile";
					} else if (currentUser.isUserTrustee()) {
						return "redirect:/trustee/profile";
					} else {
						return "redirect:/student/profile";
					}
				}

				if ((currentUser.getGender().equals(u.getGender())) && (u.isEvaluator()) && (!u.isUserApplicant())) {
					m.put("user", currentUser);
					m.put("searchUser", u);
					if (currentUser.isUserAdmin()) {
						return "admin/searchuser/profile";
					} else if (currentUser.isUserRector()) {
						return "rector/searchuser/profile";
					} else if (currentUser.isUserTrustee()) {
						return "trustee/searchuser/profile";
					}else {
						return "student/searchuser/profile";
					}
				} else {
					httpSession.setAttribute("illegal", true);
					if (currentUser.isUserAdmin()) {
						return "redirect:/admin/profile";
					} else if (currentUser.isUserRector()) {
						return "redirect:/rector/profile";
					} else if (currentUser.isUserTrustee()) {
						return "redirect:/trustee/profile";
					} else {
						return "redirect:/student/profile";
					}
				}
			} else {
				httpSession.setAttribute("illegal", true);
				if (currentUser.isUserAdmin()) {
					return "redirect:/admin/profile";
				} else if (currentUser.isUserRector()) {
					return "redirect:/rector/profile";
				}else if (currentUser.isUserTrustee()) {
					return "redirect:/trustee/profile";
				} else {
					return "redirect:/student/profile";
				}
			}
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			if (currentUser.isUserAdmin()) {
				return "redirect:/admin";
			} else if (currentUser.isUserRector()) {
				return "redirect:/rector";
			} else if (currentUser.isUserTrustee()) {
				return "redirect:/trustee";
			} else {
				return "redirect:/student";
			}
		}

	}

	public User getUserSession() {
		User user = SecurityUtils.getUser();
		return user;
	}
}
