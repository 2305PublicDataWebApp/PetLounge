package com.lounge.pet.support.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lounge.pet.support.domain.Support;
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

}
