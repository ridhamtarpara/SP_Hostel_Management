package sspkm.models.message.dao.jpa;

import java.util.List;

import org.springframework.stereotype.Repository;

import sspkm.models.abstractdao.jpa.AbstractDaoImpl;
import sspkm.models.message.MessageMaster;
import sspkm.models.message.dao.MessageMasterDao;

@Repository
public class MessageMasterDaoImpl extends AbstractDaoImpl<MessageMaster> implements MessageMasterDao {

	public MessageMasterDaoImpl() {
		this.setClazz(MessageMaster.class);
	}

	@Override
	public List<MessageMaster> findChat(Long senderid, Long receiverId) {
		String query = "select mm from MessageMaster mm where ((mm.messageFrom.userId=:senderid AND mm.messageTo.userId=:receiverId) OR (mm.messageFrom.userId=:receiverId AND mm.messageTo.userId=:senderid))";
		List<MessageMaster> m = em.createQuery(query, MessageMaster.class).setParameter("receiverId", receiverId)
				.setParameter("senderid", senderid).getResultList();
		return m;
	}

	@Override
	public List<MessageMaster> findAllChat(Long userId) {
		String query = "select mm from MessageMaster mm where (mm.messageFrom.userId=:userId OR mm.messageTo.userId=:userId))";
		List<MessageMaster> m = em.createQuery(query, MessageMaster.class).setParameter("userId", userId).getResultList();
		return m;
	}
}
