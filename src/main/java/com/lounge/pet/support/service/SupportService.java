package com.lounge.pet.support.service;

import com.lounge.pet.support.domain.Support;

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

}
