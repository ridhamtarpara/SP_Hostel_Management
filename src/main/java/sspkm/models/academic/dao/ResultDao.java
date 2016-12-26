package sspkm.models.academic.dao;

import java.sql.SQLException;

import sspkm.models.abstractdao.AbstractDao;
import sspkm.models.academic.Result;
import sspkm.models.user.User;

public interface ResultDao extends AbstractDao<Result> {

	Result findByUser(User user) throws SQLException;

}
