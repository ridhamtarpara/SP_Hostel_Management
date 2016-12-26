package sspkm.models.student;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import sspkm.models.academic.College;
import sspkm.models.academic.SubCourse;
import sspkm.models.hostel.Hostel;
import sspkm.models.user.User;

@Entity
@Table(name = "paststudents")
public class PastStudent implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(generator = "my_seqpaststudent")
	@SequenceGenerator(name = "my_seqpaststudent", sequenceName = "MY_SEQpaststudent", allocationSize = 1)
	private long studentId;

	@ManyToOne
	@JoinColumn(name = "hostelId")
	private Hostel hostel;

	@OneToOne
	@JoinColumn(name = "userId")
	private User user;

	@ManyToOne
	@JoinColumn(name = "subCourseId")
	private SubCourse course;

	@ManyToOne
	@JoinColumn(name = "collegeId")
	private College college;

	public long getStudentId() {
		return studentId;
	}

	public void setStudentId(long studentId) {
		this.studentId = studentId;
	}

	public Hostel getHostel() {
		return hostel;
	}

	public void setHostel(Hostel hostel) {
		this.hostel = hostel;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public SubCourse getCourse() {
		return course;
	}

	public void setCourse(SubCourse course) {
		this.course = course;
	}

	public College getCollege() {
		return college;
	}

	public void setCollege(College college) {
		this.college = college;
	}

}
