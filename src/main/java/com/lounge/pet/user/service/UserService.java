package com.lounge.pet.user.service;

import java.util.List;
import java.util.Map;

import com.lounge.pet.board.domain.Board;
import com.lounge.pet.hospital.domain.HBookmark;
import com.lounge.pet.hospital.domain.Hospital;
import com.lounge.pet.support.domain.Support;
import com.lounge.pet.user.domain.UPageInfo;
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


	

	/**
	 * 병원 북마크 조회
	 * @param hBList
	 * @return
	 */
	List<Hospital> selectHos(String sessionId, UPageInfo aInfo);

	/**
	 * 즐겨찾는 병원 페이징
	 * @return
	 */
	Integer getListCount(String sessionId);

	/**
	 * 즐겨찾는 병원 검색
	 * @param paramMap
	 * @return
	 */
	int getListCount(Map<String, String> paramMap);

	/**
	 * 조건에 따른 즐겨찾기 병원 검색
	 * @param aInfo
	 * @param paramMap
	 * @return
	 */
	List<Hospital> searchUserByKeyword(UPageInfo aInfo, Map<String, String> paramMap);



	

	
}
