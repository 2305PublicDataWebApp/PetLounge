package com.lounge.pet.weather.service;

import java.util.List;

import com.lounge.pet.weather.domain.Weather;

public interface WeatherService {

	/**
	 * tmi 등록
	 * @return
	 */
	int insertTmi(Weather tmi);

	/**
	 * tmi 목록 삭제
	 * @param tmiNo
	 * @return
	 */
	int deleteTmiList(Integer tmiNo);

	/**
	 * tmi 조회
	 * @return
	 */
	List<Weather> selectTmiList();

	/**
	 * tmi 랜덤 출력
	 * @return
	 */
	Weather selectOneByTmi();

}
