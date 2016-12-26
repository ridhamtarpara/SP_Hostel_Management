package sspkm.models.trustee;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import sspkm.models.user.User;

@Entity
@Table(name = "trustees")
public class Trustee implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(generator="my_seqtrustee")
	@SequenceGenerator(name="my_seqtrustee",sequenceName="MY_SEQtrustee", allocationSize=1)
	private Long trusteeId;

	@OneToOne
	@JoinColumn(name = "userId")
	private User user;

	@Column
	private String designation;

	public Trustee() {

	}

	public Long getTrusteeId() {
		return trusteeId;
	}

	public void setTrusteeId(Long trusteeId) {
		this.trusteeId = trusteeId;
	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
