package sspkm.models.student;

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

import sspkm.models.academic.College;
import sspkm.models.academic.SubCourse;
import sspkm.models.applicant.CurrentStudentApplication;
import sspkm.models.bookportal.Book;
import sspkm.models.forum.Answer;
import sspkm.models.forum.Question;
import sspkm.models.hostel.Hostel;
import sspkm.models.hostel.Room;
import sspkm.models.request.Achievement;
import sspkm.models.request.Complaint;
import sspkm.models.request.LeaveApplication;
import sspkm.models.request.VehicleRegister;
import sspkm.models.user.User;

@Entity
@Table(name = "students")
public class Student implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(generator = "my_seqstudent")
	@SequenceGenerator(name = "my_seqstudent", sequenceName = "MY_SEQstudent", allocationSize = 1)
	private long studentId;

	private Long currentYear;

	private boolean studentValid;

	@ManyToOne
	@JoinColumn(name = "hostelId")
	private Hostel hostel;

	@OneToOne
	@JoinColumn(name = "userId")
	private User user;

	@ManyToOne
	@JoinColumn(name = "subCourseId")
	private SubCourse course;

	@ManyToOne
	@JoinColumn(name = "collegeId")
	private College college;

	@ManyToOne
	@JoinColumn(name = "roomId")
	private Room room;

	@OneToMany(mappedBy = "student", cascade = CascadeType.REMOVE)
	private List<LeaveApplication> leaveApplication;

	@OneToMany(mappedBy = "student", cascade = CascadeType.REMOVE)
	private List<Complaint> complaint;

	@OneToMany(mappedBy = "student", cascade = CascadeType.REMOVE)
	private List<VehicleRegister> vehicleRegister;

	@OneToMany(mappedBy = "student", cascade = CascadeType.REMOVE)
	private List<Achievement> achievement;

	@OneToMany(mappedBy = "student", cascade = CascadeType.REMOVE)
	private List<Book> books;

	@OneToMany(mappedBy = "student", cascade = CascadeType.REMOVE)
	private List<Question> questions;

	@OneToMany(mappedBy = "student", cascade = CascadeType.REMOVE)
	private List<Answer> answers;

	@OneToOne(mappedBy = "student", cascade = CascadeType.REMOVE)
	private CurrentStudentApplication currentStudentApplication;

	public Student() {
	}

	public long getStudentId() {
		return studentId;
	}

	public void setStudentId(long studentId) {
		this.studentId = studentId;
	}

	public Long getCurrentYear() {
		return currentYear;
	}

	public void setCurrentYear(Long currentYear) {
		this.currentYear = currentYear;
	}

	public boolean isStudentValid() {
		return studentValid;
	}

	public void setStudentValid(boolean studentValid) {
		this.studentValid = studentValid;
	}

	public Hostel getHostel() {
		return hostel;
	}

	public void setHostel(Hostel hostel) {
		this.hostel = hostel;
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

	public Room getRoom() {
		return room;
	}

	public void setRoom(Room room) {
		this.room = room;
	}

	public List<LeaveApplication> getLeaveApplication() {
		return leaveApplication;
	}

	public void setLeaveApplication(List<LeaveApplication> leaveApplication) {
		this.leaveApplication = leaveApplication;
	}

	public List<Complaint> getComplaint() {
		return complaint;
	}

	public void setComplaint(List<Complaint> complaint) {
		this.complaint = complaint;
	}

	public List<VehicleRegister> getVehicleRegister() {
		return vehicleRegister;
	}

	public void setVehicleRegister(List<VehicleRegister> vehicleRegister) {
		this.vehicleRegister = vehicleRegister;
	}

	public List<Achievement> getAchievement() {
		return achievement;
	}

	public void setAchievement(List<Achievement> achievement) {
		this.achievement = achievement;
	}

	public List<Book> getBooks() {
		return books;
	}

	public void setBooks(List<Book> books) {
		this.books = books;
	}

	public List<Question> getQuestions() {
		return questions;
	}

	public void setQuestions(List<Question> questions) {
		this.questions = questions;
	}

	public List<Answer> getAnswers() {
		return answers;
	}

	public void setAnswers(List<Answer> answers) {
		this.answers = answers;
	}

	public CurrentStudentApplication getCurrentStudentApplication() {
		return currentStudentApplication;
	}

	public void setCurrentStudentApplication(CurrentStudentApplication currentStudentApplication) {
		this.currentStudentApplication = currentStudentApplication;
	}

}
