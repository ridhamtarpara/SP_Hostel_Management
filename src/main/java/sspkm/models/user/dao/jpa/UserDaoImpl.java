package sspkm.models.user.dao.jpa;

import java.sql.SQLException;
import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import sspkm.models.abstractdao.jpa.AbstractDaoImpl;
import sspkm.models.user.User;
import sspkm.models.user.dao.UserDao;

@Repository
public class UserDaoImpl extends AbstractDaoImpl<User> implements UserDao {

	public UserDaoImpl() {
		setClazz(User.class);
	}

	public User getUserByEmail(String email) {
		String query = "from User user left join fetch user.roles " + "where lower(email) = :email";
		List<User> users = em.createQuery(query, User.class).setParameter("email", email.toLowerCase()).getResultList();
		return users.size() == 0 ? null : users.get(0);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> getUserByName(String name, String gender) {
		String query = "SELECT us FROM User us WHERE us.userId NOT IN (SELECT appl.user.userId FROM Applicant appl) AND us.gender = ?1 AND (us.firstName LIKE ?2 OR us.lastName LIKE ?3)";
		Query q = em.createQuery(query);
		q.setParameter(1, gender);
		q.setParameter(2, "%" + name.toUpperCase() + "%");
		q.setParameter(3, "%" + name.toUpperCase() + "%");
		List<User> users = q.getResultList();
		return users;
	}

	@Override
	public User getUserByFirstName(String firstName, String lastName) {
		String query = "from User where firstName like :firstName AND lastName like :lastName";

		List<User> users = em.createQuery(query, User.class).setParameter("firstName", firstName.toUpperCase())
				.setParameter("lastName", lastName.toUpperCase()).getResultList();

		return users.size() == 0 ? null : users.get(0);
	}

	@Override
	public boolean updatePassword(String password) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	
}
