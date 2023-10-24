package com.lounge.pet.weather.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lounge.pet.weather.domain.Weather;

public interface WeatherStore {

	/**
	 * tmi 등록
	 * @param session
	 * @return
	 */
	int insertTmi(SqlSession session, Weather tmi);

	/**
	 * tmi 조회
	 * @return
	 */
	List<Weather> selectTmiList(SqlSession session);


}
