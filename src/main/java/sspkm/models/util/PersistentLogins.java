package sspkm.models.util;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity(name="persistent_logins")
public class PersistentLogins {
	
	@Column(length=64)
	@Id
	private String series; 
	
	@Column(nullable=false,length=64)
	private String username;
	
	@Column(nullable=false,length=64)
	private String token;
	
	@Column(nullable=false)
	private Date last_used;
}
