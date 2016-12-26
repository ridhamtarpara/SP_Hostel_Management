package sspkm.models.rector.dao.jpa;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Repository;

import sspkm.models.abstractdao.jpa.AbstractDaoImpl;
import sspkm.models.rector.Rector;
import sspkm.models.rector.dao.RectorDao;

@Repository
public class RectorDaoImpl extends AbstractDaoImpl<Rector> implements RectorDao {

	public RectorDaoImpl() {
		setClazz(Rector.class);
	}

	@Override
	public List<Rector> getRectorByGender(String gender) {
		String query = "from Rector where user in ( from User where gender = :gender AND isActive = :isActive )";
		List<Rector> rectors = em.createQuery(query, Rector.class).setParameter("gender", gender)
				.setParameter("isActive", true).getResultList();
		return rectors;
	}

	@Override
	public List<Rector> getAllActiveRector() throws SQLException {
		String query = "from Rector where user in ( from User where isActive = :isActive )";
		List<Rector> rectors = em.createQuery(query, Rector.class).setParameter("isActive", true).getResultList();
		return rectors;
	}

}
