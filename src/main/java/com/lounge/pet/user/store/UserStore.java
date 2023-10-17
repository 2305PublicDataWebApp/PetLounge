package com.lounge.pet.user.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.lounge.pet.board.domain.Board;
import com.lounge.pet.hospital.domain.HBookmark;
import com.lounge.pet.hospital.domain.Hospital;
import com.lounge.pet.support.domain.Support;
import com.lounge.pet.user.domain.UPageInfo;
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



	/**
	 * 북마크 병원 조회
	 * @param session
	 * @param hBList
	 * @return
	 */
	List<Hospital> selectHos(SqlSession session, String sessionId, UPageInfo aInfo);

	/**
	 * 즐겨찾는 병원 페이징
	 * @param session
	 * @return
	 */
	int selectListCount(SqlSession session, String sessionId);

	/**
	 * 즐겨찾는 병원 검색
	 * @param session
	 * @param paramMap
	 * @return
	 */
	int selectListCount(SqlSession session, Map<String, String> paramMap);

	/**
	 * 조건에 따른 즐겨찾는 병원 검색
	 * @param session
	 * @param aInfo
	 * @param paramMap
	 * @return
	 */
	List<Hospital> searchUserByKeyword(SqlSession session, UPageInfo aInfo, Map<String, String> paramMap);

	

	


}
