package sspkm.models.parentaldetail.dao.jpa;

import org.springframework.stereotype.Repository;

import sspkm.models.abstractdao.jpa.AbstractDaoImpl;
import sspkm.models.parentaldetail.Relative;
import sspkm.models.parentaldetail.dao.RelativeDao;

@Repository
public class RelativeDaoImpl extends AbstractDaoImpl<Relative> implements RelativeDao {

	public RelativeDaoImpl() {
		setClazz(Relative.class);
	}
	
}
