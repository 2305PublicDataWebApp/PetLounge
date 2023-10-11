package com.lounge.pet.user.store;

import org.apache.ibatis.session.SqlSession;

import com.lounge.pet.user.domain.User;

public interface UserStore {

	/**
	 * 회원가입
	 * @param session
	 * @param user
	 * @return int
	 */
	int userRegister(SqlSession session, User user);

}
