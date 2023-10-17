package com.lounge.pet.user.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.lounge.pet.board.domain.Board;
import com.lounge.pet.hospital.domain.HBookmark;
import com.lounge.pet.hospital.domain.Hospital;
import com.lounge.pet.hospital.service.HospitalService;
import com.lounge.pet.support.domain.Support;
import com.lounge.pet.support.domain.SupportHistory;
import com.lounge.pet.user.domain.UPageInfo;
import com.lounge.pet.user.domain.User;

import com.lounge.pet.user.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService uService;
	


	// 비밀번호 재확인 페이지 user/checkPw.pet
	@RequestMapping(value = "/user/checkPw.pet", method = RequestMethod.GET)
	public ModelAndView checkPwPage(ModelAndView mv, @RequestParam(name = "uId", required = false) String uId,
			HttpSession session) {
		String sessionId = (String) session.getAttribute("uId"); // 세션에 저장된 아이디
		if (sessionId != null && !sessionId.isEmpty()) {

			User user = uService.selectOneById(sessionId);
			if (user != null) {
				mv.addObject("user", user);
				mv.setViewName("user/userCheckPw"); // 비밀번호 확인 페이지로 이동
			} else {
				mv.addObject("msg", "비밀번호 재확인 페이지 출력 실패");
				mv.addObject("url", "/home.pet");
				mv.setViewName("common/errorPage");
			}

		} else {
			mv.addObject("msg", "로그인 후 이용 가능");
			mv.addObject("url", "/user/login.pet");
			mv.setViewName("errorPage"); // 오류 페이지로 이동
		}
		return mv;
	}

	// 비밀번호 재확인 user/checkPw.pet
	@RequestMapping(value = "/user/checkPw.pet", method = RequestMethod.POST)
	public ModelAndView checkPw(ModelAndView mv, @RequestParam(name = "uPw", required = false) String uPw,
			HttpSession session) {

		String uId = (String) session.getAttribute("uId"); // 세션에 저장된 아이디

		User uOne = new User();
		uOne.setuId(uId);
		uOne.setuPw(uPw);
		User user = uService.userLogin(uOne);

		if (user != null) {
			mv.setViewName("redirect:/user/update.pet");
		} else {
			mv.addObject("msg", "비밀번호가 일치하지 않습니다.");
			mv.addObject("url", "/user/checkPw.pet");
			mv.setViewName("common/errorPage"); // 오류 페이지로 이동
		}
		return mv;
	}

	// 회원탈퇴 user/delete.pet
	@RequestMapping(value = "/user/delete.pet", method = RequestMethod.GET)
	public ModelAndView userDeletePage(ModelAndView mv, @RequestParam(name = "uId", required = false) String uId,
			HttpSession session) {

		String sessionId = (String) session.getAttribute("uId"); // 세션에 저장된 아이디
		if (sessionId != null && !sessionId.isEmpty()) {
			User user = uService.selectOneById(sessionId);
			if (user != null) {
				mv.addObject("user", user);
				mv.setViewName("user/userDelete");
			} else {
				mv.addObject("msg", "회원탈퇴 페이지 출력 실패");
				mv.addObject("url", "/home.pet");
				mv.setViewName("common/errorPage");
			}
		} else {
			mv.addObject("msg", "로그인 후 이용 가능");
			mv.addObject("url", "/user/login.pet");
			mv.setViewName("errorPage");
		}
		return mv;
	}

	// 회원탈퇴 user/delete.pet
	@RequestMapping(value = "/user/delete.pet", method = RequestMethod.POST)
	public ModelAndView userDelete(ModelAndView mv, @RequestParam(name = "uPw", required = false) String uPw,
			HttpSession session) {
		try {
			String sessionId = (String) session.getAttribute("uId"); // 세션에 저장된 아이디
			if (sessionId != "" && sessionId != null) {

				User uOne = new User();
				uOne.setuId(sessionId);
				uOne.setuPw(uPw);
				User user = uService.userLogin(uOne);

				if (user != null) {

					int result = uService.deleteUser(sessionId);

					if (result > 0) {
						// 회원탈퇴 성공 시 세션 무효화 (로그아웃)
						session.invalidate();
						mv.addObject("msg", "회원 탈퇴 성공");
						mv.addObject("url", "/home.pet");
						mv.setViewName("common/alert");
					} else {
						mv.addObject("msg", "회원 탈퇴 실패");
						mv.addObject("url", "redirect:/user/delete.pet");
						mv.setViewName("common/errorPage");
					}
				} else {
					mv.addObject("msg", "비밀번호 오류");
					mv.addObject("url", "/user/delete.pet");
					mv.setViewName("common/errorPage");
				}
			} else {
				mv.addObject("msg", "로그인 후 이용 가능");
				mv.addObject("url", "/user/login.pet");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의바랍니다.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/user/login.pet");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}

	// 아이디,비밀번호 찾기 페이지 user/idpwFind.pet
	@RequestMapping(value = "/user/idpwFind.pet", method = RequestMethod.GET)
	public ModelAndView userIdPwPage(ModelAndView mv) {
		mv.setViewName("/user/userFind");
		return mv;
	}

	// 회원정보조회 페이지 user/userInfo.pet
	@RequestMapping(value = "/user/userInfo.pet", method = RequestMethod.GET)
	public ModelAndView userInfoPage(ModelAndView mv
//			, @RequestParam(name = "uId", required = false) String uId
			, HttpSession session) {
		try {
			String sessionId = (String) session.getAttribute("uId"); // 세션에 저장된 아이디
			if (sessionId != "" && sessionId != null) {
				User user = uService.selectOneById(sessionId);

				if (user != null) {
					mv.addObject("user", user);
					mv.setViewName("user/userInfo");
				} else {
					mv.addObject("msg", "회원정보조회 실패");
					mv.addObject("url", "/home.pet");
					mv.setViewName("common/errorPage");
				}
			} else {
				mv.addObject("msg", "로그인 후 이용 바랍니다.");
				mv.addObject("url", "/user/login.pet");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의바랍니다.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/home.pet");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}

	// 로그인 페이지 user/login.pet
	@RequestMapping(value = "/user/login.pet", method = RequestMethod.GET)
	public ModelAndView userLoginPage(ModelAndView mv) {
		mv.setViewName("/user/userLogin");
		return mv;
	}

	// 로그인 페이지 user/login.pet
	@RequestMapping(value = "/user/login.pet", method = RequestMethod.POST)
	public ModelAndView userLogin(ModelAndView mv, @ModelAttribute User user, HttpSession session) {

		try {
			User uOne = uService.userLogin(user);
			if (uOne != null) { // 성공 시 아이디, 닉네임 세션에 저장
				session.setAttribute("uId", uOne.getuId());
				session.setAttribute("uNickname", uOne.getuNickName());
				mv.setViewName("home");
			} else { // 실패
				mv.addObject("msg", "로그인 실패");
				mv.addObject("url", "/user/login.pet");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) { // 예외처리
			mv.addObject("msg", "관리자에게 문의바랍니다.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/user/register.pet");
			mv.setViewName("common/errorPage");
		}

		return mv;
	}

	// 로그아웃 user/logout.pet
	@RequestMapping(value = "/user/logout.pet", method = RequestMethod.GET)
	public ModelAndView userLogout(ModelAndView mv, HttpSession session) {
		if (session != null) {
			session.invalidate();
			mv.setViewName("home");
		} else {
			mv.addObject("msg", "로그아웃 실패");
			mv.addObject("url", "/home.pet");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}

	// 회원정보수정 페이지 user/update.pet
	@RequestMapping(value = "/user/update.pet", method = RequestMethod.GET)
	public ModelAndView userUpdatePage(ModelAndView mv
//			, @RequestParam(name = "uId", required = false) String uId
			, HttpSession session) {
		try {
			String sessionId = (String) session.getAttribute("uId");
			if (sessionId != null && sessionId != "") {
				User userOne = uService.selectOneById(sessionId);
				mv.addObject("user", userOne);
				mv.setViewName("/user/userUpdate");
			} else {
				mv.addObject("msg", "본인정보만 확인 가능");
				mv.addObject("url", "/home.pet");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", "관리자 문의바람");
			mv.addObject("url", "/home.pet");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}

	// 회원정보수정 user/update.pet
	@RequestMapping(value = "/user/update.pet", method = RequestMethod.POST)
	public ModelAndView userUpdate(ModelAndView mv, @ModelAttribute User user,
			@RequestParam(value = "uploadFile", required = false) MultipartFile uploadFile, HttpServletRequest request,
			HttpSession session) {

		try {
			String sessionId = (String) session.getAttribute("uId"); // 세션에 저장된 아이디
			System.out.println(sessionId);
			System.out.println(user.getuId());
			System.out.println(user.toString());
			if (user.getuId().equals(sessionId) && sessionId != null && sessionId != "") {

				if (uploadFile != null && !uploadFile.isEmpty()) {
					// 수정
					// 1. 대체, 2. 삭제 후 등록
					// 기존 업로드 된 파일 존재 여부 체크 후
					String fileName = user.getuFileReName();
					if (fileName != null) {
						// 있으면 기존 파일 삭제
						this.deleteFile(fileName, request);
					}
					// 없으면 새로 업로드 하려는 파일 저장
					Map<String, Object> infoMap = this.saveFile(request, uploadFile);
					// 변수 차이
					user.setuFileName((String) infoMap.get("fileName"));
					user.setuFileReName((String) infoMap.get("fileRename"));
					user.setuFilePath((String) infoMap.get("filePath"));
					user.setuFileLength((long) infoMap.get("fileLength"));
				} else {
					// 이미지가 선택되지 않았을 때 기본 이미지 정보 설정
					user.setuFileName("profile.png");
					user.setuFileReName("profile.png");
					user.setuFilePath("../resources/userUploadFiles/profile.png");
					user.setuFileLength(0L); // 이미지 크기를 0으로 설정하거나 필요에 따라 적절한 값으로 설정
				}

				int result = uService.UpdateUser(user);

				if (result > 0) { // 수정 성공
					mv.setViewName("redirect:/user/userInfo.pet");
				} else { // 수정 실패
					mv.addObject("msg", "회원 정보 수정에 실패하였습니다.");
					mv.addObject("url", "redirect:/user/update.pet?uId=" + sessionId);
					mv.setViewName("common/errorPage");
				}
			} else {
				mv.addObject("msg", "로그인 후 이용 가능");
				mv.addObject("url", "/user/login.pet");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의바랍니다.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/user/login.pet");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}

	// 회원가입 페이지 user/register.pet
	@RequestMapping(value = "/user/register.pet", method = RequestMethod.GET)
	public ModelAndView userRegisterPage(ModelAndView mv) {
		mv.setViewName("/user/userRegister");
		return mv;
	}

	// 회원가입 user/register.pet
	@RequestMapping(value = "/user/register.pet", method = RequestMethod.POST)
	@ResponseBody // JSON 응답 반환
	public Map<String, Object> userRegister(@ModelAttribute User user,
			@RequestParam(value = "uploadFile", required = false) MultipartFile uploadFile, HttpServletRequest request,
			HttpSession session) {
		Map<String, Object> response = new HashMap<>();

		try {
			if (uploadFile != null && !uploadFile.getOriginalFilename().equals("")) {
				// 파일정보(이름, 리네임, 경로, 크기) 및 파일저장
				// 여러가지 데이터를 받아서 리턴하기 위해 Map 사용
				Map<String, Object> bMap = this.saveFile(request, uploadFile);

				user.setuFileName((String) bMap.get("fileName"));
				user.setuFileReName((String) bMap.get("fileRename"));
				user.setuFilePath((String) bMap.get("filePath"));
				user.setuFileLength((long) bMap.get("fileLength"));
			} else {
				// 이미지가 선택되지 않았을 때 기본 이미지 정보 설정
				user.setuFileName("profile.png");
				user.setuFileReName("profile.png");
				user.setuFilePath("../resources/userUploadFiles/profile.png");
				user.setuFileLength(0L); // 이미지 크기를 0으로 설정하거나 필요에 따라 적절한 값으로 설정
			}

			int result = uService.insertUser(user);
			if (result > 0) {
				response.put("success", true);
			} else {
				response.put("fail", false);
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.put("fail", false);
			response.put("error", e.getMessage());
		}

		return response;
	}

	// 아이디 중복체크 및 유효성 검사
	@ResponseBody
	@RequestMapping(value = "/user/checkId.pet", method = RequestMethod.POST)
	public String userCheckId(@RequestParam("uId") String uId) {
		User uOne = null;

		if (validateUserId(uId)) {
			uOne = uService.userCheckId(uId);
			if (uOne == null) {
				return "[\"Valid\", \"Unique\"]";
			} else {
				return "[\"Valid\", \"NotUnique\"]";
			}
		} else {
			uOne = uService.userCheckId(uId);
			if (uOne == null) {
				return "[\"Invalid\", \"Unique\"]";
			} else {
				return "[\"Invalid\", \"NotUnique\"]";
			}
		}
	}

	private boolean validateUserId(String uId) {
		String regex = "^[a-zA-Z0-9]{1,10}$";
		return uId.matches(regex);
	}

	// 닉네임 중복체크 및 유효성 검사
	@ResponseBody
	@RequestMapping(value = "/user/checkNick.pet", method = RequestMethod.POST)
	public String userCheckNick(@RequestParam("uNickName") String uNickName) {
		User uOne = null;

		if (validateUserNick(uNickName)) {
			uOne = uService.userCheckNick(uNickName);
			if (uOne == null) {
				return "[\"Valid\", \"Unique\"]";
			} else {
				return "[\"Valid\", \"NotUnique\"]";
			}
		} else {
			uOne = uService.userCheckNick(uNickName);
			if (uOne == null) {
				return "[\"Invalid\", \"Unique\"]";
			} else {
				return "[\"Invalid\", \"NotUnique\"]";
			}
		}
	}

	private boolean validateUserNick(String uNickName) {
		String regex = "^[가-힣a-zA-Z]{1,5}$";
		return uNickName.matches(regex);
	}

	// 비밀번호 유효성 검사
	@ResponseBody
	@RequestMapping(value = "/user/checkPwVal.pet", method = RequestMethod.POST)
	public String usercheckPw(@RequestParam("uPw") String uPw) {

		if (validateUserPw(uPw)) {
			return "Valid";
			
		} else {
			return "Invalid";
		}
	}

	private boolean validateUserPw(String uPw) {
		String regex = "^[a-zA-Z0-9]{1,10}$";
		return uPw.matches(regex);
	}
	
	
	
	// 비밀번호 일치 확인
		@ResponseBody
		@RequestMapping(value = "/user/checkRePw.pet", method = RequestMethod.POST)
		public String usercheckRePw(@RequestParam("uPw") String uPw, @RequestParam("uPwRe") String uPwRe) {
			if (uPwRe.equals(uPw)) {
				return "success";
				
			} else {
				return "error";
			}
		}
		
		
		// 전화번호 유효성 검사
		@ResponseBody
		@RequestMapping(value = "/user/checkPhone.pet", method = RequestMethod.POST)
		public String usercheckPhone(@RequestParam("uPhone") String uPhone) {

			if (validateUserPhone(uPhone)) {
				return "Valid";
				
			} else {
				return "Invalid";
			}
		}

		private boolean validateUserPhone(String uPhone) {
			String regex = "^[0-9]{11}$";
			return uPhone.matches(regex);
		}
		
		
		

	// 나의 게시글 검색 페이지 user/searchBoard.pet
	@RequestMapping(value = "/user/searchBoard.pet", method = RequestMethod.GET)
	public ModelAndView userSearchBoardPage(ModelAndView mv, HttpSession session) {
		try {
			String sessionId = (String) session.getAttribute("uId"); // 세션에 저장된 아이디
			if (sessionId != "" && sessionId != null) {
				User user = uService.selectOneById(sessionId);
				if (user != null) {
					mv.addObject("user", user);
					mv.setViewName("/user/uBoardList");
				} else {
					mv.addObject("msg", "게시글 조회 실패");
					mv.addObject("url", "/home.pet");
					mv.setViewName("common/errorPage");
				}
			} else {
				mv.addObject("msg", "로그인 후 이용 바랍니다.");
				mv.addObject("url", "/user/login.pet");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의바랍니다.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/home.pet");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}

	// 나의 북마크 페이지 user/searchBoardMark.pet
	@RequestMapping(value = "/user/searchBoardMark.pet", method = RequestMethod.GET)
	public ModelAndView userBookMarkPage(ModelAndView mv, HttpSession session) {
		try {
			String sessionId = (String) session.getAttribute("uId"); // 세션에 저장된 아이디
			if (sessionId != "" && sessionId != null) {
				User user = uService.selectOneById(sessionId);
				if (user != null) {
					mv.addObject("user", user);
					mv.setViewName("/user/uBoardMarkList");
				} else {
					mv.addObject("msg", "북마크 조회 실패");
					mv.addObject("url", "/home.pet");
					mv.setViewName("common/errorPage");
				}
			} else {
				mv.addObject("msg", "로그인 후 이용 바랍니다.");
				mv.addObject("url", "/user/login.pet");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의바랍니다.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/home.pet");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}

	// 나의 자유게시판 댓글 페이지 user/searchBoardReply.pet
	@RequestMapping(value = "/user/searchBoardReply.pet", method = RequestMethod.GET)
	public ModelAndView userBoardReplyPage(ModelAndView mv, HttpSession session) {
		try {
			String sessionId = (String) session.getAttribute("uId"); // 세션에 저장된 아이디
			if (sessionId != "" && sessionId != null) {
				User user = uService.selectOneById(sessionId);
				if (user != null) {
					mv.addObject("user", user);
					mv.setViewName("/user/uBoardReplyList");
				} else {
					mv.addObject("msg", "댓글 조회 실패");
					mv.addObject("url", "/home.pet");
					mv.setViewName("common/errorPage");
				}
			} else {
				mv.addObject("msg", "로그인 후 이용 바랍니다.");
				mv.addObject("url", "/user/login.pet");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의바랍니다.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/home.pet");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}

	// 나의 즐겨찾는 병원 페이지 user/uHospital.pet
	@RequestMapping(value = "/user/uHospital.pet", method = RequestMethod.GET)
	public ModelAndView userHospitalPage(ModelAndView mv, HttpSession session
			,@RequestParam(value = "page", required=false, defaultValue = "1") Integer currentPage) {
		try {
			String sessionId = (String) session.getAttribute("uId"); // 세션에 저장된 아이디
			if (sessionId != "" && sessionId != null) {
				User user = uService.selectOneById(sessionId);
				if (user != null) {
					
						Integer totalCount = uService.getListCount(sessionId);
						UPageInfo aInfo = this.getPageInfo(currentPage, totalCount);
				
						List<Hospital> hList = uService.selectHos(sessionId, aInfo);
						
						mv.addObject("aInfo", aInfo);
						mv.addObject("hList", hList);
						mv.addObject("user", user);
						mv.setViewName("/user/uHospitalList");
						
				} else {
					mv.addObject("msg", "병원목록 조회 실패");
					mv.addObject("url", "/home.pet");
					mv.setViewName("common/errorPage");
				}
			} else {
				mv.addObject("msg", "로그인 후 이용 바랍니다.");
				mv.addObject("url", "/user/login.pet");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의바랍니다.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/home.pet");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	
	
	//즐겨찾는 병원 리스트 검색
	@RequestMapping(value = "/user/searchHospital.pet", method = RequestMethod.GET)
	public String userHospitalSearchPage(
			@RequestParam("searchCondition") String searchCondition
			, @ RequestParam("searchKeyword") String searchKeyword
			, @ RequestParam(value="page", required=false, defaultValue="1") Integer currentPage
			, Model model, HttpSession session) {

		String sessionId = (String) session.getAttribute("uId"); // 세션에 저장된 아이디
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("searchCondition", searchCondition);
		paramMap.put("searchKeyword", searchKeyword);
		paramMap.put("uId", sessionId);
		
		int totalCount = uService.getListCount(paramMap);
		UPageInfo aInfo = this.getPageInfo(currentPage, totalCount);
		
		List<Hospital> hList = uService.searchUserByKeyword(aInfo, paramMap);
		
		if(!hList.isEmpty()) {
//			model.addAttribute("searchCondition", searchCondition); paramMap으로 써도 됨
//			model.addAttribute("searchKeyword", searchKeyword);
			model.addAttribute("paramMap", paramMap);
			model.addAttribute("aInfo", aInfo);
			model.addAttribute("hList", hList);
			return "/user/uHospitalSearchList";
		} else {
			model.addAttribute("msg", "서비스 실패");
			model.addAttribute("url", "/user/uHospital.pet");
			return "common/errorPage";
		}
	}
	
	
	
	
	// 나의 병원 리뷰 페이지 user/searchHospitalReview.pet
	@RequestMapping(value = "/user/searchHospitalReview.pet", method = RequestMethod.GET)
	public ModelAndView userHospitalReviewPage(ModelAndView mv, HttpSession session) {
		try {
			String sessionId = (String) session.getAttribute("uId"); // 세션에 저장된 아이디
			if (sessionId != "" && sessionId != null) {
				User user = uService.selectOneById(sessionId);
				if (user != null) {
					mv.addObject("user", user);
					mv.setViewName("/user/uHospitalReviewList");
				} else {
					mv.addObject("msg", "병원리뷰 조회 실패");
					mv.addObject("url", "/home.pet");
					mv.setViewName("common/errorPage");
				}
			} else {
				mv.addObject("msg", "로그인 후 이용 바랍니다.");
				mv.addObject("url", "/user/login.pet");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의바랍니다.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/home.pet");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}

	// 나의 후원목록 검색 페이지 user/searchSupport.pet
	@RequestMapping(value = "/user/searchSupport.pet", method = RequestMethod.GET)
	public ModelAndView userSearchSupport(ModelAndView mv, HttpSession session) {
		try {
			String sessionId = (String) session.getAttribute("uId"); // 세션에 저장된 아이디
			if (sessionId != "" && sessionId != null) {
				User user = uService.selectOneById(sessionId);
				if (user != null) {
					mv.addObject("user", user);
					mv.setViewName("/user/uSupportList");
				} else {
					mv.addObject("msg", "후원목록 조회 실패");
					mv.addObject("url", "/home.pet");
					mv.setViewName("common/errorPage");
				}
			} else {
				mv.addObject("msg", "로그인 후 이용 바랍니다.");
				mv.addObject("url", "/user/login.pet");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의바랍니다.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/home.pet");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}

	// 나의 후원댓글 페이지 user/searchSupportReply.pet
	@RequestMapping(value = "/user/searchSupportReply.pet", method = RequestMethod.GET)
	public ModelAndView userSupportReplyPage(ModelAndView mv, HttpSession session) {
		try {
			String sessionId = (String) session.getAttribute("uId"); // 세션에 저장된 아이디
			if (sessionId != "" && sessionId != null) {
				User user = uService.selectOneById(sessionId);
				if (user != null) {
					mv.addObject("user", user);
					mv.setViewName("/user/uSupportReplyList");
				} else {
					mv.addObject("msg", "후원댓글 조회 실패");
					mv.addObject("url", "/home.pet");
					mv.setViewName("common/errorPage");
				}
			} else {
				mv.addObject("msg", "로그인 후 이용 바랍니다.");
				mv.addObject("url", "/user/login.pet");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의바랍니다.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/home.pet");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}

	private Map<String, Object> saveFile(HttpServletRequest request, MultipartFile uploadFile) throws Exception {

		Map<String, Object> fileMap = new HashMap<String, Object>();

		// resources 경로 구하기
		String root = request.getSession().getServletContext().getRealPath("resources");

		// 파일 저장 경로 구하기
		String savePath = root + "\\userUploadFiles";

		// 파일 이름 구하기
		String fileName = uploadFile.getOriginalFilename();

		// 파일 확장자 구하기
		String extension = fileName.substring(fileName.lastIndexOf(".") + 1);

		// 시간으로 파일 리네임하기
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String fileRename = sdf.format(new Date(System.currentTimeMillis()));

		// 파일 저장 전 폴더 만들기
		File saveFolder = new File(savePath);
		if (!saveFolder.exists()) {
			saveFolder.mkdir();
		}

		// 파일저장
		File saveFile = new File(savePath + "\\" + fileRename + "." + extension);
		uploadFile.transferTo(saveFile);
		long fileLength = uploadFile.getSize();

		// 파일정보 리턴
		fileMap.put("fileName", fileName);
		fileMap.put("fileRename", fileRename);
		fileMap.put("filePath", "../resources/userUploadFiles/" + fileRename + "." + extension);
		fileMap.put("fileLength", fileLength);

		return fileMap;
	}

	private void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String delFilePath = root + "\\userUploadFiles\\" + fileName;
		File file = new File(delFilePath);

		// 파일 이름과 파일 리네임이 모두 "profile.png"이 아닌 경우에만 파일 삭제
		if (file.exists() && (!fileName.equals("profile.png"))) {
			file.delete();
		}
	}
	
	
	//병원 리스트 페이징
	private UPageInfo getPageInfo(Integer currentPage, Integer totalCount) {
		int recordCountPerPage = 3;
		int naviCountPerPage = 5;
		
		int naviTotalCount;
		naviTotalCount 
			= (int)Math.ceil((double)totalCount/recordCountPerPage);   //6.2 -> 7 올림해주는 식
		
		int startNavi = ((int)((double)currentPage/naviCountPerPage+0.9)-1)*naviCountPerPage+1;  //이거뭐냐...
		
		int endNavi = startNavi + naviCountPerPage - 1;
		
		if(endNavi > naviTotalCount) {
			endNavi = naviTotalCount;
		}
			
		UPageInfo aInfo = new UPageInfo(currentPage, totalCount, naviTotalCount, recordCountPerPage, naviCountPerPage, startNavi, endNavi);
		
		return aInfo;
	}

}
