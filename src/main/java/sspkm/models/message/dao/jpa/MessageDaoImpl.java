package sspkm.models.message.dao.jpa;

import java.util.List;

import org.springframework.stereotype.Repository;

import sspkm.models.abstractdao.jpa.AbstractDaoImpl;
import sspkm.models.message.Message;
import sspkm.models.message.dao.MessageDao;

@Repository
public class MessageDaoImpl extends AbstractDaoImpl<Message> implements MessageDao {

	public MessageDaoImpl() {
		this.setClazz(Message.class);
	}

	@Override
	public List<Message> findAllByChat(Long id) {
		String query = "select mm from Message mm where mm.messageMaster.chatId=:id ORDER BY mm.time DESC";
		List<Message> m = em.createQuery(query, Message.class).setParameter("id", id).getResultList();
		return m;
	}

}
