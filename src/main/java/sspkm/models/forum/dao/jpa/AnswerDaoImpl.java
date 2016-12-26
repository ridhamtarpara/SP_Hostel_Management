package sspkm.models.forum.dao.jpa;

import org.springframework.stereotype.Repository;

import sspkm.models.abstractdao.jpa.AbstractDaoImpl;
import sspkm.models.forum.Answer;
import sspkm.models.forum.dao.AnswerDao;
@Repository
public class AnswerDaoImpl extends AbstractDaoImpl<Answer> implements AnswerDao{

	public AnswerDaoImpl() {
	this.setClazz(Answer.class);
	}

}
