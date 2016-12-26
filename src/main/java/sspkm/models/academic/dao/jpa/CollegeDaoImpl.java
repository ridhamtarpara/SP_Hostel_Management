package sspkm.models.academic.dao.jpa;

import java.util.List;

import org.springframework.stereotype.Repository;

import sspkm.models.abstractdao.jpa.AbstractDaoImpl;
import sspkm.models.academic.College;
import sspkm.models.academic.dao.CollegeDao;

@Repository
public class CollegeDaoImpl extends AbstractDaoImpl<College> implements CollegeDao {
	
	public CollegeDaoImpl() {
		setClazz(College.class);
	}

	@Override
	public List<College> getSortedList() {
		String query = "SELECT c FROM College c ORDER BY c.collegeName ASC";
		List<College> colleges = em.createQuery(query, College.class).getResultList();
		return colleges;
	}

}
