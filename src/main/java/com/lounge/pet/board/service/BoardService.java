package com.lounge.pet.board.service;

import java.util.List;
import java.util.Map;

import com.lounge.pet.board.domain.Board;

public interface BoardService {

	/**
	 * 게시글 조회
	 * @param fMap
	 * @return
	 */
	List<Board> selectFreeBoardList();

	/**
	 * 게시글 전체 개수 조회
	 * @param fMap
	 * @return
	 */
	int getSearchCount(Map<String, String> fMap);

}
