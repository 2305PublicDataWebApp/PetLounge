package com.lounge.pet.common.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lounge.pet.common.domain.Image;
import com.lounge.pet.common.service.ImageService;
import com.lounge.pet.common.store.ImageStore;

@Service
public class ImageServiceImpl implements ImageService{
   
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private ImageStore iStore;

	@Override
	public int insertImage(Image image) {
		return iStore.insertImage(sqlSession, image);
	}
	
	@Override
	public Image selectImageByNo(int imageNo) {
		return iStore.selectImageByNo(sqlSession, imageNo);
	}

}
