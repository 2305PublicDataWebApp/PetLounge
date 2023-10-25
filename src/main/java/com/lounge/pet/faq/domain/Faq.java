package com.lounge.pet.faq.domain;

import java.sql.Date;

public class Faq {

	// 필드
	private int faqNo;
	private String faqTitle;
	private String faqContent;
	private Date faqCreate;
	private Date faqUpdate;
	private String faqStatus;
	
	// 기본 생성자
	public Faq() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	// 매개변수 생성자
	public Faq(int faqNo, String faqTitle, String faqContent, Date faqCreate, Date faqUpdate, String faqStatus) {
		super();
		this.faqNo = faqNo;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
		this.faqCreate = faqCreate;
		this.faqUpdate = faqUpdate;
		this.faqStatus = faqStatus;
	}
	
	
	// getter, setter 메소드
	public Faq(String faqTitle, String faqContent) {
		super();
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
	}

	public int getFaqNo() {
		return faqNo;
	}
	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}
	public String getFaqTitle() {
		return faqTitle;
	}
	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}
	public String getFaqContent() {
		return faqContent;
	}
	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}
	public Date getFaqCreate() {
		return faqCreate;
	}
	public void setFaqCreate(Date faqCreate) {
		this.faqCreate = faqCreate;
	}
	public Date getFaqUpdate() {
		return faqUpdate;
	}
	public void setFaqUpdate(Date faqUpdate) {
		this.faqUpdate = faqUpdate;
	}
	public String getFaqStatus() {
		return faqStatus;
	}
	public void setFaqStatus(String faqStatus) {
		this.faqStatus = faqStatus;
	}
	
	// toString() 오버라이드 - 정보 확인용
	@Override
	public String toString() {
		return "자주 묻는 질문 [글 번호=" + faqNo + ", 글 제목=" + faqTitle + ", 글 내용=" + faqContent + ", 작성일="
				+ faqCreate + ", 수정일=" + faqUpdate + ", 사용 여부=" + faqStatus + "]";
	}
}
