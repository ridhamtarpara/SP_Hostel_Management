package sspkm.models.trustee.dao.jpa;

import org.springframework.stereotype.Repository;

import sspkm.models.abstractdao.jpa.AbstractDaoImpl;
import sspkm.models.trustee.Trustee;
import sspkm.models.trustee.dao.TrusteeDao;

@Repository
public class TrusteeDaoImpl extends AbstractDaoImpl<Trustee> implements TrusteeDao {

	public TrusteeDaoImpl() {
		setClazz(Trustee.class);
	}
	
}
