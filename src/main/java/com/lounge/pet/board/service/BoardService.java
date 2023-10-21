package com.lounge.pet.board.service;

import java.util.List;
import java.util.Map;

import com.lounge.pet.board.domain.Board;
import com.lounge.pet.board.domain.FBookmark;

public interface BoardService {

	/**
	 * 자유 게시글 조회
	 * @param fMap
	 * @return
	 */
	List<Board> selectFreeBoardList();

	/**
	 * 자유 게시글 전체 개수 조회
	 * @param fMap
	 * @return
	 */
	int getSearchCount(Map<String, String> fMap);

	/**
	 * 자유 게시글 상세 조회
	 * @param fNo
	 * @return
	 */
	Board selectFreeBoardByNo(int fNo);

	/**
	 * 자유 게시글 조회수 증가
	 * @param bOne
	 * @return
	 */
	int updateViewCount(Board bOne);

	/**
	 * 자유 게시글 등록
	 * @param board
	 * @return
	 */
	int submitFreeBoardForm(Board board);

	/**
	 * 자유 게시글 상세조회
	 * @param fNo
	 * @return
	 */
	Board selectOneFreeBoardNo(int fNo);

	/**
	 * 자유 게시글 수정
	 * @param board
	 * @return
	 */
	int updateFreeBoardPage(Board board);

	/**
	 * 자유 게시글 삭제
	 * @param fNo
	 * @return
	 */
	int freeBoardDelete(int fNo);

	/**
	 * 자유게시판 등록된 총 게시물 수 
	 * @return
	 */
	int getSearchCount();

	/**
	 * 회원 아이디, 게시글 번호로 북마크 목록 조회
	 * @param fBook
	 * @return
	 */
	int selectFBook(FBookmark fBook);

	/**
	 * 북마크 등록
	 * @param fBook
	 * @return
	 */
	int insertFBook(FBookmark fBook);

	/**
	 * 북마크 삭제
	 * @param fBook
	 * @return
	 */
	int deleteFBook(FBookmark fBook);




}
