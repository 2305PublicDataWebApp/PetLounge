package com.lounge.pet.support.store.logic;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.lounge.pet.support.domain.SPageInfo;
import com.lounge.pet.support.domain.Support;
import com.lounge.pet.support.domain.SupportHistory;
import com.lounge.pet.support.domain.SupportReply;
import com.lounge.pet.support.store.SupportStore;
import com.lounge.pet.user.domain.UserSupport;

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
		int result = sqlSession.selectOne("SHistoryMapper.getHistoryCount", sNo);
		return result;
	}

	@Override
	public int deleteSupport(SqlSession sqlSession, int sNo) {
		int result = sqlSession.update("SupportMapper.deleteSupport", sNo);
		return result;
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

	@Override
	public int deleteReply(SqlSession sqlSession, int sRNo) {
		int result = sqlSession.delete("SReplyMapper.deleteReply", sRNo);
		return result;
	}

	@Override
	public int updateReply(SqlSession sqlSession, SupportReply sReply) {
		int result = sqlSession.delete("SReplyMapper.updateReply", sReply);
		return result;
	}

	@Override
	public List<Support> selectSupportList(SqlSession sqlSession, Map<String, String> sMap, SPageInfo sPInfo) {
		int limit = sPInfo.getRecordCountPerPage();
		int offset = (sPInfo.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Support> sList = sqlSession.selectList("SupportMapper.selectSupportList", sMap, rowBounds);
		return sList;
	}

	@Override
	public int getListCount(SqlSession sqlSession, Map<String, String> sMap) {
		int result = sqlSession.selectOne("SupportMapper.getListCount", sMap);
		return result;
	}

	@Override
	public int insertHistory(SqlSession sqlSession, SupportHistory sHistory) {
		int result = sqlSession.insert("SHistoryMapper.insertHistory", sHistory);
		return result;
	}

	@Override
	public int updateSupportFund(SqlSession sqlSession, Support sOne) {
		int result = sqlSession.update("SupportMapper.updateSupportFund", sOne);
		return result;
	}

	@Override
	public int getCountSHistory(SqlSession sqlSession, SupportHistory sHistory) {
		int result = sqlSession.selectOne("SHistoryMapper.getCountSHistory", sHistory);
		return result;
	}

	@Override
	public List<SupportHistory> selectSHistoryList(SqlSession sqlSession, int sNo) {
		List<SupportHistory> sHList = sqlSession.selectList("SHistoryMapper.selectSHistoryList", sNo);
		return sHList;
	}


	@Override
	public SupportHistory selectTodaySupport(SqlSession sqlSession) {
		SupportHistory sHistory = sqlSession.selectOne("SHistoryMapper.selectTodaySupport");
		return sHistory;
	}

	@Override
	public List<Support> selectSupportListByStatus(SqlSession sqlSession, String status) {
		List<Support> sList = sqlSession.selectList("SupportMapper.selectSupportListByStatus", status);
		return sList;
	}

	@Override
	public int getSupportListCountByStatus(SqlSession sqlSession, String status) {
		int result = sqlSession.selectOne("SupportMapper.getSupportListCountByStatus", status);
		return result;
	}

	@Override
	public List<UserSupport> selectHistoryList(SqlSession sqlSession) {
		List<UserSupport> sHList = sqlSession.selectList("SHistoryMapper.selectHistoryList");
		return sHList;
	}

	@Override
	public int getHistoryListCount(SqlSession sqlSession) {
		int result = sqlSession.selectOne("SHistoryMapper.getHistoryListCount");
		return result;
	}

	@Override
	public List<UserSupport> selectReplyList(SqlSession sqlSession) {
		List<UserSupport> sRList = sqlSession.selectList("SReplyMapper.selectReplyList");
		return sRList;
	}

	@Override
	public int getReplyListCount(SqlSession sqlSession) {
		int result = sqlSession.selectOne("SReplyMapper.getReplyListCount");
		return result;
	}

	

}
