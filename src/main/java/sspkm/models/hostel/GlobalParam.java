package sspkm.models.hostel;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "globalparams")
public class GlobalParam implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private Long paramId;

	private boolean admissionOn;

	public boolean isAdmissionOn() {
		return admissionOn;
	}

	public void setAdmissionOn(boolean admissionOn) {
		this.admissionOn = admissionOn;
	}

	public Long getParamId() {
		return paramId;
	}

	public void setParamId(Long paramId) {
		this.paramId = paramId;
	}

	public GlobalParam() {
	}
}
