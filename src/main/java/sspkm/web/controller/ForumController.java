package sspkm.web.controller;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import sspkm.models.academic.SubCourse;
import sspkm.models.academic.dao.CourseDao;
import sspkm.models.academic.dao.SubCourseDao;
import sspkm.models.forum.Answer;
import sspkm.models.forum.Question;
import sspkm.models.forum.dao.AnswerDao;
import sspkm.models.forum.dao.QuestionDao;
import sspkm.models.user.User;
import sspkm.security.SecurityUtils;

@Controller
public class ForumController {

	private static final String home = "redirect:/student";

	@Autowired
	CourseDao courseDao;

	@Autowired
	SubCourseDao scDao;

	@Autowired
	QuestionDao questionDao;

	@Autowired
	AnswerDao answerDao;

	@Autowired
	HttpSession httpSession;

	@RequestMapping(value = "/student/forum")
	public String studentForum(ModelMap m) {
		try {
			m.put("user", getUserSession());
			m.put("courses", courseDao.getSortedList());
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}
		return "student/forum";
	}

	@RequestMapping(value = "/student/forum", method = RequestMethod.POST)
	public String studentForum(@RequestParam Long courseSelect, @RequestParam Long subCourseSelect) {
		if (subCourseSelect == (-1)) {
			return "redirect:/student/forum/home?course=" + courseSelect + "&subCourse=all";
		}
		return "redirect:/student/forum/home?course=" + courseSelect + "&subCourse=" + subCourseSelect + "";
	}

	@RequestMapping(value = "/student/forum/home")
	public String forumHome(ModelMap m, @RequestParam Long course, @RequestParam String subCourse) {
		try {
			if (subCourse.contains("all")) {
				m.put("questions", questionDao.findByCourse(course));
				m.put("course", courseDao.findById(course).getCourseName());
				m.put("subcourse", "All");

			} else {
				m.put("questions", questionDao.findBySubCourse(Long.parseLong(subCourse)));
				m.put("course", courseDao.findById(course).getCourseName());
				m.put("subcourse", scDao.findById(Long.parseLong(subCourse)).getSubCourseName());
			}
			m.put("course", courseDao.findById(course).getCourseName());
			m.put("user", getUserSession());
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}
		return "student/forum/home";
	}

	@RequestMapping(value = "/student/forum/postQuestion")
	public String postQuestion(ModelMap m) {
		try {
			m.put("user", getUserSession());
			m.put("subCourses", scDao.findAll());
			m.put("subCourse", new SubCourse());
			m.put("question", new Question());
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}
		return "student/forum/postQuestion";
	}

	@RequestMapping(value = "/student/forum/postQuestion", method = RequestMethod.POST)
	public String postQuestion(@ModelAttribute Question question, @ModelAttribute SubCourse subCourse, ModelMap m) {
		try {
			java.util.Date date = new java.util.Date();
			question.setDate(new Timestamp(date.getTime()));
			question.setStudent(getUserSession().getStudent());
			question.setSubCourse(scDao.findById(subCourse.getSubCourseId()));
			questionDao.create(question);
			m.put("user", getUserSession());
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}
		return "redirect:/student/forum/myQuestions";
	}

	@RequestMapping(value = "/student/forum/myQuestions")
	public String myQuestion(ModelMap m) {
		try {
			m.put("user", getUserSession());
			m.put("questions", questionDao.findByStudent(getUserSession().getStudent()));
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}
		return "student/forum/myQuestion";
	}

	@RequestMapping(value = "/student/forum/questionPage")
	public String questionDetail(ModelMap m, @RequestParam Long questionId) {
		try {
			m.put("question", questionDao.findById(questionId));
			m.put("user", getUserSession());
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}
		return "student/forum/questionPage";
	}

	@RequestMapping(value = "/student/forum/questionPage", method = RequestMethod.POST)
	public String questionDetail(ModelMap m, @RequestParam String answer, @RequestParam Long questionId) {
		try {
			Answer ans = new Answer();
			java.util.Date date = new java.util.Date();
			ans.setAnswer(answer);
			ans.setDate(new Timestamp(date.getTime()));
			ans.setQuestion(questionDao.findById(questionId));
			ans.setStudent(getUserSession().getStudent());
			answerDao.create(ans);
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}
		return "redirect:/student/forum/questionPage?questionId=" + questionId;
	}

	@RequestMapping(value = "/forum/getSubcourse")
	public @ResponseBody String subCourse(@RequestParam Long courseId) {
		try {
			List<SubCourse> subCourseList = scDao.findByCourseId(courseId);
			ObjectMapper om = new ObjectMapper();
			String output = "";
			try {
				output = om.writeValueAsString(subCourseList);
			} catch (JsonProcessingException e) {
				e.printStackTrace();
			}

			return output;
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return null;
		}
	}

	public ForumController() {

	}

	public User getUserSession() {
		User user = SecurityUtils.getUser();
		return user;
	}

}
