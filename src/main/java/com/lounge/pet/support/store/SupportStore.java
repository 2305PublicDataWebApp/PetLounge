package com.lounge.pet.support.store;

import org.apache.ibatis.session.SqlSession;

import com.lounge.pet.support.domain.Support;

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

}
