package com.lounge.pet.notice.store.logic;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.lounge.pet.notice.domain.Notice;
import com.lounge.pet.notice.domain.PageInfo;
import com.lounge.pet.notice.store.NoticeStore;

@Repository
public class NoticeStoreLogic implements NoticeStore {

	@Override
	public int getListCount2(SqlSession session) {
		int result = session.selectOne("NoticeMapper.getListCount2");
		return result;
	}

	@Override
	public List<Notice> selectNoticeList(SqlSession session, PageInfo pInfo) {
		int limit = pInfo.getRecordCountPerPage();	// 'PageInfo" 객체에서 한 페이지 당 표시할 항목수를 가져와 'limit'변수에 저장
		int offset = (pInfo.getCurrentPage()-1)*limit;	// 결과목록의 시작 위치를 계산하여 'offset' 변수에 저장
		RowBounds rowBounds = new RowBounds(offset, limit);	 // MyBatis에서 페이징처리를 위해 사용되는 'RowBounds' 객체를 생성하고 'offset'과 'limit' 값을 설정
		List<Notice> nList = session.selectList("NoticeMapper.selectNoticeList", null, rowBounds);	  // 'null'은 SQL쿼리에 전달할 매개변수가 없음을 나타냄, rowBounds 객체는 페이징 처리를 적용하기위해 사용
		return nList;
	}

	@Override
	public Notice selectOneNoticeNo(SqlSession session, int nNo) {
		Notice nOne = session.selectOne("NoticeMapper.selectOneNoticeNo", nNo);
		return nOne;
	}

	@Override
	public int updateViewCount(SqlSession session, Notice nOne) {
		int result = session.update("NoticeMapper.updateViewCount", nOne);
		return result;
	}

	@Override
	public int getListCount(SqlSession session, Map<String, String> nParamMap) {
		int result = session.selectOne("NoticeMapper.getListCount");
		return result;
	}

	@Override
	public List<Notice> searchByKeyword(SqlSession session, PageInfo pInfo, Map<String, String> nParamMap) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage() -1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Notice> nList = session.selectList("NoticeMapper.searchByKeyword", nParamMap, rowBounds);
		return nList;
	}

	@Override
	public int submitNoticeForm(SqlSession session, Notice notice) {
		int result = session.insert("NoticeMapper.submitNoticeForm", notice);
		return result;
	}

	@Override
	public int noticeDelete(SqlSession session, int nNo) {
		int result = session.update("NoticeMapper.noticeDelete", nNo);
		return result;
	}

	@Override
	public int updateNotice(SqlSession session, Notice notice) {
		int result = session.update("NoticeMapper.updateNotice", notice);
		return result;
	}

	
}
;