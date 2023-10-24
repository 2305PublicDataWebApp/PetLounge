package com.lounge.pet.admin.service;

import java.util.List;

import com.lounge.pet.hospital.domain.HReview;
import com.lounge.pet.support.domain.SupportHistory;

public interface AdminService {

	/**
	 * 후원내역 조회
	 * @return
	 */
	List<SupportHistory> selectHistoryList();

	/**
	 * 병원후기 총 개수
	 * @return
	 */
	int getHReviewTotalCount();

	/**
	 * 병원 후기 내역 총 조회
	 * @return
	 */
	List<HReview> selectHReviewList();

}
