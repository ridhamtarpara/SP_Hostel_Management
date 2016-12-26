package sspkm.models.applicant.dao.jpa;

import java.util.List;

import org.springframework.stereotype.Repository;

import sspkm.models.abstractdao.jpa.AbstractDaoImpl;
import sspkm.models.applicant.CurrentStudentApplication;
import sspkm.models.applicant.dao.CurrentStudentApplicationDao;

@Repository
public class CurrentStudentApplicationDaoImpl extends AbstractDaoImpl<CurrentStudentApplication>
		implements CurrentStudentApplicationDao {

	public CurrentStudentApplicationDaoImpl() {
		setClazz(CurrentStudentApplication.class);
	}

	@Override
	public List<CurrentStudentApplication> findStudentApplicationByType(String type) {
		String query = " from CurrentStudentApplication where type = :type";
		List<CurrentStudentApplication> application = em.createQuery(query, CurrentStudentApplication.class)
				.setParameter("type", type).getResultList();
		return application;
	}
	
	@Override
	public CurrentStudentApplication getApplicationByToken(String token) {
		String query = "from CurrentStudentApplication aa where token = :token";
		List<CurrentStudentApplication> aa = em.createQuery(query, CurrentStudentApplication.class).setParameter("token", token).getResultList();
		return aa.size() == 0 ? null : aa.get(0);
	}

}
