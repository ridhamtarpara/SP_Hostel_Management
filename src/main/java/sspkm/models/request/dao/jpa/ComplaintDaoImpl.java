package sspkm.models.request.dao.jpa;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Repository;

import sspkm.models.abstractdao.jpa.AbstractDaoImpl;
import sspkm.models.rector.Rector;
import sspkm.models.request.Complaint;
import sspkm.models.request.dao.ComplaintDao;
import sspkm.models.student.Student;

@Repository
public class ComplaintDaoImpl extends AbstractDaoImpl<Complaint> implements ComplaintDao {
	public ComplaintDaoImpl() {
		setClazz(Complaint.class);
	}

	@Override
	public List<Complaint> getComplaintByStudent(Student student) {
		String query = "from Complaint where student=:student";

		List<Complaint> complaints = em.createQuery(query, Complaint.class).setParameter("student", student)
				.getResultList();
		return complaints;
	}

	@Override
	public List<Complaint> getComplaintByRector(Rector rector) throws SQLException {
		String query = "from Complaint where student in(from Student where user in (from User where gender = :gender and isActive = :isActive ))";
		List<Complaint> complaints = em.createQuery(query, Complaint.class)
				.setParameter("gender", rector.getUser().getGender()).setParameter("isActive", true).getResultList();
		return complaints;
	}

}
