package sspkm.models.message;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Type;

import com.fasterxml.jackson.annotation.JsonIgnore;

import sspkm.models.user.User;

@Entity
@Table(name = "messages")
public class Message implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long messageId;

	@Lob
	@Type(type = "org.hibernate.type.TextType")
	private String message;

	private Timestamp time;

	@JsonIgnore
	@ManyToOne
	@JoinColumn(name = "userId")
	private User sender;

	@JsonIgnore
	@ManyToOne
	@JoinColumn(name = "chatId")
	private MessageMaster messageMaster;

	public Message() {

	}

	public long getMessageId() {
		return messageId;
	}

	public void setMessageId(long messageId) {
		this.messageId = messageId;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Timestamp getTime() {
		return time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

	public User getSender() {
		return sender;
	}

	public void setSender(User sender) {
		this.sender = sender;
	}

	public MessageMaster getMessageMaster() {
		return messageMaster;
	}

	public void setMessageMaster(MessageMaster messageMaster) {
		this.messageMaster = messageMaster;
	}

}
