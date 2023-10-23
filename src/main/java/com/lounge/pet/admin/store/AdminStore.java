package com.lounge.pet.admin.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lounge.pet.support.domain.SupportHistory;

public interface AdminStore {

	/**
	 * 후원내역 조회
	 * @param session
	 * @return
	 */
	List<SupportHistory> selectHistoryList(SqlSession session);

}
