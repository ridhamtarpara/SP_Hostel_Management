package sspkm.models.request.dao;

import java.sql.SQLException;
import java.util.List;

import sspkm.models.abstractdao.AbstractDao;
import sspkm.models.rector.Rector;
import sspkm.models.request.Complaint;
import sspkm.models.student.Student;

public interface ComplaintDao extends AbstractDao<Complaint> {

	List<Complaint> getComplaintByStudent(Student student) throws SQLException;

	List<Complaint> getComplaintByRector(Rector rector) throws SQLException;

}
