package sspkm.models.request;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonIgnore;

import sspkm.models.student.Student;

@Entity
@Table(name = "vehicleRegisters")
public class VehicleRegister implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long vehicleRegisterId;

	@NotNull(message = "Please Enter LicenceNumber")
	private String vehicleNumber;

	@NotEmpty(message = "Please Enter Vehicle Model")
	private String vehicleModel;

	@NotNull(message = "Please Enter LicenceNumber")
	private String licenceNumber;

	private String status;

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@JsonIgnore
	@ManyToOne
	@JoinColumn(name = "studentId")
	private Student student;

	public Long getVehicleRegisterId() {
		return vehicleRegisterId;
	}

	public void setVehicleRegisterId(Long vehicleRegisterId) {
		this.vehicleRegisterId = vehicleRegisterId;
	}

	public String getVehicleNumber() {
		return vehicleNumber;
	}

	public void setVehicleNumber(String vehicleNumber) {
		this.vehicleNumber = vehicleNumber;
	}

	public String getVehicleModel() {
		return vehicleModel;
	}

	public void setVehicleModel(String vehicleModel) {
		this.vehicleModel = vehicleModel;
	}

	public String getLicenceNumber() {
		return licenceNumber;
	}

	public void setLicenceNumber(String licenceNumber) {
		this.licenceNumber = licenceNumber;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

}
