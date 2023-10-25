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

	// faq 글 수정
	@Override
	public int modifyFaq(SqlSession session, Faq faq) {
		int result = session.update("FaqMapper.modifyFaq", faq);
		return result;
	}

	// faq 글 삭제
	@Override
	public int deleteFaq(SqlSession session, Integer faqNo) {
		int result = session.update("FaqMapper.deleteFaq", faqNo);
		return result;
	}

	// faq 목록 갯수 조회
	@Override
	public int getFaqCount(SqlSession session) {
		int faqCount = session.selectOne("FaqMapper.getFaqCount");
		return faqCount;
	}

	// faq 목록 조회
	@Override
	public List<Faq> getFaqList(SqlSession session, Integer faqNo) {
		List<Faq> faqList = session.selectList("FaqMapper.getFaqList", faqNo);
		return faqList;
	}

	// faq 수정페이지 정보 불러오기
	@Override
	public Faq selectOneByNo(SqlSession session, Faq faqNo) {
		Faq faq = session.selectOne("FaqMapper.selectOneByNo", faqNo);
		return faq;
	}

}
