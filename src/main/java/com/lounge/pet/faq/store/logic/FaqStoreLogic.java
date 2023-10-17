package com.lounge.pet.faq.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.lounge.pet.faq.domain.Faq;
import com.lounge.pet.faq.store.FaqStore;

@Repository
public class FaqStoreLogic implements FaqStore{

	// faq 글 등록
	@Override
	public int insertFaq(SqlSession session, Faq faq) {
		int result = session.insert("FaqMapper.insertFaq", faq);
		return result;
	}

	// faq 목록 조회
	@Override
	public List<Faq> getFaqList(SqlSession session, Integer faqNo) {
		List<Faq> faqList = session.selectList("FaqMapper.getFaqList", faqNo);
		return faqList;
	}

}
