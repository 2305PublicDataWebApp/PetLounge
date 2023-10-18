package com.lounge.pet.common.service;
	
import com.lounge.pet.common.domain.Image;

public interface ImageService {

	/**
	 * S3 이미지 등록 Service
	 * @param image
	 * @return
	 */
   int insertImage(Image image);

   /**
    * S3 이미지 번호로 조회 Service
    * @param imageNo
    * @return
    */
   Image selectImageByNo(int imageNo);
}