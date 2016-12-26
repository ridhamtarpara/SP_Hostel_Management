package sspkm.models.parentaldetail.dao.jpa;

import org.springframework.stereotype.Repository;

import sspkm.models.abstractdao.jpa.AbstractDaoImpl;
import sspkm.models.parentaldetail.Parent;
import sspkm.models.parentaldetail.dao.ParentDao;

@Repository
public class ParentDaoImpl extends AbstractDaoImpl<Parent> implements ParentDao {

	public ParentDaoImpl() {
		setClazz(Parent.class);
	}
	
}
