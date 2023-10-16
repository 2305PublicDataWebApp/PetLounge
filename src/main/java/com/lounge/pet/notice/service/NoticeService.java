package com.lounge.pet.notice.service;

import java.util.List;
import java.util.Map;

import com.lounge.pet.notice.domain.Notice;
import com.lounge.pet.notice.domain.PageInfo;

public interface NoticeService {

	/**
	 * 현재 저장된 공지사항 게시물의 총 개수
	 * @return
	 */
	int getListCount2();

	/**
	 * 페이징 처리된 공지사항 게시물 목록
	 * @param pInfo
	 * @return
	 */
	List<Notice> selectNoticeList(PageInfo pInfo);

	/**
	 * 공지 게시글 상세조회
	 * @param nNo
	 * @return
	 */
	Notice selectOneNoticeNo(int nNo);

	/**
	 * 공지 조회수 증가
	 * @param nOne
	 * @return
	 */
	int updateViewCount(Notice nOne);

	/**
	 * 게시글 검색 전체 개수
	 * @param nParamMap
	 * @return
	 */
	int getListCount(Map<String, String> nParamMap);

	/**
	 * 공지 게시글 조건에 따라 키워드 검색
	 * @param pInfo
	 * @param nParamMap
	 * @return
	 */
	List<Notice> searchByKeyword(PageInfo pInfo, Map<String, String> nParamMap);

	/**
	 * 공지 게시글 등록
	 * @param notice
	 * @return
	 */
	int submitNoticeForm(Notice notice);

	/**
	 * 공지글 삭제
	 * @param nNo
	 * @return
	 */
	int noticeDelete(int nNo);

	/**
	 * 공지글 수정
	 * @param notice
	 * @return
	 */
	int updateNotice(Notice notice);

}
