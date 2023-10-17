package com.lounge.pet.faq.service;

import java.util.List;

import com.lounge.pet.faq.domain.Faq;

public interface FaqService {

	/**
	 * faq 글 등록
	 * @param faq
	 * @return int
	 */
	int insertFaq(Faq faq);

	/**
	 * faq 목록 조회
	 * @return
	 */
	List<Faq> getFaqList(Integer faqNo);

}
