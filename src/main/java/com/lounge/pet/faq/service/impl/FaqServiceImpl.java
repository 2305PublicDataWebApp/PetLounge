package com.lounge.pet.faq.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lounge.pet.faq.domain.Faq;
import com.lounge.pet.faq.service.FaqService;
import com.lounge.pet.faq.store.FaqStore;

@Service
public class FaqServiceImpl implements FaqService{
	
	@Autowired
	private FaqStore fStore;
	@Autowired
	private SqlSession session;

	// faq 글 등록
	@Override
	public int insertFaq(Faq faq) {
		int result = fStore.insertFaq(session, faq);
		return result;
	}

	// faq 글 수정
	@Override
	public int modifyFaq(Faq faq) {
		int result = fStore.modifyFaq(session, faq);
		return result;
	}

	// faq 글 삭제
	@Override
	public int deleteFaq(Integer faqNo) {
		int result = fStore.deleteFaq(session, faqNo);
		return result;
	}

	// faq 목록 갯수 조회
	@Override
	public int getFaqCount() {
		int faqCount = fStore.getFaqCount(session);
		return faqCount;
	}

	// faq 목록 조회
	@Override
	public List<Faq> getFaqList(Integer faqNo) {
		List<Faq> faqList = fStore.getFaqList(session, faqNo); 
		return faqList;
	}

	// faq 수정페이지 정보 불러오기
	@Override
	public Faq selectOneByNo(Faq faqNo) {
		Faq faq = fStore.selectOneByNo(session, faqNo);
		return faq;
	}

}
