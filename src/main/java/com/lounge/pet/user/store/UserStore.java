package com.lounge.pet.user.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lounge.pet.board.domain.Board;
import com.lounge.pet.support.domain.Support;
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

	/**
	 * 아이디 중복체크
	 * @param session
	 * @param uId
	 * @return
	 */
	User userCheckId(SqlSession session, String uId);

	/**
	 * 닉네임 중복체크
	 * @param session
	 * @param uNickName
	 * @return
	 */
	User userCheckNick(SqlSession session, String uNickName);

	


}
