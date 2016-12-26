package sspkm.models.applicant.dao;

import java.sql.SQLException;
import java.util.List;

import sspkm.models.abstractdao.AbstractDao;
import sspkm.models.applicant.Applicant;
import sspkm.models.applicant.ApplicantApplication;

public interface ApplicantDao extends AbstractDao<Applicant> {

	public ApplicantApplication checkOut(Long applicationId) throws SQLException;

	List<Applicant> getApplicantsByGender(String gender) throws SQLException;

	List<Applicant> getApprovedApplicant(String gender) throws SQLException;

}
