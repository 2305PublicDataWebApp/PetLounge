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

	/**
	 * faq 목록 갯수
	 * @return int
	 */
	int getFaqCount();

	/**
	 * faq 글 삭제
	 * @param faqNo
	 * @return
	 */
	int deleteFaq(Integer faqNo);

	/**
	 * faq 수정페이지 목록 불러오기
	 * @param faqNo
	 * @return
	 */
	Faq selectOneByNo(Faq faqNo);

	/**
	 * faq 글 수정
	 * @param faq
	 * @return
	 */
	int modifyFaq(Faq faq);

}
