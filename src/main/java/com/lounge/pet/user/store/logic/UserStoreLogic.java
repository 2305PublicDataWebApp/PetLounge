package com.lounge.pet.user.store.logic;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.lounge.pet.board.domain.Board;
import com.lounge.pet.hospital.domain.HBookmark;
import com.lounge.pet.hospital.domain.Hospital;
import com.lounge.pet.support.domain.Support;
import com.lounge.pet.user.domain.UPageInfo;
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



	@Override
	public List<Hospital> selectHos(SqlSession session, String sessionId, UPageInfo aInfo) {
		int limit = aInfo.getRecordCountPerPage();
		int offset = (aInfo.getCurrentPage()-1)*limit;
		
		RowBounds rowbounds = new RowBounds(offset, limit);
		List<Hospital> hList = session.selectList("UserMapper.selectHos", sessionId,  rowbounds);
		return hList;
	}

	@Override
	public int selectListCount(SqlSession session, String sessionId) {
		int result = session.selectOne("UserMapper.selectListCount", sessionId);
		return result;
	}

	@Override
	public int selectListCount(SqlSession session, Map<String, String> paramMap) {
		int result = session.selectOne("UserMapper.selectListByKeywordCount", paramMap);
		return result;
	}

	@Override
	public List<Hospital> searchUserByKeyword(SqlSession session, UPageInfo aInfo, Map<String, String> paramMap) {
		
		int limit = aInfo.getRecordCountPerPage();
		int offset = (aInfo.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Hospital> searchList = session.selectList("UserMapper.searchUserByKeyword", paramMap, rowBounds);
		return searchList;
	}



	



}
