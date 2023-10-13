package com.lounge.pet.notice.service;

import java.util.List;

import com.lounge.pet.notice.domain.Notice;
import com.lounge.pet.notice.domain.PageInfo2;

public interface NoticeService {

	/**
	 * 현재 저장된 공지사항 게시물의 총 개수
	 * @return
	 */
	int getListCount();

	/**
	 * 페이징 처리된 공지사항 게시물 목록
	 * @param pInfo
	 * @return
	 */
	List<Notice> selectNoticeList(PageInfo2 pInfo);

}
