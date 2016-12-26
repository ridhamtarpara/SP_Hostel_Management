package sspkm.models.admin.dao;

import java.sql.SQLException;
import java.util.List;

import sspkm.models.abstractdao.AbstractDao;
import sspkm.models.admin.Admin;

public interface AdminDao extends AbstractDao<Admin> {

	List<Admin> getAdminByGender(String gender) throws SQLException;

	List<Admin> getAllActiveAdmin() throws SQLException;
}
