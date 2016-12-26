package sspkm.models.user;

import java.io.Serializable;

public class UserSearchModel implements Serializable {

	private static final long serialVersionUID = 1L;

	private Long userId;

	private String Name;

	public UserSearchModel() {
	}

	public UserSearchModel(Long userId, String name) {
		this.userId = userId;
		Name = name;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

}
