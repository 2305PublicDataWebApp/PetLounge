package com.lounge.pet.admin.service;

import java.util.List;

import com.lounge.pet.hospital.domain.HBookmark;
import com.lounge.pet.hospital.domain.HReview;
import com.lounge.pet.hospital.domain.Hospital;
import com.lounge.pet.support.domain.SupportHistory;
import com.lounge.pet.user.domain.User;

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

	/**
	 * 회원정보 조회
	 * @return
	 */
	List<User> selectUserList();
	
	/**
	 * 회원정보 총 개수
	 * @return
	 */
	int getUserListCount();

	/**
	 * 병원 북마크 내역 조회
	 * @return
	 */
	List<Hospital> selectHBookMarkList();

	/**
	 * 병원 북마크 총 개수
	 * @return
	 */
	int getHBookMarkTotalCount();

}
