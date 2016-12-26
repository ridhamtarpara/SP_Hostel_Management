package sspkm.models.feedback.dao.jap;

import org.springframework.stereotype.Repository;

import sspkm.models.abstractdao.jpa.AbstractDaoImpl;
import sspkm.models.feedback.FeedBack;
import sspkm.models.feedback.dao.FeedBackDao;

@Repository
public class FeedBackDaoImpl extends AbstractDaoImpl<FeedBack> implements FeedBackDao{

	public FeedBackDaoImpl() {
		setClazz(FeedBack.class);
	}
}
