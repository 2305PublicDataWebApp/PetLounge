package com.lounge.pet.user.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public int userRegister(User user) {
		int result = uStore.userRegister(session, user);
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

}
