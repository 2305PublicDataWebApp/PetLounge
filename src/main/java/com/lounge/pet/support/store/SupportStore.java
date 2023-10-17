package com.lounge.pet.support.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.lounge.pet.support.domain.Support;
import com.lounge.pet.support.domain.SupportHistory;
import com.lounge.pet.support.domain.SupportReply;

public interface SupportStore {

	/**
	 * 후원글 등록 Store 
	 * @param sqlSession
	 * @param support
	 * @return int
	 */
	int insertSupport(SqlSession sqlSession, Support support);

	/**
	 * 후원글 상세 조회 Store
	 * @param sqlSession
	 * @param sNo
	 * @return Support
	 */
	Support selectSupportByNo(SqlSession sqlSession, int sNo);

	/**
	 * 후원글 수정 Store
	 * @param sqlSession
	 * @param support
	 * @return int 
	 */
	int updateSupport(SqlSession sqlSession, Support support);

	/**
	 * 후원 내역 갯수 조회 Store
	 * @param sqlSession
	 * @param sNo
	 * @return int
	 */
	int getHistoryCount(SqlSession sqlSession, int sNo);

	/** 
	 * 후원글 삭제 Store
	 * @param sqlSession
	 * @param sNo
	 * @return int
	 */
	int deleteSupport(SqlSession sqlSession, int sNo);

	/**
	 * 후원댓글 등록 Store
	 * @param sqlSession
	 * @param sReply
	 * @return int
	 */
	int insertReply(SqlSession sqlSession, SupportReply sReply);
	
	/**
	 * 후원댓글 조회 Store
	 * @param sqlSession
	 * @param sNo
	 * @return List
	 */
	List<SupportReply> selectSReplyList(SqlSession sqlSession, int sNo);

	/**
	 * 후원댓글 갯수 조회 Store
	 * @return int 
	 */
	int getListCount(SqlSession sqlSession, int sNo);

	/**
	 * 후원댓글 삭제 Store
	 * @param sqlSession
	 * @param sRNo
	 * @return int
	 */
	int deleteReply(SqlSession sqlSession, int sRNo);

	/**
	 * 후원댓글 수정 Store
	 * @param sqlSession
	 * @param sReply
	 * @return int
	 */
	int updateReply(SqlSession sqlSession, SupportReply sReply);

	/**
	 * 후원글 카테고리별 조회 Store
	 * @param sqlSession
	 * @param keyword
	 * @return List
	 */
	List<Support> selectSupportList(SqlSession sqlSession, Map<String, String> sMap);

	/**
	 * 후원글 전체 갯수 조회 Store
	 * @param sqlSession
	 * @param keyword
	 * @return int
	 */
	int getSearchCount(SqlSession sqlSession, Map<String, String> sMap);

	/**
	 * 후원 내역 등록 Store
	 * @param sqlSession
	 * @param sHistory
	 * @return int
	 */
	int insertHistory(SqlSession sqlSession, SupportHistory sHistory);

	/**
	 * 후원 금액, 인원 추가 Service 
	 * @param sqlSession
	 * @param sOne
	 * @return int
	 */
	int updateSupportFund(SqlSession sqlSession, Support sOne);

	/**
	 * 후원 여부 확인 Store
	 * @param sqlSession
	 * @param sHistory
	 * @return int
	 */
	int getCountSHistory(SqlSession sqlSession, SupportHistory sHistory);

	/**
	 * 후원 내역 조회 Store
	 * @param sqlSession
	 * @param sNo
	 * @return List
	 */
	List<SupportHistory> selectSHistoryList(SqlSession sqlSession, int sNo);

	/**
	 * 후원 내역 갯수 조회 Store
	 * @param sqlSession
	 * @param sNo 
	 * @return int
	 */
	int getHistoryListCount(SqlSession sqlSession, int sNo);

	/**
	 * 오늘 후원 내역 조회 Store
	 * @param sqlSession
	 * @return SupportHistory
	 */
	SupportHistory selectTodaySupport(SqlSession sqlSession);


}
