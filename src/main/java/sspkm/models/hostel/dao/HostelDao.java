package sspkm.models.hostel.dao;

import java.sql.SQLException;

import sspkm.models.abstractdao.AbstractDao;
import sspkm.models.hostel.Hostel;

public interface HostelDao extends AbstractDao<Hostel> {
	
	public void updateHostel(Hostel h) throws SQLException;
}
