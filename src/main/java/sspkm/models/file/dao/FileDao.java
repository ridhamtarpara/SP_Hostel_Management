package sspkm.models.file.dao;

import java.sql.SQLException;

import org.springframework.web.multipart.MultipartFile;

public interface FileDao {

	String saveFile(MultipartFile file, String address, String name, int height, int width) throws SQLException;

	String getPath() throws SQLException;

	Boolean deleteServerFile(String address, String name) throws SQLException;

}
