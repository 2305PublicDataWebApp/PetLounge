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
	public Hospital selectOneByhNo(int hNo) {
		Hospital hOne = hStore.selectOneByhNo(session, hNo);
		return hOne;
	}

	@Override
	public HBookmark selectHBook(HBookmark userBook) {
		HBookmark hBOne = hStore.selectHBook(session, userBook);
		return hBOne;
	}

	@Override
	public List<Hospital> selectFiveHos(Hospital userLocation) {
		List<Hospital> hList = hStore.selectFiveHos(session, userLocation);
		return hList;
	}

	@Override
	public List<Hospital> selectFiveByKeyword(Hospital userSearchLocation) {
		List<Hospital> hList = hStore.selectFiveByKeyword(session, userSearchLocation);
		return hList;
	}

	@Override
	public List<Hospital> selectAllList() {
		List<Hospital> hList = hStore.selectAllList(session);
		return hList;
	}

}
