package com.lounge.pet.support.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.lounge.pet.support.domain.PageInfo;
import com.lounge.pet.support.domain.Support;
import com.lounge.pet.support.domain.SupportReply;
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

	@Override
	public int getListCount(SqlSession sqlSession) {
		int result = sqlSession.selectOne("SupportMapper.getTotalCount");
		return result;
	}

	@Override
	public List<Support> selectSupportList(SqlSession sqlSession, PageInfo pInfo) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Support> sList = sqlSession.selectList("SupportMapper.selectSupportList", null, rowBounds);
		return sList;
	}

	@Override
	public int insertReply(SqlSession sqlSession, SupportReply sReply) {
		int result = sqlSession.insert("SReplyMapper.insertReply", sReply);
		return result;
	}

	@Override
	public List<SupportReply> selectSReplyList(SqlSession sqlSession, int sNo) {
		List<SupportReply> sRList = sqlSession.selectList("SReplyMapper.selectSReplyList", sNo);
		return sRList;
	}

	@Override
	public int getListCount(SqlSession sqlSession, int sNo) {
		int result = sqlSession.selectOne("SReplyMapper.getTotalCount", sNo);
		return result;
	}

	

}
