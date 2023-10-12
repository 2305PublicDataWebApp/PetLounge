package com.lounge.pet.user.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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

}
