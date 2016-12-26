package sspkm.models.user;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.fasterxml.jackson.annotation.JsonIgnore;

import sspkm.models.academic.Result;
import sspkm.models.admin.Admin;
import sspkm.models.applicant.Applicant;
import sspkm.models.invoice.Invoice;
import sspkm.models.message.Message;
import sspkm.models.message.MessageMaster;
import sspkm.models.parentaldetail.Parent;
import sspkm.models.parentaldetail.Relative;
import sspkm.models.rector.Rector;
import sspkm.models.student.Student;
import sspkm.models.trustee.Trustee;

@Entity
@Table(name = "users")
public class User implements Serializable, UserDetails {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(generator = "my_seq")
	@SequenceGenerator(name = "my_seq", sequenceName = "MY_SEQ", allocationSize = 1)
	private long userId;

	@JsonIgnore
	@Column(nullable = false)
	private String password;

	@Column(unique = true, nullable = false)
	@NotEmpty(message = "Please Enter Email")
	@Email(message = "Please enter a valid email")
	private String email;

	@NotEmpty(message = "Please Enter First Name")
	private String firstName;

	@NotEmpty(message = "Please Enter Middle Name")
	private String middleName;

	@NotEmpty(message = "Please Enter Last Name")
	private String lastName;

	@NotEmpty(message = "Please Select Gender")
	private String gender;

	@NotEmpty(message = "Please Select Blood Group")
	private String bloodGroup;

	@NotEmpty(message = "Please Enter Address")
	private String address1;

	@NotEmpty(message = "Please Enter Address")
	private String address2;

	@NotEmpty(message = "Please Enter City")
	private String city;

	private Long zipCode;

	@NotEmpty(message = "Please Enter nativeVillage")
	private String nativeVillage;

	@NotEmpty(message = "Please Enter nativeTaluka")
	private String nativeTaluka;

	@NotEmpty(message = "Please Enter nativeDistrict")
	private String nativeDistrict;

	private Long nativeZipCode;

	private Date birthDate;

	private Long mobileNumber;

	private Timestamp appliedOn;

	@Column
	private boolean isActive;

