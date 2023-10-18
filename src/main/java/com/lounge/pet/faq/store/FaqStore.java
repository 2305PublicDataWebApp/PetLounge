package com.lounge.pet.faq.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lounge.pet.faq.domain.Faq;

public interface FaqStore {

	/**
	 * faq 글 등록
	 * @param session
	 * @param faq
	 * @return int
	 */
	int insertFaq(SqlSession session, Faq faq);

	/**
	 * faq 목록 조회
	 * @param session
	 * @return List<Faq>
	 */
	List<Faq> getFaqList(SqlSession session, Integer faqNo);

	/**
	 * faq 목록 갯수 조회
	 * @param session
	 * @return int
	 */
	int getFaqCount(SqlSession session);

	/**
	 * faq 글 삭제
	 * @param session
	 * @param faqNo
	 * @return int
	 */
	int deleteFaq(SqlSession session, Integer faqNo);

	/**
	 * faq 수정페이지 정보 불러오기
	 * @param session
	 * @param faqNo
	 * @return Faq
	 */
	Faq selectOneByNo(SqlSession session, Faq faqNo);

	/**
	 * faq 글 수정
	 * @param session
	 * @param faq
	 * @return int
	 */
	int modifyFaq(SqlSession session, Faq faq);

}
