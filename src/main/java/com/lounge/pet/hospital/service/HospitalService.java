package com.lounge.pet.hospital.service;

import java.util.List;

import com.lounge.pet.hospital.domain.HReview;
import com.lounge.pet.hospital.domain.Hospital;

public interface HospitalService {

	/**
	 * 동물병원 리뷰 등록 Service
	 * @param hReview
	 * @return
	 */
	int insertHosReview(HReview hReview);

	/**
	 * EPSG:2097 좌표를 위경도 좌표로 변환 Service
	 * @param hosLocation
	 * @return
	 */
	int updateXYtoLatLng(Hospital hosLocation);

	/**
	 * 번호로 동물병원 조회 Service
	 * @param hNo
	 * @return
	 */
	Hospital selectOneByhNo(int hNo);

	/**
	 * 기본 주소 기준으로 동물병원 5개 불러오기 Service
	 * @param userLocation
	 * @return
	 */
	List<Hospital> selectFiveHos(Hospital userLocation);

	/**
	 * 검색어로 동물병원 5개 불러오기 Service
	 * @param userSearchLocation
	 * @return
	 */
	List<Hospital> selectFiveByKeyword(Hospital userSearchLocation);

	/**
	 * 동물병원 전체 리스트 Service
	 * @return
	 */
	List<Hospital> selectAllList();

}
