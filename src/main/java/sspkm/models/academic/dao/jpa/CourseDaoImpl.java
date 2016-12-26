package sspkm.models.academic.dao.jpa;

import java.util.List;

import org.springframework.stereotype.Repository;

import sspkm.models.abstractdao.jpa.AbstractDaoImpl;
import sspkm.models.academic.Course;
import sspkm.models.academic.dao.CourseDao;

@Repository
public class CourseDaoImpl extends AbstractDaoImpl<Course> implements CourseDao {
	
	
	public CourseDaoImpl() {
		setClazz(Course.class);

	}

	@Override
	public List<Course> getSortedList() {
		String query = "SELECT c FROM Course c ORDER BY c.courseName ASC";
		List<Course> courses = em.createQuery(query, Course.class).getResultList();
		return courses;
	}
}
