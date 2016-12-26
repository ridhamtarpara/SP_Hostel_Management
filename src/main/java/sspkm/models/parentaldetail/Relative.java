package sspkm.models.parentaldetail;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import sspkm.models.user.User;

@Entity
@Table(name = "relatives")
public class Relative implements Serializable {

	private static final long serialVersionUID = 1L;

	@JsonIgnore
	@Id
	@GeneratedValue(generator="my_seqrelative")
	@SequenceGenerator(name="my_seqrelative",sequenceName="MY_SEQrelative", allocationSize=1)
	private Long relativeId;

	private String relative_firstName;

	private String relative_middleName;

	private String relative_lastName;

	private Long relative_mobileNumber;

	private String relative_relation;

	private String relative_address;

	@JsonIgnore
	@OneToOne
	@JoinColumn(name = "userId")
	private User user;

	public Relative() {
		// TODO Auto-generated constructor stub
	}

	public Long getRelativeId() {
		return relativeId;
	}

	public void setRelativeId(Long relativeId) {
		this.relativeId = relativeId;
	}

	public String getRelative_firstName() {
		return relative_firstName;
	}

	public void setRelative_firstName(String relative_firstName) {
		this.relative_firstName = relative_firstName;
	}

	public String getRelative_middleName() {
		return relative_middleName;
	}

	public void setRelative_middleName(String relative_middleName) {
		this.relative_middleName = relative_middleName;
	}

	public String getRelative_lastName() {
		return relative_lastName;
	}

	public void setRelative_lastName(String relative_lastName) {
		this.relative_lastName = relative_lastName;
	}

	public Long getRelative_mobileNumber() {
		return relative_mobileNumber;
	}

	public void setRelative_mobileNumber(Long relative_mobileNumber) {
		this.relative_mobileNumber = relative_mobileNumber;
	}

	public String getRelative_relation() {
		return relative_relation;
	}

	public void setRelative_relation(String relative_relation) {
		this.relative_relation = relative_relation;
	}

	public String getRelative_address() {
		return relative_address;
	}

	public void setRelative_address(String relative_address) {
		this.relative_address = relative_address;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}