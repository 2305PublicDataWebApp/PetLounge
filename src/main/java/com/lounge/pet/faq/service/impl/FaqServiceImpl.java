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

	// faq 목록 조회
	@Override
	public List<Faq> getFaqList(Integer faqNo) {
		List<Faq> faqList = fStore.getFaqList(session, faqNo); 
		return faqList;
	}

}
