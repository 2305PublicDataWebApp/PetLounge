package com.lounge.pet.notice.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lounge.pet.notice.domain.Notice;
import com.lounge.pet.notice.domain.PageInfo2;

public interface NoticeStore {

	/**
	 * 데이터베이스에서 공지사항 게시물의 총 개수를 조회
	 * @param session
	 * @return
	 */
	int getListCount(SqlSession session);

	/**
	 * 데이터베이스에서 페이징 처리된 공지사항 게시물 목록 조회
	 * @param session
	 * @param pInfo
	 * @return
	 */
	List<Notice> selectNoticeList(SqlSession session, PageInfo2 pInfo);

}
