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
import com.lounge.pet.support.domain.SupportReply;
import com.lounge.pet.user.domain.UPageInfo;
import com.lounge.pet.user.domain.User;
import com.lounge.pet.user.domain.UserHosRe;
import com.lounge.pet.user.domain.UserSupport;
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
	public List<Hospital> searchHosByKeyword(SqlSession session, UPageInfo aInfo, Map<String, String> paramMap) {
		
		int limit = aInfo.getRecordCountPerPage();
		int offset = (aInfo.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Hospital> searchList = session.selectList("UserMapper.searchHosByKeyword", paramMap, rowBounds);
		return searchList;
	}

	@Override
	public List<Board> selectBoard(SqlSession session, String sessionId, UPageInfo aInfo) {
		int limit = aInfo.getRecordCountPerPage();
		int offset = (aInfo.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<Board> bList = session.selectList("UserMapper.selectBoard", sessionId, rowBounds);
		return bList;
	}

	@Override
	public int selectBoardListCount(SqlSession session, String sessionId) {
		int result = session.selectOne("UserMapper.selectBoardListCount", sessionId);
		return result;
	}

	@Override
	public List<Board> searchBoardByKeyword(SqlSession session, UPageInfo aInfo, Map<String, String> paramMap) {
		int limit = aInfo.getRecordCountPerPage();
		int offset = (aInfo.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Board> searchList = session.selectList("UserMapper.searchBoardByKeyword", paramMap, rowBounds);
		return searchList;
	}

	@Override
	public int selectBoardSearchListCount(SqlSession session, Map<String, String> paramMap) {
		int result = session.selectOne("UserMapper.selectBoardSearchListCount", paramMap);
		return result;
	}

	@Override
	public int selectHosReListCount(SqlSession session, String sessionId) {
		int result = session.selectOne("UserMapper.selectHosReListCount", sessionId);
		return result;
	}

	@Override
	public List<Hospital> selectHosRe(SqlSession session, String sessionId, UPageInfo aInfo) {
		int limit = aInfo.getRecordCountPerPage();
		int offset = (aInfo.getCurrentPage()-1)*limit;
		
		RowBounds rowbounds = new RowBounds(offset, limit);
		List<Hospital> hList = session.selectList("UserMapper.selectHosRe", sessionId,  rowbounds);
		return hList;
	}

	@Override
	public int selectHosReSearchListCount(SqlSession session, Map<String, String> paramMap) {
		int result = session.selectOne("UserMapper.selectHosReSearchListCount", paramMap);
		return result;
	}

	@Override
	public List<UserHosRe> searchHosReviewByKeyword(SqlSession session, UPageInfo aInfo, Map<String, String> paramMap) {
		int limit = aInfo.getRecordCountPerPage();
		int offset = (aInfo.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<UserHosRe> searchList = session.selectList("UserMapper.searchHosReviewByKeyword", paramMap, rowBounds);
		return searchList;
	}

	@Override
	public int selectSupportListCount(SqlSession session, String sessionId) {
		int result = session.selectOne("UserMapper.selectSupportListCount", sessionId);
		return result;
	}

	@Override
	public List<SupportReply> selectSupport(SqlSession session, String sessionId, UPageInfo aInfo) {
		int limit = aInfo.getRecordCountPerPage();
		int offset = (aInfo.getCurrentPage()-1)*limit;
		
		RowBounds rowbounds = new RowBounds(offset, limit);
		List<SupportReply> sList = session.selectList("UserMapper.selectSupport", sessionId,  rowbounds);
		return sList;
	}

	@Override
	public int selectSupportSearchListCount(SqlSession session, Map<String, String> paramMap) {
		int result = session.selectOne("UserMapper.selectSupportSearchListCount", paramMap);
		return result;
	}

	@Override
	public List<UserSupport> searchSupportByKeyword(SqlSession session, UPageInfo aInfo, Map<String, String> paramMap) {
		int limit = aInfo.getRecordCountPerPage();
		int offset = (aInfo.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<UserSupport> searchList = session.selectList("UserMapper.searchSupportByKeyword", paramMap, rowBounds);
		return searchList;
	}

	@Override
	public int selectSupportReplyListCount(SqlSession session, String sessionId) {
		int result = session.selectOne("UserMapper.selectSupportReplyListCount", sessionId);
		return result;
	}

	@Override
	public List<UserSupport> selectSupportReply(SqlSession session, String sessionId, UPageInfo aInfo) {
		int limit = aInfo.getRecordCountPerPage();
		int offset = (aInfo.getCurrentPage()-1)*limit;
		
		RowBounds rowbounds = new RowBounds(offset, limit);
		List<UserSupport> sList = session.selectList("UserMapper.selectSupportReply", sessionId,  rowbounds);
		return sList;
	}

	@Override
	public int selectSupportReplySearchlistCount(SqlSession session, Map<String, String> paramMap) {
		int result = session.selectOne("UserMapper.selectSupportReplySearchlistCount", paramMap);
		return result;
	}

	@Override
	public List<UserSupport> searchSupportReplyByKeyword(SqlSession session, UPageInfo aInfo,
			Map<String, String> paramMap) {
		int limit = aInfo.getRecordCountPerPage();
		int offset = (aInfo.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<UserSupport> searchList = session.selectList("UserMapper.searchSupportReplyByKeyword", paramMap, rowBounds);
		return searchList;
	}

	@Override
	public User userCheckEmail(SqlSession session, String uEmail) {
		User uOne = session.selectOne("UserMapper.userCheckEmail", uEmail);
		return uOne;
	}



	



}
