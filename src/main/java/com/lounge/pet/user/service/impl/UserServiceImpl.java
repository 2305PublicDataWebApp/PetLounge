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
import com.lounge.pet.support.domain.SupportReply;
import com.lounge.pet.user.domain.UPageInfo;
import com.lounge.pet.user.domain.User;
import com.lounge.pet.user.domain.UserHosRe;
import com.lounge.pet.user.domain.UserSupport;
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
	public Integer getHosListCount(String sessionId) {
		int result = uStore.selectHosListCount(session, sessionId);
		return result;
	}

	@Override
	public int getHosSearchListCount(Map<String, String> paramMap) {
		int result = uStore.selectHosSearchListCount(session, paramMap);
		return result;
	}

	@Override
	public List<Hospital> searchHosByKeyword(UPageInfo aInfo, Map<String, String> paramMap) {
		List<Hospital> hList = uStore.searchHosByKeyword(session, aInfo, paramMap);
		return hList;
	}

	@Override
	public List<Board> selectBoard(String sessionId, UPageInfo aInfo) {
		List<Board> bList = uStore.selectBoard(session, sessionId, aInfo);
		return bList;
	}

	@Override
	public Integer getBoardListCount(String sessionId) {
		int result = uStore.selectBoardListCount(session, sessionId);
		return result;
	}

	@Override
	public List<Board> searchBoardByKeyword(UPageInfo aInfo, Map<String, String> paramMap) {
		List<Board> bList = uStore.searchBoardByKeyword(session, aInfo, paramMap);
		return bList;
	}

	@Override
	public int getBoardSearchListCount(Map<String, String> paramMap) {
		int result = uStore.selectBoardSearchListCount(session, paramMap);
		return result;
	}

	@Override
	public Integer getHosReListCount(String sessionId) {
		int result = uStore.selectHosReListCount(session, sessionId);
		return result;
	}

	@Override
	public List<Hospital> selectHosRe(String sessionId, UPageInfo aInfo) {
		List<Hospital> hList = uStore.selectHosRe(session, sessionId, aInfo);
		return hList;
	}

	@Override
	public int getHosReviewSearchListCount(Map<String, String> paramMap) {
		int result = uStore.selectHosReSearchListCount(session, paramMap);
		return result;
	}

	@Override
	public List<UserHosRe> searchHosReviewByKeyword(UPageInfo aInfo, Map<String, String> paramMap) {
		List<UserHosRe> hRList = uStore.searchHosReviewByKeyword(session, aInfo, paramMap);
		return hRList;
	}

	@Override
	public Integer getSupportListCount(String sessionId) {
		int result = uStore.selectSupportListCount(session, sessionId);
		return result;
	}

	@Override
	public List<SupportReply> selectSupport(String sessionId, UPageInfo aInfo) {
		List<SupportReply> sList = uStore.selectSupport(session, sessionId, aInfo);
		return sList;
	}

	@Override
	public int getSupportSearchListCount(Map<String, String> paramMap) {
		int result = uStore.selectSupportSearchListCount(session, paramMap);
		return result;
	}

	@Override
	public List<UserSupport> searchSupportByKeyword(UPageInfo aInfo, Map<String, String> paramMap) {
		List<UserSupport> sList = uStore.searchSupportByKeyword(session, aInfo, paramMap);
		return sList;
	}

	@Override
	public Integer getSupportReplyListCount(String sessionId) {
		int result = uStore.selectSupportReplyListCount(session, sessionId);
		return result;
	}

	@Override
	public List<UserSupport> selectSupportReply(String sessionId, UPageInfo aInfo) {
		List<UserSupport> sList = uStore.selectSupportReply(session, sessionId, aInfo);
		return sList;
	}

	@Override
	public int getSupportReplySearchlistCount(Map<String, String> paramMap) {
		int result = uStore.selectSupportReplySearchlistCount(session, paramMap);
		return result;
	}

	@Override
	public List<UserSupport> searchSupportReplyByKeyword(UPageInfo aInfo, Map<String, String> paramMap) {
		List<UserSupport> sList = uStore.searchSupportReplyByKeyword(session, aInfo, paramMap);
		return sList;
	}

	@Override
	public User userCheckEmail(String uEmail) {
		User uOne = uStore.userCheckEmail(session, uEmail);
		return uOne;
	}



	@Override
	public User selectFindId(User user) {
		User uOne = uStore.selectFindId(session,user);
		return uOne;
	}

	@Override
	public User selectFindPw(User user) {
		User uOne = uStore.selectFindPw(session,user);
		return uOne;
	}





	

	



}
