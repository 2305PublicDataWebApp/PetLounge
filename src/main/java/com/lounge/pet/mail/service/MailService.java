package com.lounge.pet.mail.service;

public interface MailService {

	/**
	 * 인증 이메일 보내기
	 * @param mail
	 * @return
	 */
	int sendMail(String mail);

}
