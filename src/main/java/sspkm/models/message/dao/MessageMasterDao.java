package sspkm.models.message.dao;

import java.util.List;

import sspkm.models.abstractdao.AbstractDao;
import sspkm.models.message.MessageMaster;

public interface MessageMasterDao extends AbstractDao<MessageMaster>{

	List<MessageMaster> findChat(Long senderid,Long receiverId);
	
	List<MessageMaster> findAllChat(Long userId);
}
