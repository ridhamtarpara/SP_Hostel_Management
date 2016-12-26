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

import sspkm.models.applicant.Applicant;

@Entity
@Table(name = "colleges")
public class College implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long collegeId;

	private String collegeName;

	private String address;

	@JsonIgnore
	@OneToMany(mappedBy = "college", cascade = CascadeType.ALL)
	private List<Applicant> applicants;

	@JsonIgnore
	@OneToMany(mappedBy = "college", cascade = CascadeType.ALL)
	private List<Applicant> students;

	public College() {
		// TODO Auto-generated constructor stub
	}

	public Long getCollegeId() {
		return collegeId;
	}

	public void setCollegeId(Long collegeId) {
		this.collegeId = collegeId;
	}

	public String getCollegeName() {
		return collegeName;
	}

	public void setCollegeName(String collegeName) {
		this.collegeName = collegeName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public List<Applicant> getApplicants() {
		return applicants;
	}

	public void setApplicants(List<Applicant> applicants) {
		this.applicants = applicants;
	}

	public List<Applicant> getStudents() {
		return students;
	}

	public void setStudents(List<Applicant> students) {
		this.students = students;
	}

}
