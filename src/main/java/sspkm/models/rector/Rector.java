package sspkm.models.rector;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import sspkm.models.activity.Activity;
import sspkm.models.hostel.Hostel;
import sspkm.models.user.User;

@Entity
@Table(name = "rectors")
public class Rector implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(generator = "my_seqrector")
	@SequenceGenerator(name = "my_seqrector", sequenceName = "MY_SEQrector", allocationSize = 1)
	private long rectorId;

	@OneToOne
	@JoinColumn(name = "userId")
	private User user;

	@ManyToOne
	@JoinColumn(name = "hostelId")
	private Hostel hostel;

	private String qualifications;

	@JsonIgnore
	@OneToMany(mappedBy = "rector", cascade = CascadeType.ALL)
	private List<Activity> activity;

	public Rector() {
		// TODO Auto-generated constructor stub
	}

	public long getRectorId() {
		return rectorId;
	}

	public void setRectorId(long rectorId) {
		this.rectorId = rectorId;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Hostel getHostel() {
		return hostel;
	}

	public void setHostel(Hostel hostel) {
		this.hostel = hostel;
	}

	public String getQualifications() {
		return qualifications;
	}

	public void setQualifications(String qualifications) {
		this.qualifications = qualifications;
	}

	public List<Activity> getActivity() {
		return activity;
	}

	public void setActivity(List<Activity> activity) {
		this.activity = activity;
	}

}
