package sspkm.models.invoice;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

import sspkm.models.user.User;

@Entity
@Table(name = "invoices")
public class Invoice implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(generator = "my_seqinvoice")
	@SequenceGenerator(name = "my_seqinvoice", sequenceName = "MY_SEQINVOIVE", allocationSize = 1)
	private Long invoiceId;

	private String invoiceType;

	private String receiptNumber;
	
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "XyzIdGenerator")
	@GenericGenerator(name = "XyzIdGenerator",
	        strategy = "sspkm.models.invoice.BigIntegerSequenceGenerator",
	        parameters = {
	            @Parameter(name = "sequence", value = "xyz_id_sequence")
	        })
	public String getReceiptNumber()
	{
	   return receiptNumber;
	}
	

	private Long amount;

	private Long totalAmount;

	private Date invoiceDate;

	private String paymentType;

	@ManyToOne
	@JoinColumn(name = "userId")
	private User user;

	public Long getInvoiceId() {
		return invoiceId;
	}

	public void setInvoiceId(Long invoiceId) {
		this.invoiceId = invoiceId;
	}

	public String getInvoiceType() {
		return invoiceType;
	}

	public void setInvoiceType(String invoiceType) {
		this.invoiceType = invoiceType;
	}

	public void setReceiptNumber(String receiptNumber) {
		this.receiptNumber = receiptNumber;
	}

	public Long getAmount() {
		return amount;
	}

	public void setAmount(Long amount) {
		this.amount = amount;
	}

	public Long getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(Long totalAmount) {
		this.totalAmount = totalAmount;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Date getInvoiceDate() {
		return invoiceDate;
	}

	public void setInvoiceDate(Date invoiceDate) {
		this.invoiceDate = invoiceDate;
	}

	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

}

