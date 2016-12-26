package sspkm.models.applicant;

import java.io.Serializable;

import javax.persistence.CascadeType;
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
import sspkm.models.user.User;

@Entity
@Table(name = "applicants")
public class Applicant implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(generator = "my_seqapplicant")
	@SequenceGenerator(name = "my_seqapplicant", sequenceName = "MY_SEQapplicant", allocationSize = 1)
	private long applicantId;

	@OneToOne
	@JoinColumn(name = "userId")
	private User user;

	@ManyToOne
	@JoinColumn(name = "subCourseId")
	private SubCourse course;

	@ManyToOne
	@JoinColumn(name = "collegeId")
	private College college;

	@OneToOne(mappedBy = "applicant", cascade = CascadeType.ALL)
	private ApplicantApplication application;

	
	public Applicant() {
		
	}

	public long getApplicantId() {
		return applicantId;
	}

	public void setApplicantId(long applicantId) {
		this.applicantId = applicantId;
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

	public ApplicantApplication getApplication() {
		return application;
	}

	public void setApplication(ApplicantApplication application) {
		this.application = application;
	}

}
