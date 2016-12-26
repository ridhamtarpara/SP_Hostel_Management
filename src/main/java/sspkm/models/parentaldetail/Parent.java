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
@Table(name = "parents")
public class Parent implements Serializable {

	private static final long serialVersionUID = 1L;

	@JsonIgnore
	@Id
	@GeneratedValue(generator="my_seqparent")
	@SequenceGenerator(name="my_seqparent",sequenceName="MY_SEQparent", allocationSize=1)
	private Long parentId;

	private String parent_firstName;

	private String parent_middleName;

	private String parent_lastName;

	private Long parent_mobileNumber;

	private String parent_business;

	private Long parent_income;

	private int parent_totalMembers;

	@JsonIgnore
	@OneToOne
	@JoinColumn(name = "userId")
	private User user;

	public Parent() {
		// TODO Auto-generated constructor stub
	}

	public Long getParentId() {
		return parentId;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	public String getParent_firstName() {
		return parent_firstName;
	}

	public void setParent_firstName(String parent_firstName) {
		this.parent_firstName = parent_firstName;
	}

	public String getParent_middleName() {
		return parent_middleName;
	}

	public void setParent_middleName(String parent_middleName) {
		this.parent_middleName = parent_middleName;
	}

	public String getParent_lastName() {
		return parent_lastName;
	}

	public void setParent_lastName(String parent_lastName) {
		this.parent_lastName = parent_lastName;
	}

	public Long getParent_mobileNumber() {
		return parent_mobileNumber;
	}

	public void setParent_mobileNumber(Long parent_mobileNumber) {
		this.parent_mobileNumber = parent_mobileNumber;
	}

	public String getParent_business() {
		return parent_business;
	}

	public void setParent_business(String parent_business) {
		this.parent_business = parent_business;
	}

	public Long getParent_income() {
		return parent_income;
	}

	public void setParent_income(Long parent_income) {
		this.parent_income = parent_income;
	}

	public int getParent_totalMembers() {
		return parent_totalMembers;
	}

	public void setParent_totalMembers(int parent_totalMembers) {
		this.parent_totalMembers = parent_totalMembers;
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

	@Override
	public String toString() {
		return this.parent_firstName + " " + this.parent_lastName + " " + this.parent_business;
	}

}