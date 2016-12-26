package sspkm.models.util;

import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

import sspkm.models.user.User;

public class MailMail {
	JavaMailSender mailSender;

	public void sendMail(final String to, final String subject, final String msg) throws Exception {

		MimeMessage mimeMessage = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, false, "utf-8");
		mimeMessage.setContent(msg, "text/html");
		helper.setTo(to);
		helper.setSubject(subject);
		mailSender.send(mimeMessage);

	}

	public boolean sendAdmissionLetter(JavaMailSender jms, User applicant, String url) {
		this.mailSender = jms;
		String msg = MailMessages.ADDMISSION_APPROVED_MESSAGE1 + url + MailMessages.ADDMISSION_APPROVED_MESSAGE2;
		String sub = applicant.getFirstName() + " " + applicant.getLastName()
				+ ",Your admission has been approved at SSPKM";
		try {
			sendMail(applicant.getEmail(), sub, msg);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean sendUserCredential(JavaMailSender jms, User user, String password) {
		this.mailSender = jms;
		String msg = MailMessages.ADDMISSION_CONFIRMED_MESSAGE1 + user.getEmail()
				+ MailMessages.ADDMISSION_CONFIRMED_MESSAGE2 + password + MailMessages.ADDMISSION_CONFIRMED_MESSAGE3;
		String sub = user.getName() + ",Your admission has been confirmed at SSPKM";
		try {
			sendMail(user.getEmail(), sub, msg);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean resetPassword(JavaMailSender jms, User user,String url) {
		this.mailSender = jms;
		String msg = MailMessages.PASSWORD_RESET_MESSAGE1 + url + MailMessages.PASSWORD_RESET_MESSAGE2;
		String sub = user.getName() + ",you have requested for reset password link";
		try {
			sendMail(user.getEmail(), sub, msg);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}
