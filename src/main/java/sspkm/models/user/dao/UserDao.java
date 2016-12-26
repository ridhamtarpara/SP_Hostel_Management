package sspkm.models.user.dao;

import java.sql.SQLException;
import java.util.List;

import sspkm.models.abstractdao.AbstractDao;
import sspkm.models.user.User;

public interface UserDao extends AbstractDao<User> {

	User getUserByEmail(String email) throws SQLException;

	List<User> getUserByName(String name, String gender) throws SQLException;

	User getUserByFirstName(String firstName, String lastName) throws SQLException;

	boolean updatePassword(String password) throws SQLException;
}
