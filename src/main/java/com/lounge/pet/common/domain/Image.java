package com.lounge.pet.common.domain;

public class Image {
   private int imageNo;
   private String imageUrl;
   private String imageName;
   
   public Image() {}

   public Image(int imageNo, String imageUrl, String imageName) {
      super();
      this.imageNo = imageNo;
      this.imageUrl = imageUrl;
      this.imageName = imageName;
   }

   public Image(String imageUrl, String imageName) {
      super();
      this.imageUrl = imageUrl;
      this.imageName = imageName;
   }

   public int getImageNo() {
      return imageNo;
   }

   public void setImageNo(int imageNo) {
      this.imageNo = imageNo;
   }

   public String getImageUrl() {
      return imageUrl;
   }

   public void setImageUrl(String imageUrl) {
      this.imageUrl = imageUrl;
   }

   public String getImageName() {
      return imageName;
   }

   public void setImageName(String imageName) {
      this.imageName = imageName;
   }

   @Override
   public String toString() {
      return "이미지 [이미지번호=" + imageNo + ", 이미지경로=" + imageUrl + ", 이미지이름=" + imageName + "]";
   }
   
   
}
