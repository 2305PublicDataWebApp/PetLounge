package com.lounge.pet.board.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.lounge.pet.board.domain.Board;
import com.lounge.pet.board.domain.FBookmark;
import com.lounge.pet.board.domain.FReply;

public interface BoardStore {

	/**
	 * 자유 게시글 조회
	 * @param session
	 * @return
	 */
	List<Board> selectFreeBoardList(SqlSession session);

	/**
	 * 자유 게시글 전체 개수 조회
	 * @param session
	 * @param fMap
	 * @return
	 */
	int getSearchCount(SqlSession session, Map<String, String> fMap);

	/**
	 * 자유 게시글 상세 조회
	 * @param session
	 * @param fNo
	 * @return
	 */
	Board selectFreeBoardByNo(SqlSession session, int fNo);

	/**
	 * 자유 게시글 조회수 증가
	 * @param session
	 * @param bOne
	 * @return
	 */
	int updateViewCount(SqlSession session, Board bOne);

	/**
	 * 자유 게시글 등록
	 * @param session
	 * @param board
	 * @return
	 */
	int submitFreeBoardForm(SqlSession session, Board board);

	/**
	 * 자유 게시글 상세조회
	 * @param session
	 * @param fNo
	 * @return
	 */
	Board selectOneFreeBoardNo(SqlSession session, int fNo);

	/**
	 * 자유 게시글 수정
	 * @param session
	 * @param board
	 * @return
	 */
	int updateFreeBoardPage(SqlSession session, Board board);

	/**
	 * 자유 게시글 삭제
	 * @param session
	 * @param fNo
	 * @return
	 */
	int freeBoardDelete(SqlSession session, int fNo);

	/**
	 * 자유 게시판 기등록된 총 게시물 수
	 * @param session
	 * @return
	 */
	int getSearchCount(SqlSession session);

	/**
	 * 회원 아이디, 게시글 번호로 북마크 목록 조회
	 * @param session
	 * @param fBook
	 * @return
	 */
	int selectFBook(SqlSession session, FBookmark fBook);

	/**
	 * 북마크 등록
	 * @param session
	 * @param fBook
	 * @return
	 */
	int insertFBook(SqlSession session, FBookmark fBook);

	/**
	 * 북마크 삭제
	 * @param session
	 * @param fBook
	 * @return
	 */
	int deleteFBook(SqlSession session, FBookmark fBook);

	/**
	 * 자유게시판 댓글 목록
	 * @param session
	 * @param fNo
	 * @return
	 */
	List<FReply> selectfReplyList(SqlSession session, int fNo);

	/**
	 * 자유게시판 총 댓글 수
	 * @param session
	 * @param fNo
	 * @return
	 */
	int getfReviewTotalCount(SqlSession session, int fNo);

	/**
	 * 자유게시판 댓글 등록
	 * @param session
	 * @param fReply
	 * @return
	 */
	int insertFreeBoardReply(SqlSession session, FReply fReply);

	/**
	 * 자유게시판 댓글 수정
	 * @param session
	 * @param fReply
	 * @return
	 */
	int updateFreeBoardReply(SqlSession session, FReply fReply);

	/**
	 * 자유게시판 댓글 삭제
	 * @param session
	 * @param fReply
	 * @return
	 */
	int deleteFreeBoardReply(SqlSession session, FReply fReply);

	/**
	 * 자유게시판 댓글에 대한 검색
	 * @param session
	 * @param searchKey
	 * @return
	 */
	List<FReply> selectFreeBoardReplySearch(SqlSession session, FReply searchKey);

	/**
	 * 자유게시판 댓글에 대한 검색 총 개수
	 * @param session
	 * @param searchKey
	 * @return
	 */
	int getFreeBoardReplySearchTotalCount(SqlSession session, FReply searchKey);

	/**
	 * 자유게시판 리스트 검색
	 * @param session
	 * @param searchKey
	 * @return
	 */
	List<Board> selectFreeBoardSearch(SqlSession session, Board searchKey);

	/**
	 * 자유게시판 리스트에 대한 검색 총 개수
	 * @param session
	 * @param searchKey
	 * @return
	 */
	int getFreeBoardSearchTotalCount(SqlSession session, Board searchKey);

	/**
	 * 댓글 개수 조회
	 * @param session
	 * @return
	 */
	List<FReply> selectFRCList(SqlSession session);



}
