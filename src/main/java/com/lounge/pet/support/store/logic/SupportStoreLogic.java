package com.lounge.pet.support.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.lounge.pet.support.domain.Support;
import com.lounge.pet.support.store.SupportStore;

@Repository
public class SupportStoreLogic implements SupportStore{

	@Override
	public int insertSupport(SqlSession sqlSession, Support support) {
		int result = sqlSession.insert("SupportMapper.insertSupport", support);
		return result;
	}

	@Override
	public Support selectSupportByNo(SqlSession sqlSession, int sNo) {
		Support support = sqlSession.selectOne("SupportMapper.selectSupportByNo", sNo);
		return support;
	}

	@Override
	public int updateSupport(SqlSession sqlSession, Support support) {
		int result = sqlSession.update("SupportMapper.updateSupport", support);
		return result;
	}

	@Override
	public int getHistoryCount(SqlSession sqlSession, int sNo) {
		int result = sqlSession.selectOne("SHistoryMapper.getTotalCount", sNo);
		return result;
	}

	@Override
	public int deleteSupport(SqlSession sqlSession, int sNo) {
		int result = sqlSession.update("SupportMapper.deleteSupport", sNo);
		return result;
	}

}
