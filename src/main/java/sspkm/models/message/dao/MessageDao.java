package sspkm.models.message.dao;

import java.util.List;

import sspkm.models.abstractdao.AbstractDao;
import sspkm.models.message.Message;

public interface MessageDao extends AbstractDao<Message>{

	List<Message> findAllByChat(Long id);
}
