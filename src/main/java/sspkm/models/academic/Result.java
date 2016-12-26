package sspkm.models.academic;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import sspkm.models.user.User;

@Entity
@Table(name = "results")
public class Result implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long resultId;

	private Float x;
	private Float xii;
	private Float sem1;
	private Float sem2;
	private Float sem3;
	private Float sem4;
	private Float sem5;
	private Float sem6;
	private Float sem7;
	private Float sem8;
	private Float sem9;
	private Float sem10;

	@OneToOne
	@JoinColumn(name = "userId")
	private User user;

	public Result() {
		// TODO Auto-generated constructor stub
	}

	public Long getResultId() {
		return resultId;
	}

	public void setResultId(Long resultId) {
		this.resultId = resultId;
	}

	public Float getX() {
		return x;
	}

	public void setX(Float x) {
		this.x = x;
	}

	public Float getXii() {
		return xii;
	}

	public void setXii(Float xii) {
		this.xii = xii;
	}

	public Float getSem1() {
		return sem1;
	}

	public void setSem1(Float sem1) {
		this.sem1 = sem1;
	}

	public Float getSem2() {
		return sem2;
	}

	public void setSem2(Float sem2) {
		this.sem2 = sem2;
	}

	public Float getSem3() {
		return sem3;
	}

	public void setSem3(Float sem3) {
		this.sem3 = sem3;
	}

	public Float getSem4() {
		return sem4;
	}

	public void setSem4(Float sem4) {
		this.sem4 = sem4;
	}

	public Float getSem5() {
		return sem5;
	}

	public void setSem5(Float sem5) {
		this.sem5 = sem5;
	}

	public Float getSem6() {
		return sem6;
	}

	public void setSem6(Float sem6) {
		this.sem6 = sem6;
	}

	public Float getSem7() {
		return sem7;
	}

	public void setSem7(Float sem7) {
		this.sem7 = sem7;
	}

	public Float getSem8() {
		return sem8;
	}

	public void setSem8(Float sem8) {
		this.sem8 = sem8;
	}

	public Float getSem9() {
		return sem9;
	}

	public void setSem9(Float sem9) {
		this.sem9 = sem9;
	}

	public Float getSem10() {
		return sem10;
	}

	public void setSem10(Float sem10) {
		this.sem10 = sem10;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
