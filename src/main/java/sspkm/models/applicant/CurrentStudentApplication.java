package sspkm.models.applicant;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import sspkm.models.student.Student;

@Entity
@Table(name = "student_applications")
public class CurrentStudentApplication implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@NotNull(message = "Enter Valid Entry!")
	private Long studentApplicationId;

	private Date date;

	private String status;
	
	private String type;

	private Boolean sameRoomPreference;
	
	private String token;

	@OneToOne
	@JoinColumn(name = "studentId")
	private Student student;

	public CurrentStudentApplication() {
		
	}

	public Long getStudentApplicationId() {
		return studentApplicationId;
	}

	public void setStudentApplicationId(Long studentApplicationId) {
		this.studentApplicationId = studentApplicationId;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Boolean getSameRoomPreference() {
		return sameRoomPreference;
	}

	public void setSameRoomPreference(Boolean sameRoomPreference) {
		this.sameRoomPreference = sameRoomPreference;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}
	
}
