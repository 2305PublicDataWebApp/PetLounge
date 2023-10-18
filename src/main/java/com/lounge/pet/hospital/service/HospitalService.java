package com.lounge.pet.hospital.service;

import java.util.List;

import com.lounge.pet.hospital.domain.HBookmark;
import com.lounge.pet.hospital.domain.HReview;
import com.lounge.pet.hospital.domain.Hospital;

public interface HospitalService {

	/**
	 * 동물병원 후기 등록 Service
	 * @param hReview
	 * @return
	 */
	int insertHosReview(HReview hReview);

	/**
	 * 즐겨찾기 등록 Service
	 * @param userBook
	 * @return
	 */
	int insertHBook(HBookmark userBook);

	/**
	 * 동물병원 후기 수정 Service
	 * @param hReview
	 * @return
	 */
	int updateHosReview(HReview hReview);

	/**
	 * EPSG:2097 좌표를 위경도 좌표로 변환 Service
	 * @param hosLocation
	 * @return
	 */
	int updateXYtoLatLng(Hospital hosLocation);

	/**
	 * 즐겨찾기 제거 Service
	 * @param userBook
	 * @return
	 */
	int deleteHBook(HBookmark userBook);

	/**
	 * 동물병원 후기 삭제 Service
	 * @param hReview
	 * @return
	 */
	int deleteHosReview(HReview hReview);

	/**
	 * 번호로 동물병원 조회 Service
	 * @param hNo
	 * @return
	 */
	Hospital selectOneByhNo(int hNo);

	/**
	 * 회원 아이디, 동물병원 번호로 즐겨찾기 목록 조회 Service
	 * @param userBook
	 * @return
	 */
	int selectHBook(HBookmark userBook);

	/**
	 * 동물병원 후기 리스트 Service
	 * @param hNo
	 * @return
	 */
	List<HReview> selectHReviewList(int hNo);

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

	/**
	 * 특정 동물병원에 대한 후기 총 개수 Service 
	 * @param hNo
	 * @return
	 */
	int getHReviewTotalCount(int hNo);

	/**
	 * 동물병원 검색결과 총 개수 Service
	 * @param hSearchKeyword
	 * @return
	 */
	int getHSearchTotalCount(String hSearchKeyword);

}
