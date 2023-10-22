package com.lounge.pet.board.store.logic;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.lounge.pet.board.domain.Board;
import com.lounge.pet.board.domain.FBookmark;
import com.lounge.pet.board.domain.FReply;
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

	@Override
	public Board selectFreeBoardByNo(SqlSession session, int fNo) {
		Board bOne = session.selectOne("BoardMapper.selectFreeBoardByNo", fNo);
		return bOne;
	}

	@Override
	public int updateViewCount(SqlSession session, Board bOne) {
		int result = session.update("BoardMapper.updateViewCount", bOne);
		return result;
	}

	@Override
	public int submitFreeBoardForm(SqlSession session, Board board) {
		int result = session.insert("BoardMapper.submitFreeBoardForm", board);
		return result;
	}

	@Override
	public Board selectOneFreeBoardNo(SqlSession session, int fNo) {
		Board bOne = session.selectOne("BoardMapper.selectOneFreeBoardNo", fNo);
		return bOne;
	}

	@Override
	public int updateFreeBoardPage(SqlSession session, Board board) {
		int result = session.update("BoardMapper.updateFreeBoardPage", board);
		return result;
	}

	@Override
	public int freeBoardDelete(SqlSession session, int fNo) {
		int result = session.update("BoardMapper.freeBoardDelete", fNo);
		return result;
	}

	@Override
	public int getSearchCount(SqlSession session) {
		int result = session.selectOne("BoardMapper.getSearchCount");
		return result;
	}

	@Override
	public int selectFBook(SqlSession session, FBookmark fBook) {
		int fBOne = session.selectOne("BoardMapper.selectFBook", fBook);
		return fBOne;
	}

	@Override
	public int insertFBook(SqlSession session, FBookmark fBook) {
		int result = session.insert("BoardMapper.insertFBook", fBook);
		return result;
	}

	@Override
	public int deleteFBook(SqlSession session, FBookmark fBook) {
		int result = session.delete("BoardMapper.deleteFBook", fBook);
		return result;
	}

	@Override
	public List<FReply> selectfReplyList(SqlSession session, int fNo) {
		List<FReply> fRList = session.selectList("BoardMapper.selectfReplyList", fNo);
		return fRList;
	}

	@Override
	public int getfReviewTotalCount(SqlSession session, int fNo) {
		int count = session.selectOne("BoardMapper.getfReviewTotalCount", fNo);
		return count;
	}

	@Override
	public int insertFreeBoardReply(SqlSession session, FReply fReply) {
		int result = session.insert("BoardMapper.insertFreeBoardReply", fReply);
		return result;
	}

	@Override
	public int updateFreeBoardReply(SqlSession session, FReply fReply) {
		int result = session.update("BoardMapper.updateFreeBoardReply", fReply);
		return result;
	}

	@Override
	public int deleteFreeBoardReply(SqlSession session, FReply fReply) {
		int result = session.update("BoardMapper.deleteFreeBoardReply", fReply);
		return result;
	}



}
