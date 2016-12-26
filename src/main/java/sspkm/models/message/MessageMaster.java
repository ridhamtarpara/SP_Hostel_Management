package sspkm.models.message;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import sspkm.models.user.User;

@Entity
@Table(name = "messagemaster")
public class MessageMaster implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long chatId;

	@ManyToOne
	@JoinColumn(name = "senderuserId")
	private User messageFrom;

	@ManyToOne
	@JoinColumn(name = "receiveruserId")
	private User messageTo;

	@OneToMany(mappedBy = "messageMaster", fetch = FetchType.EAGER)
	@OrderBy("time DESC")
	private List<Message> messages;

	public MessageMaster() {

	}

	public long getChatId() {
		return chatId;
	}

	public void setChatId(long chatId) {
		this.chatId = chatId;
	}

	public User getMessageFrom() {
		return messageFrom;
	}

	public void setMessageFrom(User messageFrom) {
		this.messageFrom = messageFrom;
	}

	public User getMessageTo() {
		return messageTo;
	}

	public void setMessageTo(User messageTo) {
		this.messageTo = messageTo;
	}

	public List<Message> getMessages() {
		return messages;
	}

	public void setMessages(List<Message> messages) {
		this.messages = messages;
	}

}
