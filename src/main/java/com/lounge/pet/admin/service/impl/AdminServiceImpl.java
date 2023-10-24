package com.lounge.pet.admin.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lounge.pet.admin.service.AdminService;
import com.lounge.pet.admin.store.AdminStore;
import com.lounge.pet.hospital.domain.HReview;
import com.lounge.pet.support.domain.SupportHistory;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private SqlSession session;
	
	@Autowired
	private AdminStore aStore;
	
	@Override
	public List<SupportHistory> selectHistoryList() {
		List<SupportHistory> sHList = aStore.selectHistoryList(session);
		return sHList;
	}

	@Override
	public int getHReviewTotalCount() {
		int count = aStore.getHReviewTotalCount(session);
		return count;
	}

	@Override
	public List<HReview> selectHReviewList() {
		List<HReview> hRList = aStore.selectHReviewList(session);
		return hRList;
	}

}
