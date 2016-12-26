package sspkm.models.forum;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Type;

import sspkm.models.academic.SubCourse;
import sspkm.models.student.Student;

@Entity
@Table(name = "forum_questions")
public class Question implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long questionId;

	private String question;

	@Lob
	@Type(type = "org.hibernate.type.TextType")
	private String description;

	private Timestamp date;

	@ManyToOne
	@JoinColumn(name = "subCourseId")
	private SubCourse subCourse;

	@ManyToOne
	@JoinColumn(name = "studentId")
	private Student student;

	@OneToMany(mappedBy = "question")
	private List<Answer> answers;

	public Question() {

	}
	
	public Long getQuestionId() {
		return questionId;
	}

	public void setQuestionId(Long questionId) {
		this.questionId = questionId;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public SubCourse getSubCourse() {
		return subCourse;
	}

	public void setSubCourse(SubCourse subCourse) {
		this.subCourse = subCourse;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public List<Answer> getAnswers() {
		return answers;
	}

	public void setAnswers(List<Answer> answers) {
		this.answers = answers;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
