package com.lounge.pet.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {
	
		// 비밀번호 재확인 페이지
		@RequestMapping(value="/checkPw/page.do", method = RequestMethod.GET)
		public ModelAndView checkPwPage(ModelAndView mv) {
			mv.setViewName("/user/checkPw");
			return mv;
		}
		
		// 회원탈퇴 페이지
		@RequestMapping(value="/delete/page.do", method = RequestMethod.GET)
		public ModelAndView userDeletePage(ModelAndView mv) {
			mv.setViewName("/user/userDelete");
			return mv;
		}
		
		// 아이디,비밀번호 찾기 페이지
		@RequestMapping(value="/idpwFind/page.do", method = RequestMethod.GET)
		public ModelAndView userIdPwPage(ModelAndView mv) {
			mv.setViewName("/user/idpwFind");
			return mv;
		}
		
		// 회원정보조회 페이지 user/userInfo.do
		@RequestMapping(value="/userInfo/page.do", method = RequestMethod.GET)
		public ModelAndView userInfoPage(ModelAndView mv) {
			mv.setViewName("/user/userInfo");
			return mv;
		}
		
		// 로그인 페이지
		@RequestMapping(value="/userLogin/page.do", method = RequestMethod.GET)
		public ModelAndView userLoginPage(ModelAndView mv) {
			mv.setViewName("/user/login");
			return mv;
		}
		
		// 회원정보수정 페이지
		@RequestMapping(value="/userUpdate/page.do", method = RequestMethod.GET)
		public ModelAndView userUpdatePage(ModelAndView mv) {
			mv.setViewName("/user/userUpdate");
			return mv;
		}
		
		// 회원가입 페이지
		@RequestMapping(value="/userRegister/page.do", method = RequestMethod.GET)
		public ModelAndView userRegisterPage(ModelAndView mv) {
			mv.setViewName("/user/register");
			return mv;
		}
		
		// 나의 게시글 페이지
		@RequestMapping(value="/userSearchBoard/page.do", method = RequestMethod.GET)
		public ModelAndView userBoardPage(ModelAndView mv) {
			mv.setViewName("/user/uBoardList");
			return mv;
		}
		
		// 나의 북마크 페이지
		@RequestMapping(value="/userSearchBoardMark/page.do", method = RequestMethod.GET)
		public ModelAndView userBookMarkPage(ModelAndView mv) {
			mv.setViewName("/user/uBoardMarkList");
			return mv;
		}
		
		// 나의 자유게시판 댓글 페이지
		@RequestMapping(value="/userSearchBoardReply/page.do", method = RequestMethod.GET)
		public ModelAndView userBoardReplyPage(ModelAndView mv) {
			mv.setViewName("/user/uBoardReplyList");
			return mv;
		}
		
		// 나의 즐겨찾는 병원 페이지
		@RequestMapping(value="/userSearchHospital/page.do", method = RequestMethod.GET)
		public ModelAndView userHospitalPage(ModelAndView mv) {
			mv.setViewName("/user/uHospitalList");
			return mv;
		}
		
		// 나의 병원 리뷰 페이지
		@RequestMapping(value="/userSearchHospitalReview/page.do", method = RequestMethod.GET)
		public ModelAndView userHospitalReviewPage(ModelAndView mv) {
			mv.setViewName("/user/uHospitalReviewList");
			return mv;
		}
		
		// 나의 후원목록 페이지
		@RequestMapping(value="/userSearchSponsor/page.do", method = RequestMethod.GET)
		public ModelAndView userSponsorPage(ModelAndView mv) {
			mv.setViewName("/user/uSponsorList");
			return mv;
		}
		
		// 나의 후원댓글 페이지
		@RequestMapping(value="/userSearchSponsorReply/page.do", method = RequestMethod.GET)
		public ModelAndView userSponsorReplyPage(ModelAndView mv) {
			mv.setViewName("/user/uSponsorReplyList");
			return mv;
		}



}
