package sspkm.models.file;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

public class File implements Serializable {

	private static final long serialVersionUID = 1L;

	private MultipartFile file;

	private String address;
	
	public File() {
		
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
 
}
