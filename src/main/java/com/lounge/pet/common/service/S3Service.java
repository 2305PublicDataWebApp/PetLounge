package com.lounge.pet.common.service;


import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.server.ResponseStatusException;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.DeleteObjectRequest;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;

@Service
public class S3Service {
    @Value("${cloud.aws.s3.bucket}")
    private String bucket;
    
    @Autowired
    private AmazonS3 amazonS3;

    public String uploadFile(MultipartFile multipartFile) {
       
    	// 원래 파일 이름 
        String fileName = createFileName(multipartFile.getOriginalFilename());
        
        ObjectMetadata objectMetadata = new ObjectMetadata();
        // ObjectMetadata 객체에 파일의 사이즈 ContentLength로 알려주기 
        objectMetadata.setContentLength(multipartFile.getSize());     
        objectMetadata.setContentType(multipartFile.getContentType());  
        
        System.out.println("getContentType : " + multipartFile.getContentType()); 
        
        try(InputStream inputStream = multipartFile.getInputStream()) {
           // amazonS3 api의 메소드 putObject를 이용해 S3에 파일 업로드 
            amazonS3.putObject(new PutObjectRequest(bucket, fileName, inputStream, objectMetadata)
                    .withCannedAcl(CannedAccessControlList.PublicRead)); 
        } catch (IOException e) {
            
        }
        return fileName;
    }

    public void deleteFile(String fileName) {
        amazonS3.deleteObject(new DeleteObjectRequest(bucket, fileName));
    }

    private String createFileName(String fileName) { 
    	// UUID는 자바에 내장되어있는 네트워크상에서 고유성을 보장하는 ID를 만들기 위한 표준 규약
    	// UUID.randomUUID() 파일 이름 랜덤으로 만들고 concat으로 파일의 확장자를 붙임
        return UUID.randomUUID().toString().concat(getFileExtension(fileName));
    }
    
    private String getFileExtension(String fileName) {
         try {
             return fileName.substring(fileName.lastIndexOf("."));
         } catch (StringIndexOutOfBoundsException e) {
             throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "잘못된 형식의 파일("+fileName+") 입니다.");
         }
     }

    public String getUrl(String fileName) {
    	// amazonS3 api의 메소드 getUrl를 이용해 버킷에 저장된 파일의 url 경로를 반환
        return amazonS3.getUrl(bucket, fileName).toString();
    }
}
