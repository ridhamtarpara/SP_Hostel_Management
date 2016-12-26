package sspkm.models.rector.dao;

import java.sql.SQLException;
import java.util.List;

import sspkm.models.abstractdao.AbstractDao;
import sspkm.models.rector.Rector;

public interface RectorDao extends AbstractDao<Rector> {

	public List<Rector> getRectorByGender(String gender) throws SQLException;

	public List<Rector> getAllActiveRector() throws SQLException;

}
