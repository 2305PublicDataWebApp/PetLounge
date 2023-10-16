package com.lounge.pet.user.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lounge.pet.board.domain.Board;
import com.lounge.pet.support.domain.Support;
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

	



}
