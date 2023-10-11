package com.lounge.pet.hospital.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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
	public int updateXYtoLatLng(SqlSession session, Hospital hosLocation) {
		int result = session.update("HosMapper.updateXYtoLatLng", hosLocation);
		return result;
	}

	@Override
	public Hospital selectOneByhNo(SqlSession session, int hNo) {
		Hospital hOne = session.selectOne("HosMapper.selectOneByhNo", hNo);
		return hOne;
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

}
