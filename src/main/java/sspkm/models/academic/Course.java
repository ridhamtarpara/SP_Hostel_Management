package sspkm.models.academic;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "courses")
public class Course implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long courseId;

	private String courseName;
	
	@JsonIgnore
	@OneToMany(mappedBy = "course",cascade=CascadeType.ALL)
	private List<SubCourse> subCourses;

	public Course() {

	}

	public Long getCourseId() {
		return courseId;
	}

	public void setCourseId(Long courseId) {
		this.courseId = courseId;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public List<SubCourse> getSubCourses() {
		return subCourses;
	}

	public void setSubCourses(List<SubCourse> subCourses) {
		this.subCourses = subCourses;
	}

}
