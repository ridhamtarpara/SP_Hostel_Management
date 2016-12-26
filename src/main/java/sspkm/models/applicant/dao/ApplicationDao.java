package sspkm.models.applicant.dao;

import sspkm.models.abstractdao.AbstractDao;
import sspkm.models.applicant.ApplicantApplication;

public interface ApplicationDao extends AbstractDao<ApplicantApplication> {

	ApplicantApplication getApplicationByToken(String token);
	
}
