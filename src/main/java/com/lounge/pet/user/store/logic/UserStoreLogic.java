package com.lounge.pet.user.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.lounge.pet.user.domain.User;
import com.lounge.pet.user.store.UserStore;

@Repository
public class UserStoreLogic implements UserStore{

	@Override
	public int userRegister(SqlSession session, User user) {
		int result = session.insert("UserMapper.userRegister", user);
		return result;
	}

}
