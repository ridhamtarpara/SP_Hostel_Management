
package sspkm.security;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import sspkm.models.user.User;
import sspkm.models.user.dao.UserDao;

@Service("userService")
@Transactional
public class UserDetailsServiceImpl implements UserDetailsService {

	@Autowired
	private UserDao userDao;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException, DataAccessException {
		User user = null;
		try {
			user = userDao.getUserByEmail(username);
		} catch (SQLException e) {
		}
		if (user == null)
			throw new UsernameNotFoundException(username + " is not found.");
		return user;
	}

}
