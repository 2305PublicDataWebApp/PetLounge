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

	/**
	 * 로그인
	 * @param session
	 * @param user
	 * @return int
	 */
	User userLogin(SqlSession session, User user);

	/**
	 * 회원정보조회
	 * @param session
	 * @param uId
	 * @return
	 */
	User selectOneById(SqlSession session, String uId);

}
