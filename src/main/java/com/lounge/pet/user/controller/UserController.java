package com.lounge.pet.user.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

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
			mv.setViewName("user/userCheckPw"); // 비밀번호 확인 페이지로 이동
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
			mv.setViewName("user/userDelete");
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
	public ModelAndView userUpdate(ModelAndView mv, @ModelAttribute User user, HttpSession session) {

		try {
			String sessionId = (String) session.getAttribute("uId"); // 세션에 저장된 아이디
			System.out.println(sessionId);
			System.out.println(user.getuId());
			System.out.println(user.toString());
			if (user.getuId().equals(sessionId) && sessionId != null && sessionId != "") {

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

	// 나의 게시글 페이지 user/searchBoard.pet
	@RequestMapping(value = "/user/searchBoard.pet", method = RequestMethod.GET)
	public ModelAndView userBoardPage(ModelAndView mv) {
		mv.setViewName("/user/uBoardList");
		return mv;
	}

	// 나의 북마크 페이지 user/searchBoardMark.pet
	@RequestMapping(value = "/user/searchBoardMark.pet", method = RequestMethod.GET)
	public ModelAndView userBookMarkPage(ModelAndView mv) {
		mv.setViewName("/user/uBoardMarkList");
		return mv;
	}

	// 나의 자유게시판 댓글 페이지 user/searchBoardReply.pet
	@RequestMapping(value = "/user/searchBoardReply.pet", method = RequestMethod.GET)
	public ModelAndView userBoardReplyPage(ModelAndView mv) {
		mv.setViewName("/user/uBoardReplyList");
		return mv;
	}

	// 나의 즐겨찾는 병원 페이지 user/searchHospital.pet
	@RequestMapping(value = "/user/searchHospital.pet", method = RequestMethod.GET)
	public ModelAndView userHospitalPage(ModelAndView mv) {
		mv.setViewName("/user/uHospitalList");
		return mv;
	}

	// 나의 병원 리뷰 페이지 user/searchHospitalReview.pet
	@RequestMapping(value = "/user/searchHospitalReview.pet", method = RequestMethod.GET)
	public ModelAndView userHospitalReviewPage(ModelAndView mv) {
		mv.setViewName("/user/uHospitalReviewList");
		return mv;
	}

	// 나의 후원목록 페이지 user/searchSupport.pet
	@RequestMapping(value = "/user/searchSupport.pet", method = RequestMethod.GET)
	public ModelAndView userSupportPage(ModelAndView mv) {
		mv.setViewName("/user/uSupportList");
		return mv;
	}

	// 나의 후원댓글 페이지 user/searchSupportReply.pet
	@RequestMapping(value = "/user/searchSupportReply.pet", method = RequestMethod.GET)
	public ModelAndView userSupportReplyPage(ModelAndView mv) {
		mv.setViewName("/user/uSupportReplyList");
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
		File saveFile = new File(savePath + "\\" + fileRename);
		uploadFile.transferTo(saveFile);
		long fileLength = uploadFile.getSize();

		// 파일정보 리턴
		fileMap.put("fileName", fileName);
		fileMap.put("fileRename", fileRename);
		fileMap.put("filePath", "../resources/userUploadFiles/" + fileRename);
		fileMap.put("fileLength", fileLength);

		return fileMap;
	}

}
