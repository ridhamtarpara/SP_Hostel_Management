package sspkm.models.activity.dao.jpa;

import org.springframework.stereotype.Repository;

import sspkm.models.abstractdao.jpa.AbstractDaoImpl;
import sspkm.models.activity.Activity;
import sspkm.models.activity.dao.ActivityDao;

@Repository
public class ActivityDaoImpl extends AbstractDaoImpl<Activity> implements ActivityDao {

	public ActivityDaoImpl() {
		setClazz(Activity.class);
	}

}
