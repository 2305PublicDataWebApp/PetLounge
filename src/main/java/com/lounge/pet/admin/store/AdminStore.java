package com.lounge.pet.admin.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lounge.pet.hospital.domain.HBookmark;
import com.lounge.pet.hospital.domain.HReview;
import com.lounge.pet.hospital.domain.Hospital;
import com.lounge.pet.support.domain.SupportHistory;
import com.lounge.pet.user.domain.User;

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
	 * 병원 후기 내역 조회
	 * @param session
	 * @return
	 */
	List<HReview> selectHReviewList(SqlSession session);

	/**
	 * 회원 정보 조회
	 * @param session
	 * @return
	 */
	List<User> selectUserList(SqlSession session);

	/**
	 * 회원정보 총 개수
	 * @param session
	 * @return
	 */
	int getUserListCount(SqlSession session);

	/**
	 * 병원 북마크 내역 조회
	 * @param session
	 * @return
	 */
	List<Hospital> selectHBookMarkList(SqlSession session);

	/** 
	 * 병원 북마크 총 개수
	 * @param session
	 * @return
	 */
	int getHBookMarkTotalCount(SqlSession session);

}
