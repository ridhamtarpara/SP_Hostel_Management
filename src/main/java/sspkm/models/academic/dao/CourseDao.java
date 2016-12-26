package sspkm.models.academic.dao;

import java.util.List;

import sspkm.models.abstractdao.AbstractDao;
import sspkm.models.academic.Course;

public interface CourseDao extends AbstractDao<Course> {

	List<Course> getSortedList();
	
}
