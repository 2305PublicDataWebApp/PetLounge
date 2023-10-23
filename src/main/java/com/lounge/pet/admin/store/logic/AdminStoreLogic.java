package com.lounge.pet.admin.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.lounge.pet.admin.store.AdminStore;
import com.lounge.pet.support.domain.SupportHistory;

@Repository
public class AdminStoreLogic implements AdminStore {

	@Override
	public List<SupportHistory> selectHistoryList(SqlSession session) {
		List<SupportHistory> sHList = session.selectList("AdminMapper.selectHistoryList");
		return sHList;
	}

}
