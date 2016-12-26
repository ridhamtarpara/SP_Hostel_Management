package sspkm.models.academic.dao.jpa;

import java.util.List;

import org.springframework.stereotype.Repository;

import sspkm.models.abstractdao.jpa.AbstractDaoImpl;
import sspkm.models.academic.SubCourse;
import sspkm.models.academic.dao.SubCourseDao;

@Repository
public class SubcourseDaoImpl extends AbstractDaoImpl<SubCourse> implements SubCourseDao {

	public SubcourseDaoImpl() {
		setClazz(SubCourse.class);
	}

	@Override
	public List<SubCourse> findByCourseId(Long courseId) {
		String query = "From SubCourse sc where courseId=:courseId ORDER BY sc.subCourseName ASC";
		List<SubCourse> scList = em.createQuery(query, SubCourse.class).setParameter("courseId", courseId).getResultList();
		return scList;
	}

	@Override
	public List<SubCourse> getSortedList() {
		String query = "SELECT sc FROM SubCourse sc ORDER BY sc.subCourseName ASC";
		List<SubCourse> courses = em.createQuery(query, SubCourse.class).getResultList();
		return courses;
	}
	
}
