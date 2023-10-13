package com.lounge.pet.notice.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lounge.pet.notice.domain.Notice;
import com.lounge.pet.notice.domain.PageInfo2;
import com.lounge.pet.notice.service.NoticeService;
import com.lounge.pet.notice.store.NoticeStore;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeStore nStore;
	@Autowired
	private SqlSession session;
	
	@Override
	public int getListCount() {
		int result = nStore.getListCount(session);	// 실제로 공지사항 게시물의 총 개수를 데이터베이스에서 가져오는 역할
		return result;
	}

	@Override
	public List<Notice> selectNoticeList(PageInfo2 pInfo) {
		List<Notice> nList = nStore.selectNoticeList(session, pInfo);	// 'nStore' 객체를 사용하여 데이터베이스에서 공지사항 게시물 목록을 가져옴
		return nList;
	}

}
