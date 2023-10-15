package com.lounge.pet.notice.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lounge.pet.notice.domain.Notice;
import com.lounge.pet.notice.domain.PageInfo;
import com.lounge.pet.notice.service.NoticeService;
import com.lounge.pet.notice.store.NoticeStore;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeStore nStore;
	@Autowired
	private SqlSession session;
	
	@Override
	public int getListCount2() {
		int result = nStore.getListCount2(session);	// 실제로 공지사항 게시물의 총 개수를 데이터베이스에서 가져오는 역할
		return result;
	}

	@Override
	public List<Notice> selectNoticeList(PageInfo pInfo) {
		List<Notice> nList = nStore.selectNoticeList(session, pInfo);	// 'nStore' 객체를 사용하여 데이터베이스에서 공지사항 게시물 목록을 가져옴
		return nList;
	}

	@Override
	public Notice selectOneNoticeNo(int nNo) {
		Notice nOne = nStore.selectOneNoticeNo(session, nNo);
		return nOne;
	}

	@Override
	public int updateViewCount(Notice nOne) {
		int result = nStore.updateViewCount(session, nOne);
		return result;
	}

	@Override
	public int getListCount(Map<String, String> nParamMap) {
		int result = nStore.getListCount(session, nParamMap);
		return result;
	}

	@Override
	public List<Notice> searchByKeyword(PageInfo pInfo, Map<String, String> nParamMap) {
		List<Notice> nList = nStore.searchByKeyword(session, pInfo, nParamMap);
		return nList;
	}

	@Override
	public int submitNoticeForm(Notice notice) {
		int result = nStore.submitNoticeForm(session, notice);
		return result;
	}

	@Override
	public int noticeDelete(int nNo) {
		int result = nStore.noticeDelete(session, nNo);
		return result;
	}

	@Override
	public int updateNotice(Notice notice) {
		int result = nStore.updateNotice(session, notice);
		return result;
	}

}
