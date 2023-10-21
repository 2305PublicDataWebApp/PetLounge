package com.lounge.pet.mail.service;

import com.lounge.pet.support.domain.SupportHistory;
import com.lounge.pet.user.domain.User;

public interface MailService {

	/**
	 * 인증 이메일 보내기
	 * @param mail
	 * @return
	 */
	int sendMail(String mail);

	/**
	 * 후원내역 이메일 보내기
	 * @param sHistory
	 * @return
	 */
	String sendMail(SupportHistory sHistory, User user);

}
