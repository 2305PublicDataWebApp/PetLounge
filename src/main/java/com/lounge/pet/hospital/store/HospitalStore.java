package com.lounge.pet.hospital.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lounge.pet.hospital.domain.Hospital;

public interface HospitalStore {

	/**
	 * EPSG:2097 좌표를 위경도 좌표로 변환 Store
	 * @param session
	 * @param hosLocation
	 * @return
	 */
	int updateXYtoLatLng(SqlSession session, Hospital hosLocation);

	/**
	 * 번호로 동물병원 조회 Store
	 * @param session
	 * @param hNo
	 * @return
	 */
	Hospital selectOneByhNo(SqlSession session, int hNo);

	/**
	 * 기본 주소 기준으로 동물병원 5개 불러오기 Store
	 * @param session
	 * @param userLocation
	 * @return
	 */
	List<Hospital> selectFiveHos(SqlSession session, Hospital userLocation);

	/**
	 * 검색어로 동물병원 5개 불러오기 Store
	 * @param session
	 * @param userSearchLocation
	 * @return
	 */
	List<Hospital> selectFiveByKeyword(SqlSession session, Hospital userSearchLocation);

	/**
	 * 동물병원 전체 리스트 Store
	 * @param session
	 * @return
	 */
	List<Hospital> selectAllList(SqlSession session);

}
