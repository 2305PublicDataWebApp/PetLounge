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

}
