package sspkm.models.hostel;

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

import sspkm.models.rector.Rector;
import sspkm.models.student.Student;

@Entity
@Table(name = "hostels")
public class Hostel implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long hostelId;

	private String hostelName;

	private String address;

	private String hostelFor;

	private int seats;

	private Long contactNumber;

	private int availableSeats;

	private Long fee;

	private Long deposit;

	private Long foodBill;

	private int totalRooms;

	@JsonIgnore
	@OneToMany(mappedBy = "hostel", cascade = CascadeType.ALL)
	private List<Student> students;

	@JsonIgnore
	@OneToMany(mappedBy = "hostel", cascade = CascadeType.ALL)
	private List<Rector> rectors;

	@JsonIgnore
	@OneToMany(mappedBy = "hostel", cascade = CascadeType.ALL)
	private List<Room> rooms;

	public Hostel() {

	}

	public Long getDeposit() {
		return deposit;
	}

	public void setDeposit(Long deposit) {
		this.deposit = deposit;
	}

	public Long getFoodBill() {
		return foodBill;
	}

	public void setFoodBill(Long foodBill) {
		this.foodBill = foodBill;
	}

	public Long getHostelId() {
		return hostelId;
	}

	public void setHostelId(Long hostelId) {
		this.hostelId = hostelId;
	}

	public String getHostelName() {
		return hostelName;
	}

	public void setHostelName(String hostelName) {
		this.hostelName = hostelName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getSeats() {
		return seats;
	}

	public void setSeats(int seats) {
		this.seats = seats;
	}

	public Long getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(Long contactNumber) {
		this.contactNumber = contactNumber;
	}

	public int getAvailableSeats() {
		return this.availableSeats;
	}

	public void setAvailableSeats(int availableSeats) {
		this.availableSeats = availableSeats;
	}

	public Long getFee() {
		return fee;
	}

	public void setFee(Long fee) {
		this.fee = fee;
	}

	public int getTotalRooms() {
		return totalRooms;
	}

	public void setTotalRooms(int totalRooms) {
		this.totalRooms = totalRooms;
	}

	public List<Student> getStudents() {
		return students;
	}

	public void setStudents(List<Student> students) {
		this.students = students;
	}

	public List<Rector> getRectors() {
		return rectors;
	}

	public void setRectors(List<Rector> rectors) {
		this.rectors = rectors;
	}

	public List<Room> getRooms() {
		return rooms;
	}

	public void setRooms(List<Room> rooms) {
		this.rooms = rooms;
	}

	public String getHostelFor() {
		return hostelFor;
	}

	public void setHostelFor(String hostelFor) {
		this.hostelFor = hostelFor;
	}
}
