package com.lounge.pet.common.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.lounge.pet.common.service.S3Service;


@RestController
@RequestMapping("/s3")
public class S3Controller {
   
   @Autowired
    private S3Service S3Service;  
    
    @PostMapping("/file.im")
    @ResponseBody                     
    public String uploadFile(@RequestPart MultipartFile multipartFile) {
        System.out.println("file 요청");
        try {
        	
        	// S3서버에 파일 저장 
            String imageName = S3Service.uploadFile(multipartFile); 
            String imageUrl = S3Service.getUrl(imageName);
            
            System.out.println(imageName);
            System.out.println(imageUrl);
            
            	return imageUrl;
            
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
}