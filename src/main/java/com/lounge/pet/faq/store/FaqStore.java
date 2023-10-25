package com.lounge.pet.faq.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lounge.pet.faq.domain.Faq;

public interface FaqStore {

	/**
	 * faq 글 등록
	 * @param session
	 * @param faq
	 * @return int faq 제목, 내용 insert
	 */
	int insertFaq(SqlSession session, Faq faq);

	/**
	 * faq 글 수정
	 * @param session
	 * @param faq
	 * @return int faq 제목, 내용 update
	 */
	int modifyFaq(SqlSession session, Faq faq);

	/**
	 * faq 글 삭제
	 * @param session
	 * @param faqNo
	 * @return int faq 항목 삭제
	 */
	int deleteFaq(SqlSession session, Integer faqNo);

	/**
	 * faq 목록 갯수 조회
	 * @param session
	 * @return int faq 항목 갯수
	 */
	int getFaqCount(SqlSession session);

	/**
	 * faq 목록 조회
	 * @param session
	 * @return List<Faq> faq 목록
	 */
	List<Faq> getFaqList(SqlSession session, Integer faqNo);

	/**
	 * faq 수정페이지 정보 불러오기
	 * @param session
	 * @param faqNo
	 * @return Faq 글 번호에 해당하는 faq 항목
	 */
	Faq selectOneByNo(SqlSession session, Faq faqNo);

}
