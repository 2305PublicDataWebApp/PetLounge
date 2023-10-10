package com.lounge.pet.support.controller;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.lounge.pet.support.domain.Support;
import com.lounge.pet.support.service.SupportService;


@Controller
public class SupportController {
	
	@Autowired
	private SupportService sService;

	// 후원 목록 페이지
	@RequestMapping(value="/support/list.do", method = RequestMethod.GET)
	public ModelAndView supportListPage(ModelAndView mv) {
		mv.setViewName("/support/supportList");
		return mv;
	}
	
	// 후원 세부 페이지
	@RequestMapping(value="/support/detail.do", method = RequestMethod.GET)
	public ModelAndView supportDetailPage(ModelAndView mv) {
		mv.setViewName("/support/supportDetail");
		return mv;
	}
	
	// 후원 등록 페이지
	@RequestMapping(value="/support/insert.do", method = RequestMethod.GET)
	public ModelAndView supportInsertPage(ModelAndView mv) {
		mv.setViewName("/support/supportInsert");
		return mv;
	}
	
	// 후원 수정 페이지
	@RequestMapping(value="/support/update.do", method = RequestMethod.GET)
	public ModelAndView supportUpdatePage(ModelAndView mv
			,@RequestParam("sNo") int sNo) {
		try {
			Support support = sService.selectSupportByNo(sNo);
			if(support != null) {
				mv.addObject("support", support);
				mv.setViewName("/support/supportUpdate");
			} else {
				mv.addObject("msg", "데이터 조회가 완료되지 않았습니다.");
				mv.addObject("url", "/support/list.do");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의하세요.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/support/list.do");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 후원 결제 페이지
	@RequestMapping(value="/support/payment.do", method = RequestMethod.GET)
	public ModelAndView supportPaymentPage(ModelAndView mv) {
		mv.setViewName("/support/supportPayment");
		return mv;
	}
	
	// 후원 결제완료 페이지
	@RequestMapping(value="/support/complete.do", method = RequestMethod.GET)
	public ModelAndView supportPayCompletePage(ModelAndView mv) {
		mv.setViewName("/support/supportPayComplete");
		return mv;
	}
	
	// 후원 등록 
	@RequestMapping(value = "/support/insert.do", method = RequestMethod.POST)
	public ModelAndView insertSupport(ModelAndView mv
			, @ModelAttribute Support support
			, @RequestParam(value="uploadFile", required = false) MultipartFile uploadFile) {
		System.out.println(support.toString());
		try {
			if(uploadFile != null && !uploadFile.getOriginalFilename().equals("")) {
				// 파일 정보(이름, 리네임, 경로) 및 파일 저장 
//				Map<String, Object> fBMap = this.saveFile(request, uploadFile);
//				support.setFindFilename((String)fBMap.get("fileName"));
//				support.setFindFilerename((String)fBMap.get("fileRename"));
//				support.setFindFilepath((String)fBMap.get("filePath"));
				String sImageUrl = "image";
				support.setsImageUrl(sImageUrl);
				System.out.println(support.toString());
			}
			int result = sService.insertSupport(support);
			if(result > 0) {
				mv.addObject("msg", "게시글이 등록되었습니다.");
				mv.addObject("url", "/support/list.do");
				mv.setViewName("common/message");
			} else {
				mv.addObject("msg", "게시글 등록이 완료되지 않았습니다.");
				mv.addObject("url", "/support/insert.do");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의하세요.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/support/insert.do");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 후원 수정 
	@RequestMapping(value="/support/update.do", method = RequestMethod.POST)
	public ModelAndView updateSupport(ModelAndView mv
			,@ModelAttribute Support support
			, @RequestParam(value="uploadFile", required = false) MultipartFile uploadFile
			, HttpServletRequest request) {
		try {
			if(uploadFile != null && !uploadFile.getOriginalFilename().equals("")) {
				String sImageUrl = "image";
				support.setsImageUrl(sImageUrl);
				System.out.println(support.toString());
				// 기존 업로드 파일 있으면 삭제 
//				String fileRename = support.getFindFilerename();
//				if(fileRename != null) {
//					this.deleteFile(fileRename, request);
//				}
				// 새로운 파일 저장 - 파일 정보(이름, 리네임, 경로) 및 파일 저장 
//				Map<String, Object> fBMap = this.saveFile(request, uploadFile);
//				support.setFindFilename((String)fBMap.get("fileName"));
//				support.setFindFilerename((String)fBMap.get("fileRename"));
//				support.setFindFilepath((String)fBMap.get("filePath"));
			}
			int result = sService.updateSupport(support);
			if(result > 0) {
				mv.addObject("msg", "게시글이 수정되었습니다.");
				mv.addObject("url", "/support/detail.do?sNo="+support.getsNo());
				mv.setViewName("common/message");
			} else {
				mv.addObject("msg", "게시글 수정이 완료되지 않았습니다.");
				mv.addObject("url", "/support/update.do?sNo="+support.getsNo());
				mv.setViewName("common/message");
			} 
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의하세요.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/support/update.do?sNo="+support.getsNo());
			mv.setViewName("common/errorPage");
			
//			mv.addObject("msg", "관리자에게 문의하세요.");
//			mv.addObject("url", "/support/update.do?sNo="+support.getsNo());
//			mv.setViewName("common/message");
		}
		return mv;
	}
	
	// 후원 삭제 
	@RequestMapping(value="/support/delete.do", method = RequestMethod.GET)
	public ModelAndView deleteSupport(ModelAndView mv
			, @RequestParam("sNo") int sNo) {
		try {
			// 후원 내역 있는지 확인 후 없으면 삭제 
			int historyCount = sService.getHistoryCount(sNo);
			if(historyCount == 0) {
				int result = sService.deleteSupport(sNo);
				if(result > 0) {
					mv.addObject("msg", "게시글이 삭제되었습니다.");
					mv.addObject("url", "/support/list.do");
					mv.setViewName("common/message");
				} else {
					mv.addObject("msg", "후원 내역이 있어 삭제할 수 없습니다.");
					mv.addObject("url", "/support/list.do");
					mv.setViewName("common/message");
				}
			}
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의하세요.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/support/detail.do?sNo="+sNo);
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
		
	
	
}
