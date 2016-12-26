package sspkm.models.forum.dao.jpa;

import java.util.List;

import org.springframework.stereotype.Repository;

import sspkm.models.abstractdao.jpa.AbstractDaoImpl;
import sspkm.models.forum.Question;
import sspkm.models.forum.dao.QuestionDao;
import sspkm.models.student.Student;

@Repository
public class QuestionDaoImpl extends AbstractDaoImpl<Question> implements QuestionDao {

	public QuestionDaoImpl() {
		this.setClazz(Question.class);
	}

	@Override
	public List<Question> findByCourse(Long courseId) {
		String query =" from Question where subcourseid in (select subCourseId from SubCourse where courseid="+courseId+") order by date desc";
		List<Question> questions = em.createQuery(query, Question.class).getResultList();
		return questions.size() == 0 ? null : questions;
	}

	@Override
	public List<Question> findBySubCourse(Long subCourseId) {
		String query = "from Question where subcourseid ="+subCourseId;

		List<Question> questions = em.createQuery(query, Question.class).getResultList();
		return questions.size() == 0 ? null : questions;
	}

	@Override
	public List<Question> findByStudent(Student student) {
		String query="from Question where student = :student";
		List<Question> questions=em.createQuery(query, Question.class).setParameter("student", student).getResultList();
		return questions;
	}
}
