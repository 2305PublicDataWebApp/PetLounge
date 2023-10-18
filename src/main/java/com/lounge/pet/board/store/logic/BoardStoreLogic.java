package com.lounge.pet.board.store.logic;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.lounge.pet.board.domain.Board;
import com.lounge.pet.board.store.BoardStore;

@Repository
public class BoardStoreLogic implements BoardStore {

	@Override
	public List<Board> selectFreeBoardList(SqlSession session) {
		List<Board> bList = session.selectList("BoardMapper.selectFreeBoardList");
		return bList;
	}

	@Override
	public int getSearchCount(SqlSession session, Map<String, String> fMap) {
		int result = session.selectOne("BoardMapper.getSearchCount", fMap);
		return result;
	}

}
