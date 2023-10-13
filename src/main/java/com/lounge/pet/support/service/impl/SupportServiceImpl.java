package com.lounge.pet.support.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lounge.pet.support.domain.Support;
import com.lounge.pet.support.domain.SupportReply;
import com.lounge.pet.support.service.SupportService;
import com.lounge.pet.support.store.SupportStore;

@Service
public class SupportServiceImpl implements SupportService{

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private SupportStore sStore;
	
	@Override
	public int insertSupport(Support support) {
		int result = sStore.insertSupport(sqlSession, support);
		return result;
	}

	@Override
	public Support selectSupportByNo(int sNo) {
		Support support = sStore.selectSupportByNo(sqlSession, sNo);
		return support;
	}

	@Override
	public int updateSupport(Support support) {
		int result = sStore.updateSupport(sqlSession, support);
		return result;
	}

	@Override
	public int getHistoryCount(int sNo) {
		int result = sStore.getHistoryCount(sqlSession, sNo);
		return result;
	}

	@Override
	public int deleteSupport(int sNo) {
		int result = sStore.deleteSupport(sqlSession, sNo);
		return result;
	}

	@Override
	public int getListCount() {
		int result = sStore.getListCount(sqlSession);
		return result;
	}

	@Override
	public List<Support> selectSupportList() {
		List<Support> sList = sStore.selectSupportList(sqlSession);
		return sList;
	}

	@Override
	public int insertReply(SupportReply sReply) {
		int result = sStore.insertReply(sqlSession, sReply);
		return result;
	}

	@Override
	public List<SupportReply> selectSReplyList(int sNo) {
		List<SupportReply> sRList = sStore.selectSReplyList(sqlSession, sNo);
		return sRList;
	}

	@Override
	public int getReplyListCount(int sNo) {
		int result = sStore.getListCount(sqlSession, sNo);
		return result;
	}

	@Override
	public int deleteReply(int sRNo) {
		int result = sStore.deleteReply(sqlSession, sRNo);
		return result;
	}

	@Override
	public int updateReply(SupportReply sReply) {
		int result = sStore.updateReply(sqlSession, sReply);
		return result;
	}

}
