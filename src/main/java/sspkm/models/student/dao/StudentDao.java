package sspkm.models.student.dao;

import java.sql.SQLException;
import java.util.List;

import sspkm.models.abstractdao.AbstractDao;
import sspkm.models.student.Student;

public interface StudentDao extends AbstractDao<Student> {

	List<Student> getStudentsByGender(String gender) throws SQLException;

	void updateAllStudent(boolean status) throws SQLException;

	void delectStudent(boolean status) throws SQLException;

	void deleteStudentById(long id) throws SQLException;

	List<Student> getStudentByHostel(Long hostelId) throws SQLException;
	
	int getStudentCountByHostel(Long hostelId) throws SQLException;
}