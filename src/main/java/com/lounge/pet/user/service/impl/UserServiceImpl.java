package com.lounge.pet.user.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lounge.pet.board.domain.Board;
import com.lounge.pet.hospital.domain.HBookmark;
import com.lounge.pet.hospital.domain.Hospital;
import com.lounge.pet.support.domain.Support;
import com.lounge.pet.user.domain.UPageInfo;
import com.lounge.pet.user.domain.User;

import com.lounge.pet.user.service.UserService;
import com.lounge.pet.user.store.UserStore;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserStore uStore;
	
	@Autowired
	private SqlSession session;

	@Override
	public int insertUser(User user) {
		int result = uStore.insertUser(session, user);
		return result;
	}

	@Override
	public User userLogin(User user) {
		User uOne = uStore.userLogin(session, user);
		return uOne;
	}

	@Override
	public User selectOneById(String uId) {
		User user = uStore.selectOneById(session, uId);
		return user;
	}

	@Override
	public int UpdateUser(User user) {
		int result = uStore.updateUser(session, user);
		return result;
	}

	@Override
	public int deleteUser(String sessionId) {
		int result = uStore.deleteUser(session, sessionId);
		return result;
	}

	@Override
	public User userCheckId(String uId) {
		User uOne = uStore.userCheckId(session, uId);
		return uOne;
	}

	@Override
	public User userCheckNick(String uNickName) {
		User uOne = uStore.userCheckNick(session, uNickName);
		return uOne;
	}



	@Override
	public List<Hospital> selectHos(String sessionId, UPageInfo aInfo) {
		List<Hospital> hList = uStore.selectHos(session, sessionId, aInfo);
		return hList;
	}

	@Override
	public Integer getListCount(String sessionId) {
		int result = uStore.selectListCount(session, sessionId);
		return result;
	}

	@Override
	public int getListCount(Map<String, String> paramMap) {
		int result = uStore.selectListCount(session, paramMap);
		return result;
	}

	@Override
	public List<Hospital> searchUserByKeyword(UPageInfo aInfo, Map<String, String> paramMap) {
		List<Hospital> hList = uStore.searchUserByKeyword(session, aInfo, paramMap);
		return hList;
	}

	

	



}
