package com.lounge.pet.user.service;

import com.lounge.pet.user.domain.User;

public interface UserService {

	/**
	 * 회원가입 Service
	 * @param user
	 * @return int
	 */
	int userRegister(User user);

}
