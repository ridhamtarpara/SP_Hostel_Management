package sspkm.models.request.dao.jpa;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Repository;

import sspkm.models.abstractdao.jpa.AbstractDaoImpl;
import sspkm.models.rector.Rector;
import sspkm.models.request.LeaveApplication;
import sspkm.models.request.dao.LeaveApplicationDao;
import sspkm.models.student.Student;

@Repository
public class LeaveApplicationDaoImpl extends AbstractDaoImpl<LeaveApplication> implements LeaveApplicationDao {
	public LeaveApplicationDaoImpl() {
		setClazz(LeaveApplication.class);
	}

	@Override
	public List<LeaveApplication> getLeaveApplicationByStudent(Student student) {
		String query = "from LeaveApplication where student=:student";

		List<LeaveApplication> leaveApplications = em.createQuery(query, LeaveApplication.class)
				.setParameter("student", student).getResultList();
		return leaveApplications;
	}

	@Override
	public List<LeaveApplication> getLeaveApplicationByRector(Rector rector) throws SQLException {
		String query = "from LeaveApplication where student in (from Student where user in (from User where gender = :gender and isActive = :isActive ))";
		List<LeaveApplication> leave = em.createQuery(query, LeaveApplication.class)
				.setParameter("gender", rector.getUser().getGender()).setParameter("isActive", true).getResultList();
		return leave;
	}

}
