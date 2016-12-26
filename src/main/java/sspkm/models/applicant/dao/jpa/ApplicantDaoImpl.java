package sspkm.models.applicant.dao.jpa;

import java.util.List;

import org.springframework.stereotype.Repository;

import sspkm.models.abstractdao.jpa.AbstractDaoImpl;
import sspkm.models.applicant.Applicant;
import sspkm.models.applicant.ApplicantApplication;
import sspkm.models.applicant.dao.ApplicantDao;

@Repository
public class ApplicantDaoImpl extends AbstractDaoImpl<Applicant> implements ApplicantDao {

	public ApplicantDaoImpl() {
		setClazz(Applicant.class);
	}

	@Override
	public ApplicantApplication checkOut(Long applicationId) {

		ApplicantApplication aa = em.find(ApplicantApplication.class, applicationId);
		return aa;
	}

	@Override
	public List<Applicant> getApplicantsByGender(String gender) {
		String q = "from Applicant where user in ( from User where gender = :gender)";
		List<Applicant> applicants = em.createQuery(q, Applicant.class).setParameter("gender", gender).getResultList();
		return applicants;
	}

	@Override
	public List<Applicant> getApprovedApplicant(String gender) {
		String q = "from Applicant where application in ( from ApplicantApplication where status = :status)";
		List<Applicant> applicants = em.createQuery(q, Applicant.class).setParameter("status", "Approved").getResultList();
		return applicants;
	}

}
