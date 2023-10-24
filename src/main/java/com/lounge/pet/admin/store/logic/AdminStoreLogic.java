package com.lounge.pet.admin.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.lounge.pet.admin.store.AdminStore;
import com.lounge.pet.hospital.domain.HBookmark;
import com.lounge.pet.hospital.domain.HReview;
import com.lounge.pet.hospital.domain.Hospital;
import com.lounge.pet.support.domain.SupportHistory;
import com.lounge.pet.user.domain.User;

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

	@Override
	public List<User> selectUserList(SqlSession session) {
		List<User> sUList = session.selectList("AdminMapper.selectUserList");
		return sUList;
	}

	@Override
	public int getUserListCount(SqlSession session) {
		int result = session.selectOne("AdminMapper.getUserListCount");
		return result;
	}

	@Override
	public List<Hospital> selectHBookMarkList(SqlSession session) {
		List<Hospital> hBMList = session.selectList("AdminMapper.selectHBookMarkList");
		return hBMList;
	}

	@Override
	public int getHBookMarkTotalCount(SqlSession session) {
		int result = session.selectOne("AdminMapper.getHBookMarkTotalCount");
		return result;
	}

}
