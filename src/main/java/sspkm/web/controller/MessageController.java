package sspkm.web.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import sspkm.models.message.Message;
import sspkm.models.message.MessageMaster;
import sspkm.models.message.dao.MessageDao;
import sspkm.models.message.dao.MessageMasterDao;
import sspkm.models.user.User;
import sspkm.models.user.dao.UserDao;
import sspkm.security.SecurityUtils;

@Controller
public class MessageController {

	@Autowired
	HttpSession httpSession;

	@Autowired
	MessageMasterDao mmdao;

	@Autowired
	MessageDao messageDao;

	@Autowired
	UserDao userDao;

	@RequestMapping(value = "/student/myMessages")
	public String myMessages(ModelMap m, @RequestParam String userId) {
		User currentUser = getUserSession();
		MessageMaster mm = new MessageMaster();
		try {
			if (userId.equals("all")) {
				m.put("pagetype", "all");
			} else {
				try {
					if (((Long) currentUser.getUserId()).equals(Long.parseLong(userId))) {
						return "redirect:/student/profile";
					}
					m.put("userId", Long.parseLong(userId));
				} catch (Exception e) {
					return "400";
				}
				List<MessageMaster> chat = mmdao.findChat(currentUser.getUserId(), Long.parseLong(userId));
				if (chat.isEmpty()) {
					User receiver = userDao.findById(Long.parseLong(userId));
					mm.setMessageFrom(currentUser);
					mm.setMessageTo(receiver);
					mm = mmdao.create(mm);
				} else {
					mm = chat.get(0);
				}
				if (!(mm.getMessageTo().getGender()).equals(currentUser.getGender())) {
					httpSession.setAttribute("error", "Invalid Request");
					return "redirect:/student/";
				}
				if (mm.getMessageTo().getStudent() == null || mm.getMessageFrom().getStudent() == null) {
					httpSession.setAttribute("error", "Invalid Request");
					return "redirect:/student/";
				}
				httpSession.setAttribute("messageMaster", mm);
				List<Message> messages = messageDao.findAllByChat(mm.getChatId());
				m.put("messages", messages);
				List<MessageMaster> allChats = mmdao.findAllChat(currentUser.getUserId());
				Collections.sort(allChats, new Comparator<MessageMaster>() {
					public int compare(MessageMaster o1, MessageMaster o2) {
						if (o1.getMessages() != null && o2.getMessages() != null) {
							if ((o1.getMessages().size() != 0) && (o2.getMessages().size() != 0)) {
								return o2.getMessages().get(0).getTime().compareTo(o1.getMessages().get(0).getTime());
							} else
								return 0;
						} else {
							return 0;
						}
					}
				});
				m.put("allChats", allChats);
			}
			m.put("user", currentUser);
			return "student/myMessages";
		} catch (Exception e) {
			e.printStackTrace();
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			return "redirect:/student/";
		}
	}

	@RequestMapping(value = "/student/myMessages", method = RequestMethod.POST)
	public String myMessages(ModelMap m, @RequestParam String message, @RequestParam Long userId) {
		try {
			User currentUser = getUserSession();
			MessageMaster mm = (MessageMaster) httpSession.getAttribute("messageMaster");
			Message msg = new Message();
			msg.setMessage(message);
			msg.setMessageMaster(mm);
			msg.setSender(currentUser);
			msg.setTime(new Timestamp(new java.util.Date().getTime()));
			messageDao.create(msg);
			m.put("user", getUserSession());
			return "redirect:/student/myMessages?userId=" + userId;
		} catch (Exception e) {
			e.printStackTrace();
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			return "redirect:/student/";
		}
	}

	@RequestMapping(value = "/student/allMessages", method = RequestMethod.POST)
	public @ResponseBody String allMessages(ModelMap m) {
		String output = "";
		try {
			User currentUser = getUserSession();
			List<MessageMaster> allChats = mmdao.findAllChat(currentUser.getUserId());
			if(!allChats.isEmpty()){
			Collections.sort(allChats, new Comparator<MessageMaster>() {
				public int compare(MessageMaster o1, MessageMaster o2) {
					if (o1.getMessages() != null && o2.getMessages() != null) {
						if ((o1.getMessages().size() != 0) && (o2.getMessages().size() != 0)) {
							return o2.getMessages().get(0).getTime().compareTo(o1.getMessages().get(0).getTime());
						} else
							return 0;
					} else {
						return 0;
					}
				}
			});
			List<MessageMaster> outputList=new ArrayList<MessageMaster>();
			for (MessageMaster messageMaster : allChats) {
				MessageMaster msgMaster=new MessageMaster();
				User messageSender=new User();
				if(messageMaster.getMessageFrom().getUserId()!=getUserSession().getUserId()){
					messageSender=messageMaster.getMessageFrom();
				}else{
					messageSender=messageMaster.getMessageTo();
				}
				msgMaster.setMessageFrom(messageSender);
				Message lastMessage=messageMaster.getMessages().get(0);
				List<Message> lastMessageList=new ArrayList<Message>();
				lastMessageList.add(lastMessage);
				msgMaster.setMessages(lastMessageList);
				outputList.add(msgMaster);
			}
			ObjectMapper om = new ObjectMapper();
			output = om.writeValueAsString(outputList);
			return output;}
			else
				return "[]";
		} catch (Exception e) {
			e.printStackTrace();
			return output;
		}
	}

	public User getUserSession() {
		User user = SecurityUtils.getUser();
		return user;
	}
}
