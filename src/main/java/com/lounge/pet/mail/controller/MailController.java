package com.lounge.pet.mail.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lounge.pet.mail.service.MailService;

@Controller
public class MailController {

	@Autowired
	private MailService mailService;

	@ResponseBody
	@PostMapping("/user/sendMail.pet")
	public String MailSend(String mail) {

		// 인증번호 받는 곳
		int number = mailService.sendMail(mail);

		String num = "" + number;
		System.out.println(num);
		return num;
	}

}
