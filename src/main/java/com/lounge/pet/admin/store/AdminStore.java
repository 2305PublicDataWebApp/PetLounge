package com.lounge.pet.admin.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lounge.pet.hospital.domain.HReview;
import com.lounge.pet.support.domain.SupportHistory;

public interface AdminStore {

	/**
	 * 후원내역 조회
	 * @param session
	 * @return
	 */
	List<SupportHistory> selectHistoryList(SqlSession session);

	/**
	 * 병원후기 총 개수
	 * @param session
	 * @return
	 */
	int getHReviewTotalCount(SqlSession session);

	/**
	 * 병원 후기 내역 총 개수
	 * @param session
	 * @return
	 */
	List<HReview> selectHReviewList(SqlSession session);

}
