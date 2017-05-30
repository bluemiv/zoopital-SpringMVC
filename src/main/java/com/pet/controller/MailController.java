package com.pet.controller;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pet.model.MailDTO;

@Controller
public class MailController {
	
	// 메일발송 테스트
	@RequestMapping("/sendMail.pet")
	public String navermailtest(MailDTO mailDTO) throws Exception {

		// 메일 관련 정보
		String host = "";
		if(mailDTO.getEmail_host().equals("naver.com")){
			host = "smtp.naver.com";
		}else if(mailDTO.getEmail_host().equals("hanmail.net")){
			host = "smtp.hanmail.net";
		}
		final String username = mailDTO.getSend_email(); // 나의 이메일 주소 (네이버 이메일 주소 @ naver.com앞주소만 기재)
		final String password = mailDTO.getSend_pwd(); // 나의 비밀번호
		int port = 465;
		
		// 메일 내용
		String recipient = mailDTO.getReceive_email(); // 상대방 이메일 주소를 기재해 줍니다.
		String subject = mailDTO.getTitle(); // 제목
		String body = mailDTO.getContents(); // 내용

		Properties props = System.getProperties();

		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host);

		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			String un = username;
			String pw = password;

			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(un, pw);
			}
		});
		session.setDebug(true); // for debug

		Message mimeMessage = new MimeMessage(session);
		mimeMessage.setFrom(new InternetAddress(username + "@" + mailDTO.getEmail_host()));
		mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
		mimeMessage.setSubject(subject);
		mimeMessage.setText(body);
		Transport.send(mimeMessage);

		return "redirect:home.pet";
	}

}
