package sspkm.models.bookportal.dao;

import java.sql.SQLException;
import java.util.List;

import sspkm.models.abstractdao.AbstractDao;
import sspkm.models.bookportal.Book;

public interface BookDao extends AbstractDao<Book>{

	List<Book> getMyBooks(Long studentid) throws SQLException;
	
}
