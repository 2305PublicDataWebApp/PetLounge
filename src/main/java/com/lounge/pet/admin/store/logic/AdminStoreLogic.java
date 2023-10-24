package com.lounge.pet.admin.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.lounge.pet.admin.store.AdminStore;
import com.lounge.pet.hospital.domain.HReview;
import com.lounge.pet.support.domain.SupportHistory;

@Repository
public class AdminStoreLogic implements AdminStore {

	@Override
	public List<SupportHistory> selectHistoryList(SqlSession session) {
		List<SupportHistory> sHList = session.selectList("AdminMapper.selectHistoryList");
		return sHList;
	}

	@Override
	public int getHReviewTotalCount(SqlSession session) {
		int result = session.selectOne("AdminMapper.getHReviewTotalCount");
		return result;
	}

	@Override
	public List<HReview> selectHReviewList(SqlSession session) {
		List<HReview> hRList = session.selectList("AdminMapper.selectHReviewList");
		return hRList;
	}

}
