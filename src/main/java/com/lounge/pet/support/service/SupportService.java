package com.lounge.pet.support.service;

import java.util.List;
import java.util.Map;

import com.lounge.pet.support.domain.SPageInfo;
import com.lounge.pet.support.domain.Support;
import com.lounge.pet.support.domain.SupportHistory;
import com.lounge.pet.support.domain.SupportReply;
import com.lounge.pet.support.domain.SupportTotalAmount;
import com.lounge.pet.user.domain.UserSupport;

public interface SupportService {

	/**
	 * 후원글 등록 Service
	 * @param support
	 * @return int 
	 */
	int insertSupport(Support support);

	/**
	 * 후원글 수정 Service
	 * @param support
	 * @return int 
	 */
	int updateSupport(Support support);

	/**
	 * 후원 금액, 인원 추가 Service 
	 * @param sOne
	 * @return int 
	 */
	int updateSupportFund(Support sOne);

	/**
	 * 후원글 삭제 Service
	 * @param sNo
	 * @return int
	 */
	int deleteSupport(int sNo);

	/**
	 * 후원글 카테고리별 정렬 목록 조회 Service
	 * @param keyword
	 * @return List 
	 */
	List<Support> selectSupportList(Map<String, String> sMap, SPageInfo sPInfo);

	/**
	 * 후원글 카테고리별 갯수 조회 Service 
	 * @param keyword
	 * @return
	 */
	int getListCount(Map<String, String> sMap);

	/**
	 * 후원글 상세 조회 Service
	 * @param sNo
	 * @return Support
	 */
	Support selectSupportByNo(int sNo);

	/**
	 * 후원글 상태로 조회 Service
	 * @param funding
	 * @return
	 */
	List<Support> selectSupportListByStatus(String status);

	/**
	 * 후원글 상태로 갯수 조회 Service
	 * @param keyword
	 * @return
	 */
	int getSupportListCountByStatus(String status);

	/**
	 * 후원댓글 등록 Service
	 * @param sReply
	 * @return int
	 */
	int insertReply(SupportReply sReply);

	/**
	 * 후원댓글 수정 Service
	 * @param sReply
	 * @return int
	 */
	int updateReply(SupportReply sReply);

	/**
	 * 후원댓글 삭제 Service
	 * @param sRNo
	 * @return int 
	 */
	int deleteReply(int sRNo);

	/**
	 * 후원댓글 글번호로 조회 Service
	 * @param sNo
	 * @return List
	 */
	List<SupportReply> selectSReplyListByNo(int sNo);

	/**
	 * 후원댓글 글번호로 갯수 조회 Service
	 * @return int 
	 */
	int getReplyListCountByNo(int sNo);

	/**
	 * 후원댓글 전체 조회 Service
	 * @return List
	 */
	List<UserSupport> selectReplyList();

	/**
	 * 후원댓글 전체 갯수 조회 Service
	 * @return int
	 */
	int getReplyListCount();

	/**
	 * 후원내역 등록 Service
	 * @param sHistory
	 * @return int
	 */
	int insertHistory(SupportHistory sHistory);

	/**
	 * 후원내역 글번호로 조회 Service
	 * @param sNo
	 * @return List
	 */
	List<SupportHistory> selectSHistoryList(int sNo);

	/**
	 * 후원내역 글번호로 갯수 조회 Service
	 * @param sNo
	 * @return int
	 */
	int getHistoryCount(int sNo);

	/**
	 * 후원내역 조회 Service
	 * @return List
	 */
	List<UserSupport> selectHistoryList();

	/**
	 * 후원내역 갯수 조회 Service
	 * @return int
	 */
	int getHistoryListCount();

	/** 
	 * 후원 여부 확인 Service
	 * @param sHistory
	 * @return int
	 */
	int getCountSHistory(SupportHistory sHistory);

	/**
	 * 오늘 후원내역 조회 Service
	 * @return SupportHistory
	 */
	SupportHistory selectTodaySupport();

	/** 
	 * 메인페이지 후원 목록 조회 Service
	 * @return List
	 */
	List<Support> selectMainSupportList();

	/**
	 * 후원 타입별 후원 총액 조회 Service
	 * @return List
	 */
	List<SupportTotalAmount> selectSupportAmountByPaytype();

	
	

}
