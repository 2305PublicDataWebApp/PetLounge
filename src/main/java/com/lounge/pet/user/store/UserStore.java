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
	int insertUser(SqlSession session, User user);

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

	/**
	 * 회원정보수정
	 * @param session
	 * @param user
	 * @return
	 */
	int updateUser(SqlSession session, User user);

	/**
	 * 회원탈퇴
	 * @param session
	 * @param sessionId
	 * @return
	 */
	int deleteUser(SqlSession session, String sessionId);

}
