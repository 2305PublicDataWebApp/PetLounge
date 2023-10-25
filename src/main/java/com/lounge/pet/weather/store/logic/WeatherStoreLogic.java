package com.lounge.pet.weather.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.lounge.pet.weather.domain.Weather;
import com.lounge.pet.weather.store.WeatherStore;

@Repository
public class WeatherStoreLogic implements WeatherStore{

	// tmi 등록
	@Override
	public int insertTmi(SqlSession session, Weather tmi) {
		int result = session.insert("WeatherMapper.insertTmi", tmi);
		return result;
	}

	// tmi 목록 삭제
	@Override
	public int deleteTmiList(SqlSession session, Integer tmiNo) {
		int result = session.update("WeatherMapper.deleteTmiList", tmiNo);
		return result;
	}

	// tmi 조회
	@Override
	public List<Weather> selectTmiList(SqlSession session) {
		List<Weather> tmiList = session.selectList("WeatherMapper.selectTmiList");
		return tmiList;
	}

	// tmi 랜덤 출력
	@Override
	public Weather selectOneByTmi(SqlSession session) {
		Weather tmi = session.selectOne("WeatherMapper.selectOneByTmi");
		return tmi;
	}


}
