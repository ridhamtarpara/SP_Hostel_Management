package sspkm.models.admin.dao.jpa;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Repository;

import sspkm.models.abstractdao.jpa.AbstractDaoImpl;
import sspkm.models.admin.Admin;
import sspkm.models.admin.dao.AdminDao;

@Repository
public class AdminDaoImpl extends AbstractDaoImpl<Admin> implements AdminDao {

	public AdminDaoImpl() {
		setClazz(Admin.class);
	}

	@Override
	public List<Admin> getAdminByGender(String gender) {
		String query = "from Admin where user in ( from User where gender = :gender AND isActive = :isActive )";
		List<Admin> admins = em.createQuery(query, Admin.class).setParameter("gender", gender)
				.setParameter("isActive", true).getResultList();
		return admins;
	}

	@Override
	public List<Admin> getAllActiveAdmin() throws SQLException {
		String query = "from Admin where user in ( from User where isActive = :isActive )";
		List<Admin> admins = em.createQuery(query, Admin.class).setParameter("isActive", true).getResultList();
		return admins;
	}

}
