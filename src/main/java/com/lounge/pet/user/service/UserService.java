package com.lounge.pet.user.service;

import com.lounge.pet.user.domain.User;

public interface UserService {

	/**
	 * 회원가입 Service
	 * @param user
	 * @return int
	 */
	int userRegister(User user);

	/**
	 * 로그인
	 * @param user
	 * @return
	 */
	User userLogin(User user);

	/**
	 * 회원정보조회
	 * @param uId
	 * @return
	 */
	User selectOneById(String uId);

}
