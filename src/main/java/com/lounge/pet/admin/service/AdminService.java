package com.lounge.pet.admin.service;

import java.util.List;

import com.lounge.pet.support.domain.SupportHistory;

public interface AdminService {

	/**
	 * 후원내역 조회
	 * @return
	 */
	List<SupportHistory> selectHistoryList();

}
