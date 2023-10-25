package com.lounge.pet.weather.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lounge.pet.weather.domain.Weather;
import com.lounge.pet.weather.service.WeatherService;
import com.lounge.pet.weather.store.WeatherStore;

@Service
public class WeatherServiceImpl implements WeatherService{
	
	@Autowired
	private WeatherStore wStore;
	@Autowired
	private SqlSession session;

	// tmi 등록
	@Override
	public int insertTmi(Weather tmi) {
		int result = wStore.insertTmi(session, tmi);
		return result;
	}

	// tmi 목록 삭제
	@Override
	public int deleteTmiList(Integer tmiNo) {
		int result = wStore.deleteTmiList(session, tmiNo);
		return result;
	}

	// tmi 조회
	@Override
	public List<Weather> selectTmiList() {
		List<Weather> tmiList = wStore.selectTmiList(session);
		return tmiList;
	}

	// tmi 랜덤 출력
	@Override
	public Weather selectOneByTmi() {
		Weather tmi = wStore.selectOneByTmi(session);
		return tmi;
	}

}
