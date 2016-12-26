package sspkm.models.request.dao;

import java.sql.SQLException;
import java.util.List;

import sspkm.models.abstractdao.AbstractDao;
import sspkm.models.rector.Rector;
import sspkm.models.request.LeaveApplication;
import sspkm.models.student.Student;

public interface LeaveApplicationDao extends AbstractDao<LeaveApplication>{

	List<LeaveApplication> getLeaveApplicationByStudent(Student student) throws SQLException;

	List<LeaveApplication> getLeaveApplicationByRector(Rector rector) throws SQLException;
}
