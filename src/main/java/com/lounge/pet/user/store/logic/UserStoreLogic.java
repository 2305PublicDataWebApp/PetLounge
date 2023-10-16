package com.lounge.pet.user.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.lounge.pet.board.domain.Board;
import com.lounge.pet.support.domain.Support;
import com.lounge.pet.user.domain.User;

import com.lounge.pet.user.store.UserStore;

@Repository
public class UserStoreLogic implements UserStore{

	@Override
	public int insertUser(SqlSession session, User user) {
		int result = session.insert("UserMapper.insertUser", user);
		return result;
	}

	@Override
	public User userLogin(SqlSession session, User user) {
		User uOne = session.selectOne("UserMapper.userLogin", user);
		return uOne;
	}

	@Override
	public User selectOneById(SqlSession session, String uId) {
		User user = session.selectOne("UserMapper.selectOneById", uId);
		return user;
	}

	@Override
	public int updateUser(SqlSession session, User user) {
		int result  = session.update("UserMapper.updateUser", user);
		return result;
	}

	@Override
	public int deleteUser(SqlSession session, String sessionId) {
		int result = session.update("UserMapper.deleteUser", sessionId);
		return result;
	}

	@Override
	public User userCheckId(SqlSession session, String uId) {
		User uOne = session.selectOne("UserMapper.userCheckId", uId);
		return uOne;
	}

	@Override
	public User userCheckNick(SqlSession session, String uNickName) {
		User uOne = session.selectOne("UserMapper.userCheckNick", uNickName);
		return uOne;
	}

	



}
