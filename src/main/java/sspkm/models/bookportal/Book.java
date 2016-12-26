package sspkm.models.bookportal;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;

import sspkm.models.academic.SubCourse;
import sspkm.models.student.Student;

@Entity
@Table(name = "books")
public class Book implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long bookId;

	@NotEmpty(message = "Please Enter Name")
	private String name;

	@NotEmpty(message = "Please Enter Author Of Book")
	private String author;

	@NotEmpty(message = "Please Enter Publication")
	private String publication;

	@NotEmpty(message = "Please Enter Description")
	private String description;

	private Long semester;

	private Long price;

	private Date date;

	@ManyToOne
	@JoinColumn(name = "subCourseId")
	private SubCourse course;

	@ManyToOne 
	@JoinColumn(name = "studentId")
	private Student student;

	public Book() {
	}

	public long getBookId() {
		return bookId;
	}

	public void setBookId(long bookId) {
		this.bookId = bookId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPublication() {
		return publication;
	}

	public void setPublication(String publication) {
		this.publication = publication;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Long getSemester() {
		return semester;
	}

	public void setSemester(Long semester) {
		this.semester = semester;
	}

	public Long getPrice() {
		return price;
	}

	public void setPrice(Long price) {
		this.price = price;
	}

	public SubCourse getCourse() {
		return course;
	}

	public void setCourse(SubCourse course) {
		this.course = course;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

}
