package com.lounge.pet.board.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lounge.pet.board.domain.Board;
import com.lounge.pet.board.service.BoardService;
import com.lounge.pet.board.store.BoardStore;


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

}
