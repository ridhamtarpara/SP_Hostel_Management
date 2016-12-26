package sspkm.models.file.dao.jpa;

import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.imgscalr.Scalr.Method;
import org.imgscalr.Scalr.Mode;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import sspkm.models.file.dao.FileDao;

@Repository
public class FileDaoImpl implements FileDao {

	public static String path = "";

	@Override
	public String saveFile(MultipartFile file, String address, String name, int height, int width) {
		byte[] bytes;
		try {
			BufferedImage image = ImageIO.read(file.getInputStream());
			BufferedImage resizedImage = Scalr.resize(image, Method.ULTRA_QUALITY, Mode.FIT_EXACT, width, height,
					Scalr.OP_ANTIALIAS);
			ByteArrayOutputStream os = new ByteArrayOutputStream();
			ImageIO.write(resizedImage, "jpg", os);
			bytes = os.toByteArray();
			File dir = new File(getPath() + File.separator + address);
			if (!dir.exists())
				dir.mkdirs();
			File serverFile = new File(dir.getAbsolutePath() + File.separator + name + ".jpg");
			BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
			stream.write(bytes);
			stream.close();
			return serverFile.getName();
		} catch (IOException e) {
			e.printStackTrace();
			return "error";
		}

	}

	@Override
	public String getPath() {
		path = "/home/sellnews/git/SellNews-Backend/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/sspkm/dist/img";
		return path;
	}

	@Override
	public Boolean deleteServerFile(String address, String name) {
		try {
			File dir = new File(getPath() + File.separator + address);
			File serverFile = new File(dir.getAbsolutePath() + File.separator + name + ".jpg");
			if (serverFile.delete()) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}