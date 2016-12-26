package sspkm.models.hostel.dao.jpa;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import sspkm.models.abstractdao.jpa.AbstractDaoImpl;
import sspkm.models.hostel.Hostel;
import sspkm.models.hostel.dao.HostelDao;

@Repository
public class HostelDaoImpl extends AbstractDaoImpl<Hostel> implements HostelDao {
	public HostelDaoImpl() {
		setClazz(Hostel.class);
	}
	
	@Transactional
	@Override
	public void updateHostel(Hostel h) {
		Hostel existingHostel=findById(h.getHostelId());
		existingHostel.setContactNumber(h.getContactNumber());
		existingHostel.setDeposit(h.getDeposit());
		existingHostel.setFee(h.getFee());
		existingHostel.setFoodBill(h.getFoodBill());
		existingHostel =update(existingHostel);
	}
}
