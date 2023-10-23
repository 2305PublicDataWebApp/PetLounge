package com.lounge.pet.hospital.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lounge.pet.hospital.domain.HBookmark;
import com.lounge.pet.hospital.domain.HReview;
import com.lounge.pet.hospital.domain.Hospital;
import com.lounge.pet.hospital.service.HospitalService;
import com.lounge.pet.hospital.store.HospitalStore;

@Service
public class HospitalServiceImpl implements HospitalService {

	@Autowired
	private SqlSession session;
	@Autowired
	private HospitalStore hStore;
	
	@Override
	public int insertHosReview(HReview hReview) {
		int result = hStore.insertHosReview(session, hReview);
		return result;
	}

	@Override
	public int insertHBook(HBookmark userBook) {
		int result = hStore.insertHBook(session, userBook);
		return result;
	}

	@Override
	public int updateHosReview(HReview hReview) {
		int result = hStore.updateHosReview(session, hReview);
		return result;
	}

	@Override
	public int updateXYtoLatLng(Hospital hosLocation) {
		int result = hStore.updateXYtoLatLng(session, hosLocation);
		return result;
	}

	@Override
	public int deleteHBook(HBookmark userBook) {
		int result = hStore.deleteHBook(session, userBook);
		return result;
	}

	@Override
	public int deleteHosReview(HReview hReview) {
		int result = hStore.deleteHosReview(session, hReview);
		return result;
	}

	@Override
	public Hospital selectOneByhNo(int hNo) {
		Hospital hOne = hStore.selectOneByhNo(session, hNo);
		return hOne;
	}

	@Override
	public int selectHBook(HBookmark userBook) {
		int hBOne = hStore.selectHBook(session, userBook);
		return hBOne;
	}

	@Override
	public List<HReview> selectHReviewList(int hNo) {
		List<HReview> hRList = hStore.selectHReviewList(session, hNo);
		return hRList;
	}

	@Override
	public List<Hospital> selectFiveHos(Hospital userLocation) {
		List<Hospital> hList = hStore.selectFiveHos(session, userLocation);
		return hList;
	}

	@Override
	public List<Hospital> selectHosListByKeyword(Hospital userSearchLocation) {
		List<Hospital> hList = hStore.selectHosListByKeyword(session, userSearchLocation);
		return hList;
	}

	@Override
	public List<Hospital> selectAllList() {
		List<Hospital> hList = hStore.selectAllList(session);
		return hList;
	}

	@Override
	public int getHReviewTotalCount(int hNo) {
		int count = hStore.getHReviewTotalCount(session, hNo);
		return count;
	}

	@Override
	public int getHSearchTotalCount(String hSearchKeyword) {
		int count = hStore.getHSearchTotalCount(session, hSearchKeyword);
		return count;
	}

	@Override
	public List<HReview> selectHReviewSearch(HReview searchKey) {
		List<HReview> hRList = hStore.selectHReviewSearch(session, searchKey);
		return hRList;
	}

	@Override
	public int getHReviewSearchTotalCount(HReview searchKey) {
		int count = hStore.getHReviewSearchTotalCount(session, searchKey);
		return count;
	}

}
