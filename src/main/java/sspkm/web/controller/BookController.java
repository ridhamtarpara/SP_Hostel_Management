package sspkm.web.controller;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import sspkm.models.bookportal.Book;
import sspkm.models.bookportal.dao.BookDao;
import sspkm.models.file.dao.FileDao;
import sspkm.models.user.User;
import sspkm.security.SecurityUtils;

@Controller
public class BookController {

	private static final String home = "redirect:/student";

	@Autowired
	BookDao bookDao;

	@Autowired
	private HttpSession httpSession;

	@Autowired
	FileDao fileDao;

	@RequestMapping(value = "/student/bookPortal")
	public String studentBookPortal(ModelMap m, HttpServletRequest request) {
		try {
			List<Book> books = bookDao.findAll();
			PagedListHolder<Book> pagedListHolder = new PagedListHolder<Book>(books);
			int page = ServletRequestUtils.getIntParameter(request, "p", 0);
			pagedListHolder.setPage(page);
			pagedListHolder.setPageSize(9);
			m.put("pagedListHolder", pagedListHolder);
			m.put("user", getUserSession());
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}
		return "student/bookPortal";
	}

	@RequestMapping(value = "/student/bookPortalList")
	public String studentBookPortalList(ModelMap m) {
		try {
			List<Book> books = bookDao.findAll();
			m.put("user", getUserSession());
			m.put("books", books);
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}
		return "student/bookPortalList";
	}

	@RequestMapping(value = "/student/addBook")
	public String addBook(ModelMap m) {
		m.put("book", new Book());
		m.put("user", getUserSession());
		return "student/addBook";
	}

	@RequestMapping(value = "/student/addBook", method = RequestMethod.POST)
	public String addBook(@Valid @ModelAttribute Book book, @RequestParam MultipartFile bookimage,
			BindingResult bindingResult, ModelMap models) {
		try {
			if (bindingResult.hasErrors()) {
				return "/student/addBook";
			}
			models.put("user", getUserSession());
			if (((bookimage.getContentType().equals("image/jpeg")) || (bookimage.getContentType().equals("image/png")))
					&& bookimage.getSize() <= 524288) {

				book.setDate(new Date(new java.util.Date().getTime()));
				book.setStudent(getUserSession().getStudent());
				book.setCourse(getUserSession().getStudent().getCourse());
				book = bookDao.create(book);

				String imageName = fileDao.saveFile(bookimage, "books", "book_" + book.getBookId(), 380, 320);
				if (imageName.equals("error")) {
					bindingResult.addError(
							new ObjectError("imageerror", "Error in uploading image please try after sometime"));
					return "redirect:/student/bookPortal";
				}
			} else {
				if (bookimage.getSize() > 524288) {
					bindingResult.addError(new FieldError("book", "bookId",
							"Image Size(" + bookimage.getSize() / 1024 + " KB) larger than 500 KB"));
				} else
					bindingResult.addError(
							new FieldError("book", "bookId", "Invalid Image!! Only jpg,jpeg and png files allowed"));
				return "student/addBook";
			}
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}
		return "redirect:/student/myBooks";
	}

	@RequestMapping(value = "/student/books/{id}")
	public String detailBookPath(@PathVariable Long id, ModelMap m) {
		try {
			m.put("user", getUserSession());
			m.put("book", bookDao.findById(id));
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}
		return "student/detailBook";
	}

	@RequestMapping(value = "/student/myBooks")
	public String myBooks(ModelMap m) {
		try {
			List<Book> myBooks = bookDao.getMyBooks(getUserSession().getStudent().getStudentId());
			m.put("user", getUserSession());
			m.put("myBooks", myBooks);
		} catch (Exception e) {
			httpSession.setAttribute("error", "Sorry For inconvience !! Something went wrong please try again later.");
			e.printStackTrace();
			return home;
		}
		return "student/myBooks";
	}

	@RequestMapping(value = "/student/removeBook/{id}")
	public String removeBook(@PathVariable Long id, ModelMap m) {
		try {
			Book b = bookDao.findById(id);
			if ((b.getStudent().getStudentId()) == (getUserSession().getStudent().getStudentId())) {
				fileDao.deleteServerFile("books", "book_" + id);
				bookDao.delete(b);
				return "redirect:/student/myBooks";
			} else {
				httpSession.setAttribute("error", "You can only delete your books");
				return "redirect:/student/myBooks";
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

}
