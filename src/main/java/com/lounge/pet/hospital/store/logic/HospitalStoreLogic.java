package com.lounge.pet.hospital.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.lounge.pet.hospital.domain.HBookmark;
import com.lounge.pet.hospital.domain.HReview;
import com.lounge.pet.hospital.domain.Hospital;
import com.lounge.pet.hospital.store.HospitalStore;

@Repository
public class HospitalStoreLogic implements HospitalStore {

	@Override
	public int insertHosReview(SqlSession session, HReview hReview) {
		int result = session.insert("HosMapper.insertHosReview", hReview);
		return result;
	}

	@Override
	public int insertHBook(SqlSession session, HBookmark userBook) {
		int result = session.insert("HosMapper.insertHBook", userBook);
		return result;
	}

	@Override
	public int updateHosReview(SqlSession session, HReview hReview) {
		int result = session.update("HosMapper.updateHosReview", hReview);
		return result;
	}

	@Override
	public int updateXYtoLatLng(SqlSession session, Hospital hosLocation) {
		int result = session.update("HosMapper.updateXYtoLatLng", hosLocation);
		return result;
	}

	@Override
	public int deleteHBook(SqlSession session, HBookmark userBook) {
		int result = session.delete("HosMapper.deleteHBook", userBook);
		return result;
	}

	@Override
	public int deleteHosReview(SqlSession session, HReview hReview) {
		int result = session.update("HosMapper.deleteHosReview", hReview);
		return result;
	}

	@Override
	public Hospital selectOneByhNo(SqlSession session, int hNo) {
		Hospital hOne = session.selectOne("HosMapper.selectOneByhNo", hNo);
		return hOne;
	}

	@Override
	public int selectHBook(SqlSession session, HBookmark userBook) {
		int hBOne = session.selectOne("HosMapper.selectHBook", userBook);
		return hBOne;
	}

	@Override
	public List<HReview> selectHReviewList(SqlSession session, int hNo) {
		List<HReview> hRList = session.selectList("HosMapper.selectHReviewList", hNo);
		return hRList;
	}

	@Override
	public List<Hospital> selectFiveHos(SqlSession session, Hospital userLocation) {
		List<Hospital> hList = session.selectList("HosMapper.selectFiveHos", userLocation);
		return hList;
	}

	@Override
	public List<Hospital> selectFiveByKeyword(SqlSession session, Hospital userSearchLocation) {
		List<Hospital> hList = session.selectList("HosMapper.selectFiveByKeyword", userSearchLocation);
		return hList;
	}

	@Override
	public List<Hospital> selectAllList(SqlSession session) {
		List<Hospital> hList = session.selectList("HosMapper.selectAllList");
		return hList;
	}

	@Override
	public int getHReviewTotalCount(SqlSession session, int hNo) {
		int count = session.selectOne("HosMapper.getHReviewTotalCount", hNo);
		return count;
	}

}
