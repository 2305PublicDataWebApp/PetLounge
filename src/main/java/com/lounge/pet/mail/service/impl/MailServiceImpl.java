package com.lounge.pet.mail.service.impl;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.lounge.pet.mail.service.MailService;
import com.lounge.pet.support.domain.SupportHistory;
import com.lounge.pet.user.domain.User;

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
			body += "<h3>" + "안녕하세요<font color='#FFD370'> 펫라운지</font>입니다." + "</h3>";
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

	// 후원내역 이메일 보내기 
	public MimeMessage CreateSupportHistoryMail(SupportHistory sHistory, User user) {
		MimeMessage message = javaMailSender.createMimeMessage();
		String mail = user.getuEmail();
		try {
			message.setFrom("PetLounge7@gmail.com");
			message.setRecipients(MimeMessage.RecipientType.TO, mail);
			message.setSubject("PetLounge 후원내역"); // 메일 제목 
			
			String nickname = user.getuNickName();
			
			
			// 결제일자 분까지만 끊어주기 
			Timestamp payDate = sHistory.getsHPaydate();
			// 분까지만 포맷팅할 패턴을 정의
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			// Timestamp를 Date로 변환
			Date date = new Date(payDate.getTime());
			// Date를 원하는 포맷으로 변환
			String formattedDate = sdf.format(date);
			
			// 결제방법 한글로 만들어주기 
			String payTypeEng = sHistory.getsHPaytype();
			String payTypeKor = "";
			if(payTypeEng.equals("kakaopay")) {
				payTypeKor = "카카오페이";
			} else if(payTypeEng.equals("creditcard")){
				payTypeKor = "신용카드";
			}
			
			// 결제금액에 , 넣어주기 
			DecimalFormat decimalFormat = new DecimalFormat("#,###");
			int amount = sHistory.getsHAmount();
			String formattedAmount = decimalFormat.format(amount);
			
			System.out.println("결제일자 : " + formattedDate + ", 결제방법 : " + payTypeKor + ", 금액 : " + formattedAmount);
			
			String body = "";
			body += "<h1><font color='#FFD370'>" + nickname + "</font>님의 후원에 감사드립니다.</h1>";
			body += "<h3>" + nickname + " 후원자님 안녕하세요.</h3>";
			body += "<h2>" + nickname + "님은 " + formattedDate + "에 " + payTypeKor + "로 " + formattedAmount + "원을 후원해주셨습니다.</h2>";
			body += "<h3>후원내역은 <font color='#FFD370'>마이페이지 > 후원관리 > 후원내역</font>에서도 확인 가능합니다.</h3>";
			body += "<h3><font color='#FFD370'>동물들에게 소중한 나눔을 실천해주신 후원자님께 다시 한번 감사드립니다.</font></h3>";
			message.setText(body, "UTF-8", "html");
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		return message;
	}
	
	// 후원 내역 보내기 
	public String sendMail(SupportHistory sHistory, User user) {
		MimeMessage message = CreateSupportHistoryMail(sHistory, user);
		javaMailSender.send(message);
		return "success";
	}
}