	public boolean isActive() {
		return isActive;
	}

	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}

	@JsonIgnore
	@ElementCollection
	@CollectionTable(name = "authorities", joinColumns = @JoinColumn(name = "userId"))
	@Column(name = "role")
	private Set<String> roles;

	@JsonIgnore
	@OneToOne(mappedBy = "user")
	private Applicant applicant;

	@JsonIgnore
	@OneToOne(mappedBy = "user", cascade = CascadeType.ALL)
	private Student student;

	@JsonIgnore
	@OneToOne(mappedBy = "user", cascade = CascadeType.ALL)
	private Rector rector;

	@JsonIgnore
	@OneToOne(mappedBy = "user", cascade = CascadeType.ALL)
	private Admin admin;

	@JsonIgnore
	@OneToOne(mappedBy = "user", cascade = CascadeType.ALL)
	private Trustee trustee;

	@JsonIgnore
	@OneToOne(mappedBy = "user", cascade = CascadeType.ALL)
	private Parent parent;

	@JsonIgnore
	@OneToOne(mappedBy = "user", cascade = CascadeType.ALL)
	private Relative relative;

	@JsonIgnore
	@OneToOne(mappedBy = "user", cascade = CascadeType.ALL)
	private Result result;

	@JsonIgnore
	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
	private List<Invoice> invoices;

	@JsonIgnore
	@OneToMany(mappedBy = "sender", cascade = CascadeType.ALL)
	private List<Message> messageSent;

	@JsonIgnore
	@OneToMany(mappedBy = "messageFrom", cascade = CascadeType.ALL)
	private List<MessageMaster> sentChat;

	@JsonIgnore
	@OneToMany(mappedBy = "messageTo", cascade = CascadeType.ALL)
	private List<MessageMaster> recievedChat;

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getMiddleName() {
		return middleName;
	}

	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getName() {
		return firstName+" "+lastName;
	}
	
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBloodGroup() {
		return bloodGroup;
	}

	public void setBloodGroup(String bloodGroup) {
		this.bloodGroup = bloodGroup;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public Long getZipCode() {
		return zipCode;
	}

	public void setZipCode(Long zipCode) {
		this.zipCode = zipCode;
	}

	public String getNativeVillage() {
		return nativeVillage;
	}

	public void setNativeVillage(String nativeVillage) {
		this.nativeVillage = nativeVillage;
	}

	public String getNativeTaluka() {
		return nativeTaluka;
	}

	public void setNativeTaluka(String nativeTaluka) {
		this.nativeTaluka = nativeTaluka;
	}

	public String getNativeDistrict() {
		return nativeDistrict;
	}

	public void setNativeDistrict(String nativeDistrict) {
		this.nativeDistrict = nativeDistrict;
	}

	public Long getNativeZipCode() {
		return nativeZipCode;
	}

	public void setNativeZipCode(Long nativeZipCode) {
		this.nativeZipCode = nativeZipCode;
	}

	public Date getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}

	public Long getMobileNumber() {
		return mobileNumber;
	}

	public void setMobileNumber(Long mobileNumber) {
		this.mobileNumber = mobileNumber;
	}

	public Set<String> getRoles() {
		return roles;
	}

	public void setRoles(Set<String> roles) {
		this.roles = roles;
	}

	public Applicant getApplicant() {
		return applicant;
	}

	public void setApplicant(Applicant applicant) {
		this.applicant = applicant;
	}

	public List<Invoice> getInvoices() {
		return invoices;
	}

	public void setInvoices(List<Invoice> invoices) {
		this.invoices = invoices;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

	public Rector getRector() {
		return rector;
	}

	public void setRector(Rector rector) {
		this.rector = rector;
	}

	public Trustee getTrustee() {
		return trustee;
	}

	public void setTrustee(Trustee trustee) {
		this.trustee = trustee;
	}

	public Parent getParent() {
		return parent;
	}

	public void setParent(Parent parent) {
		this.parent = parent;
	}

	public Relative getRelative() {
		return relative;
	}

	public void setRelative(Relative relative) {
		this.relative = relative;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Result getResult() {
		return result;
	}

	public void setResult(Result result) {
		this.result = result;
	}

	public Timestamp getAppliedOn() {
		return appliedOn;
	}

	public void setAppliedOn(Timestamp appliedOn) {
		this.appliedOn = appliedOn;
	}

	public List<Message> getMessageSent() {
		return messageSent;
	}

	public void setMessageSent(List<Message> messageSent) {
		this.messageSent = messageSent;
	}

	public List<MessageMaster> getSentChat() {
		return sentChat;
	}

	public void setSentChat(List<MessageMaster> sentChat) {
		this.sentChat = sentChat;
	}

	public List<MessageMaster> getRecievedChat() {
		return recievedChat;
	}

	public void setRecievedChat(List<MessageMaster> recievedChat) {
		this.recievedChat = recievedChat;
	}

	@JsonIgnore
	public boolean isUserAdmin() {
		return roles.contains("ROLE_ADMIN") ? true : false;
	}

	@JsonIgnore
	public boolean isUserRector() {
		return roles.contains("ROLE_RECTOR") ? true : false;
	}

	@JsonIgnore
	public boolean isUserTrustee() {
		return roles.contains("ROLE_TRUSTEE") ? true : false;
	}

	@JsonIgnore
	public boolean isUserApplicant() {
		return this.getApplicant() != null ? true : false;
	}

	@JsonIgnore
	public User() {
		roles = new HashSet<String>();
	}

	@JsonIgnore
	@Override
	public Collection<GrantedAuthority> getAuthorities() {
		Set<GrantedAuthority> authorities = new HashSet<GrantedAuthority>();
		for (String role : roles)
			authorities.add(new SimpleGrantedAuthority(role));
		return authorities;
	}

	@JsonIgnore
	@Override
	public String getUsername() {

		return email;
	}

	@JsonIgnore
	@Override
	public boolean isAccountNonExpired() {

		return isActive();
	}

	@JsonIgnore
	@Override
	public boolean isAccountNonLocked() {

		return true;
	}

	@JsonIgnore
	@Override
	public boolean isCredentialsNonExpired() {

		return true;
	}

	@JsonIgnore
	@Override
	public boolean isEnabled() {

		return true;
	}

	@JsonIgnore
	public boolean isEvaluator() {
		for (String role : roles) {
			if (role.contains("ROLE_RECTOR"))
				return false;
			else if (role.contains("ROLE_ADMIN"))
				return false;
			else if (role.contains("ROLE_TRUSTEE"))
				return false;
		}
		return true;
	}

	@JsonIgnore
	public boolean isEmpty() {
		if (firstName == null || middleName == null || lastName == null || email == null || gender == null
				|| mobileNumber == null)
			return true;

		if (birthDate == null || bloodGroup == null || address1 == null || address2 == null || city == null
				|| zipCode == null)
			return true;

		if (nativeVillage == null || nativeTaluka == null || nativeDistrict == null || nativeZipCode == null)
			return true;

		return false;
	}

	@JsonIgnore
	public User setUserDetail(User user) {
		user.setEmail(user.getEmail().toLowerCase());
		Random randomno = new Random();
		String password = "SP" + (randomno.nextInt(8999999) + 1000000);
		user.setPassword(password);
		user.setFirstName(user.getFirstName().toUpperCase());
		user.setMiddleName(user.getMiddleName().toUpperCase());
		user.setLastName(user.getLastName().toUpperCase());
		user.setActive(true);
		user.setGender(user.getGender().toUpperCase());
		user.setAppliedOn(new Timestamp(System.currentTimeMillis()));
		return user;
	}

	@JsonIgnore
	public String generatePassword() {
		Random randomno = new Random();
		return "SP" + (randomno.nextInt(8999999) + 1000000);
	}
}
