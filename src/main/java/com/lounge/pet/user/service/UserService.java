package com.lounge.pet.user.service;

import java.util.List;

import com.lounge.pet.board.domain.Board;
import com.lounge.pet.support.domain.Support;
import com.lounge.pet.user.domain.User;


public interface UserService {

	/**
	 * 회원가입 Service
	 * @param user
	 * @return int
	 */
	int insertUser(User user);

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

	/**
	 * 회원정보수정
	 * @param user
	 * @return
	 */
	int UpdateUser(User user);

	/**
	 * 회원탈퇴
	 * @param sessionId
	 * @return
	 */
	int deleteUser(String sessionId);

	/**
	 * 아이디 중복체크
	 * @param uId
	 * @return
	 */
	User userCheckId(String uId);

	/**
	 * 닉네임 중복체크
	 * @param uNickName
	 * @return
	 */
	User userCheckNick(String uNickName);

	

	
}
