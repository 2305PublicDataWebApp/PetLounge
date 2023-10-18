package com.lounge.pet.common.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.lounge.pet.common.domain.Image;
import com.lounge.pet.common.store.ImageStore;

@Repository
public class ImageStoreLogic implements ImageStore{

	@Override
	public int insertImage(SqlSession sqlSession, Image image) {
		int result = sqlSession.insert("ImageMapper.insertImage", image);
		return result;
	}

	@Override
	public Image selectImageByNo(SqlSession sqlSession, int imageNo) {
		Image image = sqlSession.selectOne("ImageMapper.selectImageByNo", imageNo);
		return image;
	}
	
}
