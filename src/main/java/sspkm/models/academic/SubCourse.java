package sspkm.models.academic;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import sspkm.models.applicant.Applicant;
import sspkm.models.bookportal.Book;
import sspkm.models.forum.Question;
import sspkm.models.student.Student;

@Entity
@Table(name = "subcourses")
public class SubCourse implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long subCourseId;

	private String subCourseName;

	@JsonIgnore
	private int durationInYear;

	@JsonIgnore
	@ManyToOne
	@JoinColumn(name = "courseId")
	private Course course;

	@JsonIgnore
	@OneToMany(mappedBy = "course", cascade = CascadeType.ALL)
	private List<Applicant> applicants;

	@JsonIgnore
	@OneToMany(mappedBy = "course",cascade=CascadeType.ALL)
	private List<Student> students;

	@JsonIgnore
	@OneToMany(mappedBy = "course")
	private List<Book> books;
	
	@JsonIgnore
	@OneToMany(mappedBy="subCourse")
	private List<Question> questions;

	public Long getSubCourseId() {
		return subCourseId;
	}

	public void setSubCourseId(Long subCourseId) {
		this.subCourseId = subCourseId;
	}

	public String getSubCourseName() {
		return subCourseName;
	}

	public void setSubCourseName(String subCourseName) {
		this.subCourseName = subCourseName;
	}

	public int getDurationInYear() {
		return durationInYear;
	}

	public void setDurationInYear(int durationInYear) {
		this.durationInYear = durationInYear;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public SubCourse() {

	}

}
