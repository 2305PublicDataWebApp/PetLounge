package com.lounge.pet.user.service;

import java.util.List;
import java.util.Map;

import com.lounge.pet.board.domain.Board;
import com.lounge.pet.hospital.domain.HBookmark;
import com.lounge.pet.hospital.domain.Hospital;
import com.lounge.pet.support.domain.Support;
import com.lounge.pet.support.domain.SupportReply;
import com.lounge.pet.user.domain.UPageInfo;
import com.lounge.pet.user.domain.User;
import com.lounge.pet.user.domain.UserFreeBoard;
import com.lounge.pet.user.domain.UserHosRe;
import com.lounge.pet.user.domain.UserSupport;


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
	Integer getHosListCount(String sessionId);

	/**
	 * 즐겨찾는 병원 검색 수
	 * @param paramMap
	 * @return
	 */
	int getHosSearchListCount(Map<String, String> paramMap);

	/**
	 * 조건에 따른 즐겨찾기 병원 검색
	 * @param aInfo
	 * @param paramMap
	 * @return
	 */
	List<Hospital> searchHosByKeyword(UPageInfo aInfo, Map<String, String> paramMap);

	/**
	 * 나의 게시글 조회
	 * @param sessionId
	 * @param aInfo
	 * @return
	 */
	List<Board> selectBoard(String sessionId, UPageInfo aInfo);

	/**
	 * 게시글 페이징
	 * @param sessionId
	 * @return
	 */
	Integer getBoardListCount(String sessionId);

	/**
	 * 조건에 따른 게시글 검색
	 * @param aInfo
	 * @param paramMap
	 * @return
	 */
	List<Board> searchBoardByKeyword(UPageInfo aInfo, Map<String, String> paramMap);

	/**
	 * 게시글 검색 수
	 * @param paramMap
	 * @return
	 */
	int getBoardSearchListCount(Map<String, String> paramMap);

	/**
	 * 병원리뷰 게시글 수
	 * @param sessionId
	 * @return
	 */
	Integer getHosReListCount(String sessionId);

	/**
	 * 병원리뷰 조회
	 * @param sessionId
	 * @param aInfo
	 * @return
	 */
	List<Hospital> selectHosRe(String sessionId, UPageInfo aInfo);

	/**
	 * 병원리뷰 검색 수
	 * @param paramMap
	 * @return
	 */
	int getHosReviewSearchListCount(Map<String, String> paramMap);

	/**
	 * 조건에 따른 병원리뷰 검색
	 * @param aInfo
	 * @param paramMap
	 * @return
	 */
	List<UserHosRe> searchHosReviewByKeyword(UPageInfo aInfo, Map<String, String> paramMap);

	/**
	 * 후원 게시글 수 
	 * @param sessionId
	 * @return
	 */
	Integer getSupportListCount(String sessionId);

	/**
	 * 후원 목록 조회
	 * @param sessionId
	 * @param aInfo
	 * @return
	 */
	List<SupportReply> selectSupport(String sessionId, UPageInfo aInfo);

	/**
	 * 후원 게시글 검색 수
	 * @param paramMap
	 * @return
	 */
	int getSupportSearchListCount(Map<String, String> paramMap);

	/**
	 * 조건에 따른 후원목록 검색
	 * @param aInfo
	 * @param paramMap
	 * @return
	 */
	List<UserSupport> searchSupportByKeyword(UPageInfo aInfo, Map<String, String> paramMap);

	/**
	 * 후원댓글 수
	 * @param sessionId
	 * @return
	 */
	Integer getSupportReplyListCount(String sessionId);

	/**
	 * 후원댓글 조회
	 * @param sessionId
	 * @param aInfo
	 * @return
	 */
	List<UserSupport> selectSupportReply(String sessionId, UPageInfo aInfo);

	/**
	 * 후원댓글 검색 수
	 * @param paramMap
	 * @return
	 */
	int getSupportReplySearchlistCount(Map<String, String> paramMap);

	/**
	 * 조건에 따른 후원댓글 검색
	 * @param aInfo
	 * @param paramMap
	 * @return
	 */
	List<UserSupport> searchSupportReplyByKeyword(UPageInfo aInfo, Map<String, String> paramMap);

	/**
	 * 이메일 중복체크
	 * @param uEmail
	 * @return
	 */
	User userCheckEmail(String uEmail);

	/**
	 * 아이디 찾기
	 * @param user
	 * @return
	 */
	User selectFindId(User user);

	/**
	 * 비밀번호 찾기
	 * @param user
	 * @return
	 */
	User selectFindPw(User user);

	/**
	 * 자유게시판 댓글 수
	 * @param sessionId
	 * @return
	 */
	Integer getBoardReplyListCount(String sessionId);

	/**
	 * 자유게시판 댓글 조회
	 * @param sessionId
	 * @param aInfo
	 * @return
	 */
	List<UserFreeBoard> selectBoardReply(String sessionId, UPageInfo aInfo);

	/**
	 * 자유게시판 댓글 검색 수
	 * @param paramMap
	 * @return
	 */
	int getBoardReplySearchListCount(Map<String, String> paramMap);

	/**
	 * 조건에 따른 자유게시판 검색 조회
	 * @param aInfo
	 * @param paramMap
	 * @return
	 */
	List<UserFreeBoard> searchBoardReplyByKeyword(UPageInfo aInfo, Map<String, String> paramMap);

	/**
	 * 자유게시판 북마크 수
	 * @param sessionId
	 * @return
	 */
	Integer getBookMarkListCount(String sessionId);

	/**
	 * 자유게시판 북마크 수
	 * @param sessionId
	 * @param aInfo
	 * @return
	 */
	List<UserFreeBoard> selectBookMark(String sessionId, UPageInfo aInfo);

	/**
	 * 자유게시판 북마크 검색 수
	 * @param paramMap
	 * @return
	 */
	int getBookMarkSearchListCount(Map<String, String> paramMap);

	/**
	 * 자유게시판 북마크 조회
	 * @param aInfo
	 * @param paramMap
	 * @return
	 */
	List<UserFreeBoard> searchBookMarkByKeyword(UPageInfo aInfo, Map<String, String> paramMap);

	

	


	

	

	



	

	
}
