package sspkm.models.student.dao.jpa;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import sspkm.models.abstractdao.jpa.AbstractDaoImpl;
import sspkm.models.student.Student;
import sspkm.models.student.dao.StudentDao;

@Repository
public class StudentDaoImpl extends AbstractDaoImpl<Student> implements StudentDao {
	public StudentDaoImpl() {
		setClazz(Student.class);

	}

	@Transactional
	@Override
	public List<Student> getStudentsByGender(String gender) {
		String q = "from Student where user in (from User where gender = :gender and isActive = :isActive)";
		List<Student> students = em.createQuery(q, Student.class).setParameter("gender", gender)
				.setParameter("isActive", true).getResultList();
		return students;
	}

	@Transactional
	@Override
	public void updateAllStudent(boolean status) {
		String Query = "update Student set studentValid= :studentValid";
		em.createQuery(Query).setParameter("studentValid", status).executeUpdate();
	}

	@Transactional
	@Override
	public void delectStudent(boolean status) {
		String query = "update User set isActive= :isActive where userId in (select user from Student where studentValid = :studentValid)";
		System.out.println(status);
		int n = em.createQuery(query).setParameter("isActive", false).setParameter("studentValid", status)
				.executeUpdate();
		System.out.println("Row :" + n);
	}

	@Override
	public void deleteStudentById(long id) {
		String query = "delete from Student where studentId = :studentId";
		em.createQuery(query).setParameter("studentId", id).executeUpdate();
	}

	@Override
	public List<Student> getStudentByHostel(Long hostelId) throws SQLException {
		String q = "from Student where hostel=(from Hostel where hostelId=:hostelId)";
		System.out.println("dao impl:"+hostelId);
		List<Student> students = em.createQuery(q, Student.class).setParameter("hostelId", hostelId).getResultList();
		return students;
	}
	
	@Override
	public int getStudentCountByHostel(Long hostelId) throws SQLException {
		String q = "select COUNT(student.studentId) from Student student where hostel=(from Hostel where hostelId=:hostelId)";
		Long c= (Long)em.createQuery(q).setParameter("hostelId", hostelId).getSingleResult();
		int cint=c.intValue();
		return cint;
	}
}