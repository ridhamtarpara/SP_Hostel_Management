package sspkm.models.hostel.dao.jpa;

import org.springframework.stereotype.Repository;

import sspkm.models.abstractdao.jpa.AbstractDaoImpl;
import sspkm.models.hostel.GlobalParam;
import sspkm.models.hostel.dao.GlobalParamDao;

@Repository
public class GlobalParamDaoImpl extends AbstractDaoImpl<GlobalParam> implements GlobalParamDao {

	public GlobalParamDaoImpl() {
		this.setClazz(GlobalParam.class);
	}
}
