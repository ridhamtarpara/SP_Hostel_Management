package sspkm.models.forum.dao;

import java.sql.SQLException;
import java.util.List;

import sspkm.models.abstractdao.AbstractDao;
import sspkm.models.forum.Question;
import sspkm.models.student.Student;

public interface QuestionDao extends AbstractDao<Question>{
	
	List<Question> findByCourse(Long courseId) throws SQLException;
	
	List<Question> findBySubCourse(Long subCourseId) throws SQLException;
	
	List<Question> findByStudent(Student student) throws SQLException;
}
