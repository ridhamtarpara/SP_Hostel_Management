package sspkm.models.bookportal.dao.jpa;

import java.util.List;

import org.springframework.stereotype.Repository;

import sspkm.models.abstractdao.jpa.AbstractDaoImpl;
import sspkm.models.bookportal.Book;
import sspkm.models.bookportal.dao.BookDao;

@Repository
public class BookDaoImpl extends AbstractDaoImpl<Book> implements BookDao {

	public BookDaoImpl() {
		setClazz(Book.class);
	}

	@Override
	public List<Book> getMyBooks(Long studentid) {
		String query = "from Book where studentid=:sid";
		List<Book> users = em.createQuery(query, Book.class).setParameter("sid", studentid).getResultList();
		return users;
	}

}
