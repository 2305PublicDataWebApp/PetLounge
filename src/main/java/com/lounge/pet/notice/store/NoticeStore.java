package com.lounge.pet.notice.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.lounge.pet.notice.domain.Notice;
import com.lounge.pet.notice.domain.PageInfo;

public interface NoticeStore {

	/**
	 * 데이터베이스에서 공지사항 게시물의 총 개수를 조회
	 * @param session
	 * @return
	 */
	int getListCount2(SqlSession session);

	/**
	 * 데이터베이스에서 페이징 처리된 공지사항 게시물 목록 조회
	 * @param session
	 * @param pInfo
	 * @return
	 */
	List<Notice> selectNoticeList(SqlSession session, PageInfo pInfo);

	/**
	 * 공지 게시글 상세 조회
	 * @param session
	 * @param nNo
	 * @return
	 */
	Notice selectOneNoticeNo(SqlSession session, int nNo);

	/**
	 * 공지 조회수 증가
	 * @param session
	 * @param nOne
	 * @return
	 */
	int updateViewCount(SqlSession session, Notice nOne);

	/**
	 * 공지 검색 게시글 전체 개수
	 * @param session
	 * @param nParamMap
	 * @return
	 */
	int getListCount(SqlSession session, Map<String, String> nParamMap);

	/**
	 * 공지 게시글 조건에 따라 키워드로 조회
	 * @param session
	 * @param pInfo
	 * @param nParamMap
	 * @return
	 */
	List<Notice> searchByKeyword(SqlSession session, PageInfo pInfo, Map<String, String> nParamMap);

	/**
	 * 공지글 등록
	 * @param session
	 * @param notice
	 * @return
	 */
	int submitNoticeForm(SqlSession session, Notice notice);

	/**
	 * 공지글 삭제
	 * @param session
	 * @param nNo
	 * @return
	 */
	int noticeDelete(SqlSession session, int nNo);

	/**
	 * 공지글 수정
	 * @param session
	 * @param notice
	 * @return
	 */
	int updateNotice(SqlSession session, Notice notice);

}
