package sspkm.models.academic.dao;

import java.sql.SQLException;
import java.util.List;

import sspkm.models.abstractdao.AbstractDao;
import sspkm.models.academic.SubCourse;

public interface SubCourseDao extends AbstractDao<SubCourse> {

	List<SubCourse> findByCourseId(Long courseId) throws SQLException;

	
	public List<SubCourse> getSortedList();
}
