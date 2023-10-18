package com.lounge.pet.user.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.lounge.pet.board.domain.Board;
import com.lounge.pet.hospital.domain.HBookmark;
import com.lounge.pet.hospital.domain.Hospital;
import com.lounge.pet.support.domain.Support;
import com.lounge.pet.support.domain.SupportReply;
import com.lounge.pet.user.domain.UPageInfo;
import com.lounge.pet.user.domain.User;
import com.lounge.pet.user.domain.UserHosRe;
import com.lounge.pet.user.domain.UserSupport;


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
	 * 즐겨찾는 병원 검색 수
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
	List<Hospital> searchHosByKeyword(SqlSession session, UPageInfo aInfo, Map<String, String> paramMap);

	/**
	 * 나의 게시글 조회
	 * @param session
	 * @param sessionId
	 * @param aInfo
	 * @return
	 */
	List<Board> selectBoard(SqlSession session, String sessionId, UPageInfo aInfo);

	/**
	 * 게시글 페이징
	 * @param session
	 * @param sessionId
	 * @return
	 */
	int selectBoardListCount(SqlSession session, String sessionId);

	/**
	 * 조건에 따른 게시글 검색
	 * @param session
	 * @param aInfo
	 * @param paramMap
	 * @return
	 */
	List<Board> searchBoardByKeyword(SqlSession session, UPageInfo aInfo, Map<String, String> paramMap);

	/**
	 * 게시글 검색 수
	 * @param session
	 * @param paramMap
	 * @return
	 */
	int selectBoardSearchListCount(SqlSession session, Map<String, String> paramMap);

	/**
	 * 병원리뷰 게시글 수
	 * @param session
	 * @param sessionId
	 * @return
	 */
	int selectHosReListCount(SqlSession session, String sessionId);

	/**
	 * 병원리뷰 게시글 조회
	 * @param session
	 * @param aInfo
	 * @return
	 */
	List<Hospital> selectHosRe(SqlSession session, String sessionId, UPageInfo aInfo);

	/**
	 * 병원 리뷰 검색 게시글 수
	 * @param session
	 * @param paramMap
	 * @return
	 */
	int selectHosReSearchListCount(SqlSession session, Map<String, String> paramMap);

	/**
	 * 조건에 따른 병원 리뷰 검색
	 * @param session
	 * @param aInfo
	 * @param paramMap
	 * @return
	 */
	List<UserHosRe> searchHosReviewByKeyword(SqlSession session, UPageInfo aInfo, Map<String, String> paramMap);

	/**
	 * 후원 게시글 수
	 * @param session
	 * @param sessionId
	 * @return
	 */
	int selectSupportListCount(SqlSession session, String sessionId);

	/**
	 * 후원목록 조회
	 * @param session
	 * @param sessionId
	 * @param aInfo
	 * @return
	 */
	List<SupportReply> selectSupport(SqlSession session, String sessionId, UPageInfo aInfo);

	/**
	 * 후원 게시글 검색 수
	 * @param session
	 * @param paramMap
	 * @return
	 */
	int selectSupportSearchListCount(SqlSession session, Map<String, String> paramMap);

	/**
	 * 조건에 따른 후원목록 검색
	 * @param session
	 * @param aInfo
	 * @param paramMap
	 * @return
	 */
	List<UserSupport> searchSupportByKeyword(SqlSession session, UPageInfo aInfo, Map<String, String> paramMap);

	/**
	 * 후원 댓글 수
	 * @param session
	 * @param sessionId
	 * @return
	 */
	int selectSupportReplyListCount(SqlSession session, String sessionId);

	/**
	 * 후원댓글 조회
	 * @param session
	 * @param sessionId
	 * @param aInfo
	 * @return
	 */
	List<UserSupport> selectSupportReply(SqlSession session, String sessionId, UPageInfo aInfo);

	/**
	 * 후원댓글 검색 수
	 * @param session
	 * @param paramMap
	 * @return
	 */
	int selectSupportReplySearchlistCount(SqlSession session, Map<String, String> paramMap);

	/**
	 * 조건에 따른 후원댓글 검색
	 * @param session
	 * @param aInfo
	 * @param paramMap
	 * @return
	 */
	List<UserSupport> searchSupportReplyByKeyword(SqlSession session, UPageInfo aInfo, Map<String, String> paramMap);

	

	


}
