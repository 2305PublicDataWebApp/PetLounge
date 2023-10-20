package com.lounge.pet.mail.service.impl;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.lounge.pet.mail.service.MailService;

@Service
public class MailServiceImpl implements MailService {

	@Autowired
	private JavaMailSender javaMailSender = null;
	private static int number = 0;

	public static void createNumber() {
		number = (int) (Math.random() * (900000)) + 100000;// (int) Math.random() * (최댓값-최소값+1) + 최소값
	}

	public MimeMessage CreateMail(String mail) {
		createNumber();
		MimeMessage message = javaMailSender.createMimeMessage();
 
		try {
			message.setFrom("PetLounge7@gmail.com");
			message.setRecipients(MimeMessage.RecipientType.TO, mail);
			message.setSubject("PetLounge 이메일 인증번호 안내");
			String body = "";
			body += "<h3>" + "요청하신 인증 번호입니다." + "</h3>";
			body += "<h1>" + number + "</h1>";
			body += "<h3>" + "인증번호 입력칸에 6자리 숫자를 입력해주세요." + "</h3>";
			message.setText(body, "UTF-8", "html");
		} catch (MessagingException e) {
			e.printStackTrace();
		}

		return message;
	}

	public int sendMail(String mail) {
		MimeMessage message = CreateMail(mail);
		javaMailSender.send(message);

		return number;
	}

}
