package sspkm.models.applicant.dao;

import java.sql.SQLException;
import java.util.List;

import sspkm.models.abstractdao.AbstractDao;
import sspkm.models.applicant.CurrentStudentApplication;

public interface CurrentStudentApplicationDao extends AbstractDao<CurrentStudentApplication> {

	public List<CurrentStudentApplication> findStudentApplicationByType(String type) throws SQLException;

	public CurrentStudentApplication getApplicationByToken(String token);
}
