package sspkm.models.activity;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

import sspkm.models.rector.Rector;

@Entity
@Table(name = "activities")
public class Activity implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long activityId;

	private String type;

	@NotEmpty(message = "Please Enter Title")
	private String title;

	@NotEmpty(message = "Please Enter Description")
	private String description;

	@NotNull(message = "Please Enter Date")
	private Date date;

	@ManyToOne
	@JoinColumn(name = "rectorId")
	private Rector rector;

	public Long getActivityId() {
		return activityId;
	}

	public void setActivityId(Long activityId) {
		this.activityId = activityId;
	}

	public Rector getRector() {
		return rector;
	}

	public void setRector(Rector rector) {
		this.rector = rector;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

}
