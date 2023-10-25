package com.lounge.pet.board.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lounge.pet.board.domain.Board;
import com.lounge.pet.board.domain.FBookmark;
import com.lounge.pet.board.domain.FReply;
import com.lounge.pet.board.service.BoardService;
import com.lounge.pet.board.store.BoardStore;
import com.lounge.pet.hospital.domain.HReview;


@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private SqlSession session;
	
	@Autowired
	private BoardStore bStore;
	
	
	@Override
	public List<Board> selectFreeBoardList() {
		List<Board> fList = bStore.selectFreeBoardList(session);
		return fList;
	}


	@Override
	public int getSearchCount(Map<String, String> fMap) {
		int result = bStore.getSearchCount(session, fMap);
		return result;
	}


	@Override
	public Board selectFreeBoardByNo(int fNo) {
		Board bOne = bStore.selectFreeBoardByNo(session, fNo);
		return bOne;
	}


	@Override
	public int updateViewCount(Board bOne) {
		int result = bStore.updateViewCount(session, bOne);
		return result;
	}


	@Override
	public int submitFreeBoardForm(Board board) {
		int result = bStore.submitFreeBoardForm(session, board);
		return result;
	}


	@Override
	public Board selectOneFreeBoardNo(int fNo) {
		Board bOne = bStore.selectOneFreeBoardNo(session, fNo);
		return bOne;
	}


	@Override
	public int updateFreeBoardPage(Board board) {
		int result = bStore.updateFreeBoardPage(session, board);
		return result;
	}


	@Override
	public int freeBoardDelete(int fNo) {
		int result = bStore.freeBoardDelete(session, fNo);
		return result;
	}


	@Override
	public int getSearchCount() {
		int result = bStore.getSearchCount(session);
		return result;
	}


	@Override
	public int selectFBook(FBookmark fBook) {
		int fBOne = bStore.selectFBook(session, fBook);
		return fBOne;
	}


	@Override
	public int insertFBook(FBookmark fBook) {
		int result = bStore.insertFBook(session, fBook);
		return result;
	}


	@Override
	public int deleteFBook(FBookmark fBook) {
		int result = bStore.deleteFBook(session, fBook);
		return result;
	}


	@Override
	public List<FReply> selectfReplyList(int fNo) {
		List<FReply> fRList = bStore.selectfReplyList(session, fNo);
		return fRList;
	}


	@Override
	public int getFReplyTotalCount(int fNo) {
		int count = bStore.getfReviewTotalCount(session, fNo);
		return count;
	}


	@Override
	public int insertFreeBoardReply(FReply fReply) {
		int result = bStore.insertFreeBoardReply(session, fReply);
		return result;
	}


	@Override
	public int updateFreeBoardReply(FReply fReply) {
		int result = bStore.updateFreeBoardReply(session, fReply);
		return result;
	}


	@Override
	public int deleteFreeBoardReply(FReply fReply) {
		int result = bStore.deleteFreeBoardReply(session, fReply);
		return result;
	}


	@Override
	public List<FReply> selectFreeBoardReplySearch(FReply searchKey) {
		List<FReply> fRList = bStore.selectFreeBoardReplySearch(session, searchKey);
		return fRList;
	}


	@Override
	public int getFreeBoardReplySearchTotalCount(FReply searchKey) {
		int count = bStore.getFreeBoardReplySearchTotalCount(session, searchKey);
		return count;
	}


	@Override
	public List<Board> selectFreeBoardSearch(Board searchKey) {
		List<Board> fList = bStore.selectFreeBoardSearch(session, searchKey);
		return fList;
	}


	@Override
	public int getFreeBoardSearchTotalCount(Board searchKey) {
		int count = bStore.getFreeBoardSearchTotalCount(session, searchKey);
		return count;
	}


	@Override
	public List<FReply> selectFRCList() {
		List<FReply> fRCList = bStore.selectFRCList(session);
		return fRCList;
	}

}
