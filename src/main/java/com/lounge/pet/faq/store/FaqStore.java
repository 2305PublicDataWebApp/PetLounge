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
	 * @return
	 */
	List<Faq> getFaqList(SqlSession session, Integer faqNo);

}
