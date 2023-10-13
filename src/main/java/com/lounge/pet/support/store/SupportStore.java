package com.lounge.pet.support.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lounge.pet.support.domain.Support;
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
	 * 후원글 전체 갯수 조회 Store
	 * @param sqlSession
	 * @return int
	 */
	int getListCount(SqlSession sqlSession);

	/**
	 * 후원글 전체 조회 Store
	 * @param sqlSession
	 * @param pInfo
	 * @return List
	 */
	List<Support> selectSupportList(SqlSession sqlSession);

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


}
