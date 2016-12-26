package sspkm.models.academic.dao.jpa;

import java.sql.SQLException;

import org.springframework.stereotype.Repository;

import sspkm.models.abstractdao.jpa.AbstractDaoImpl;
import sspkm.models.academic.Result;
import sspkm.models.academic.dao.ResultDao;
import sspkm.models.user.User;

@Repository
public class ResultDaoImpl extends AbstractDaoImpl<Result> implements ResultDao {

	public ResultDaoImpl() {
		setClazz(Result.class);
	}

	@Override
	public Result findByUser(User user) throws SQLException {
		String query = "from Result where user = :user";
		Result result = em.createQuery(query, Result.class).setParameter("user", user).getSingleResult();
		return result;
	}

}
