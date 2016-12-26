package sspkm.models.user.dao;

import sspkm.models.abstractdao.AbstractDao;
import sspkm.models.user.PasswordToken;

public interface PasswordTokenDao extends AbstractDao<PasswordToken>{
	PasswordToken findByToken(String token);
}
