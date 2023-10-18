package com.lounge.pet.common.store;

import org.apache.ibatis.session.SqlSession;

import com.lounge.pet.common.domain.Image;

public interface ImageStore {

	/**
	 * S3 이미지 등록 Service
	 * @param image
	 * @return
	 */
	int insertImage(SqlSession sqlSession, Image image);

	/**
    * S3 이미지 번호로 조회 Service
    * @param imageNo
    * @return
    */
	Image selectImageByNo(SqlSession sqlSession, int imageNo);

}
