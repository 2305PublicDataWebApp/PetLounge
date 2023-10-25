package com.lounge.pet.faq.service;

import java.util.List;

import com.lounge.pet.faq.domain.Faq;

public interface FaqService {

	/**
	 * faq 글 등록
	 * @param faq
	 * @return int faq 제목, 내용 insert
	 */
	int insertFaq(Faq faq);

	/**
	 * faq 글 수정
	 * @param faq
	 * @return int faq 제목, 내용 update
	 */
	int modifyFaq(Faq faq);

	/**
	 * faq 글 삭제
	 * @param faqNo
	 * @return int faq 항목 삭제
	 */
	int deleteFaq(Integer faqNo);

	/**
	 * faq 목록 갯수
	 * @return int faq 항목 갯수
	 */
	int getFaqCount();

	/**
	 * faq 목록 조회
	 * @return List<Faq> faq 목록
	 */
	List<Faq> getFaqList(Integer faqNo);

	/**
	 * faq 수정페이지 목록 불러오기
	 * @param faqNo
	 * @return Faq 글 번호에 해당하는 faq 항목
	 */
	Faq selectOneByNo(Faq faqNo);

}
