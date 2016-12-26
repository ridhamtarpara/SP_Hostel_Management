package sspkm.models.applicant.dao.jpa;

import java.util.List;

import org.springframework.stereotype.Repository;

import sspkm.models.abstractdao.jpa.AbstractDaoImpl;
import sspkm.models.applicant.ApplicantApplication;
import sspkm.models.applicant.dao.ApplicationDao;

@Repository
public class ApplicationDaoImpl extends AbstractDaoImpl<ApplicantApplication> implements ApplicationDao {

	public ApplicationDaoImpl() {
		setClazz(ApplicantApplication.class);
	}

	@Override
	public ApplicantApplication getApplicationByToken(String token) {
		String query = "from ApplicantApplication aa where token = :token";
		List<ApplicantApplication> aa = em.createQuery(query, ApplicantApplication.class).setParameter("token", token).getResultList();
		return aa.size() == 0 ? null : aa.get(0);
	}
	
}
