package com.lounge.pet.support.service;

import java.util.List;

import com.lounge.pet.support.domain.PageInfo;
import com.lounge.pet.support.domain.Support;
import com.lounge.pet.support.domain.SupportReply;

public interface SupportService {

	/**
	 * 후원글 등록 Service
	 * @param support
	 * @return int 
	 */
	int insertSupport(Support support);

	/**
	 * 후원글 상세 조회 Service
	 * @param sNo
	 * @return Support
	 */
	Support selectSupportByNo(int sNo);

	/**
	 * 후원글 수정 Service
	 * @param support
	 * @return int 
	 */
	int updateSupport(Support support);

	/**
	 * 후원 내역 갯수 조회 Service
	 * @param sNo
	 * @return int
	 */
	int getHistoryCount(int sNo);

	/**
	 * 후원글 삭제 Service
	 * @param sNo
	 * @return int
	 */
	int deleteSupport(int sNo);

	/**
	 * 후원글 전체 갯수 조회 Service
	 * @return int
	 */
	int getListCount();

	/**
	 * 후원글 전체 조회 Service
	 * @param pInfo
	 * @return List
	 */
	List<Support> selectSupportList();

	/**
	 * 후원댓글 등록 Service
	 * @param sReply
	 * @return int
	 */
	int insertReply(SupportReply sReply);

	/**
	 * 후원댓글 조회 Service
	 * @param sNo
	 * @return List
	 */
	List<SupportReply> selectSReplyList(int sNo);

	/**
	 * 후원댓글 갯수 조회 Service
	 * @return int 
	 */
	int getReplyListCount(int sNo);

	/**
	 * 후원댓글 삭제 Service
	 * @param sRNo
	 * @return int 
	 */
	int deleteReply(int sRNo);

	/**
	 * 후원댓글 수정 Service
	 * @param sReply
	 * @return int
	 */
	int updateReply(SupportReply sReply);

}
