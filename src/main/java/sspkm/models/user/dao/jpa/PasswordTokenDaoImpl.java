package sspkm.models.user.dao.jpa;

import java.util.List;

import org.springframework.stereotype.Repository;

import sspkm.models.abstractdao.jpa.AbstractDaoImpl;
import sspkm.models.user.PasswordToken;
import sspkm.models.user.dao.PasswordTokenDao;

@Repository
public class PasswordTokenDaoImpl extends AbstractDaoImpl<PasswordToken> implements PasswordTokenDao {

	public PasswordTokenDaoImpl() {
		this.setClazz(PasswordToken.class);
	}

	@Override
	public PasswordToken findByToken(String token) {
		String query = "from PasswordToken pt where token = :token";
		List<PasswordToken> aa = em.createQuery(query, PasswordToken.class).setParameter("token", token).getResultList();
		return aa.size() == 0 ? null : aa.get(0);
	}

}
