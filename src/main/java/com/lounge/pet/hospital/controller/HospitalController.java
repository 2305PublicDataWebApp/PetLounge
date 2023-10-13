package com.lounge.pet.hospital.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.locationtech.proj4j.BasicCoordinateTransform;
import org.locationtech.proj4j.CRSFactory;
import org.locationtech.proj4j.CoordinateReferenceSystem;
import org.locationtech.proj4j.ProjCoordinate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.lounge.pet.hospital.domain.HBookmark;
import com.lounge.pet.hospital.domain.HReview;
import com.lounge.pet.hospital.domain.Hospital;
import com.lounge.pet.hospital.service.HospitalService;
import com.lounge.pet.user.domain.User;
import com.lounge.pet.user.service.UserService;

@Controller
public class HospitalController {
	
	@Autowired
	private HospitalService hService;
	@Autowired
	private UserService uService;
	
	// 동물병원 안내 페이지
	@ResponseBody
	@GetMapping("/hospital/page.pet")
	public ModelAndView hospitalPage(@RequestParam(value="hSearchKeyword", required = false) String hSearchKeyword
									, HttpSession session
									, ModelAndView mv) {
		try {
			String sessionId = (String) session.getAttribute("uId");
			
			if(sessionId != null) {
				User user = uService.selectOneById(sessionId);
				mv.addObject("user", user);
			}
			
			if(hSearchKeyword != null) {
				mv.addObject("hSearchKeyword", hSearchKeyword);
			}
			
			//  EPSG:2097 좌표를 보정하여(EPSG:5174) 위경도 좌표로 변환 (1회 업데이트 완료 후 주석처리)
//			 updateTransform();
			
			mv.setViewName("/hospital/hospitalPage");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	// 메인페이지에서 검색했을 때, 동물병원 안내 페이지에 검색 결과 반영
//	@PostMapping("/hospital/page.pet")
//	public ModelAndView hospitalPageFromMain(@RequestParam("hSearchKeyword") String hSearchKeyword
//											, HttpSession session
//											, ModelAndView mv) {
//		try {
//			String sessionId = (String) session.getAttribute("uId");
//			
//			if(sessionId != null) {
//				User user = uService.selectOneById(sessionId);
//				mv.addObject("user", user);
//			}
//			mv.addObject("hSearchKeyword", hSearchKeyword);
//			mv.setViewName("/hospital/hospitalPage");
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return mv;
//	}
	
	// 동물병원 리스트 가져오기
	@ResponseBody
	@GetMapping("/hospital/findList.pet")
	public String hosFindList(@RequestParam("latitude") Double latitude
			 				, @RequestParam("longitude") Double longitude
			 				, HttpSession session) {
		String sessionId = (String) session.getAttribute("uId");
		Hospital userLocation = new Hospital(latitude, longitude, sessionId);
		List<Hospital> hList = hService.selectFiveHos(userLocation);
		Gson gson = new Gson();
		return gson.toJson(hList);
	}
	
	// 동물병원 안내 상세 페이지
	@GetMapping("/hospital/detail.pet")
	public ModelAndView hospitalDetailPage(int hNo
										, HttpSession session
										, ModelAndView mv) {
		String sessionId = (String) session.getAttribute("uId");
		Hospital hOne = hService.selectOneByhNo(hNo);
		HBookmark userBook = new HBookmark(sessionId, hNo);
		int hBookmark = hService.selectHBook(userBook);
		
		mv.addObject("hOne", hOne).addObject("hBookmark", hBookmark)
		.setViewName("/hospital/hospitalDetail");
		return mv;
	}
			
	// 동물병원 검색 기능
	@ResponseBody
	@GetMapping("/hospital/search.pet")
	public String hospitalSearch(@RequestParam("latitude") Double latitude
								, @RequestParam("longitude") Double longitude
								, @RequestParam("hSearchKeyword") String hSearchKeyword
								, HttpSession session) {
		
		String sessionId = (String) session.getAttribute("uId");
		Hospital userSearchLocation = new Hospital(latitude, longitude, sessionId, hSearchKeyword);
		List<Hospital> hList = hService.selectFiveByKeyword(userSearchLocation);
		Gson gson = new Gson();
		return gson.toJson(hList);
	}
	
	// 동물병원 즐겨찾기 기능
	@ResponseBody
	@PostMapping("/hospital/addToHBookmark.pet")
	public String addToFavorites(int hNo, HttpSession session) {
		String sessionId = (String) session.getAttribute("uId");
		String success = "";
		
		if(sessionId != null) {
			HBookmark userBook = new HBookmark(sessionId, hNo);
			int hBOne = hService.selectHBook(userBook);
			if(hBOne == 0) {
				// 없으면 insert
				int result = hService.insertHBook(userBook);
				if(result > 0) {
					success = "insert";
				}
			} else {
				// 있으면 delete
				int result = hService.deleteHBook(userBook);
				if(result > 0) {
					success = "delete";
				}
			}
		} else {
			success = "fail";
		}
		return success;
	}
	
	
	// 동물병원 리뷰 작성 기능 
	@PostMapping("/hReview/insert.pet")
	public ModelAndView hospitalReviewInsert(@ModelAttribute HReview hReview
									, HttpSession session
									, ModelAndView mv) {
		
		try {
			String sessionId = (String) session.getAttribute("uId");
			
			if(sessionId != null) {
				hReview.setuId(sessionId);
				int result = hService.insertHosReview(hReview);
				if(result > 0) {
					mv.setViewName("redirect:/hospital/detail.pet?hNo=" + hReview.gethNo());
				} else {
					
				}
			} else {
				mv.addObject("msg", "로그인이 필요한 서비스입니다.");
				mv.addObject("url", "/user/login.pet");
				mv.setViewName("common/message");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	// 좌표 이동
	@ResponseBody
	@GetMapping("/hospital/moveLocation.pet")
	public String hospitalPage(@RequestParam(value="latitude", required = false) Double latitude
							 , @RequestParam(value="longitude", required = false) Double longitude
							 , HttpSession session) {
		String sessionId = (String) session.getAttribute("uId");
		Hospital userLocation = new Hospital(latitude, longitude, sessionId);
		List<Hospital> hList = hService.selectFiveHos(userLocation);
		Gson gson = new Gson();
		return gson.toJson(hList); 
	}
	
	// Proj4J 라이브러리를 사용하여 EPSG:2097 좌표를 보정하여(EPSG:5174) 위경도 좌표로 변환
    public ProjCoordinate transform(double dblX, double dblY) {
    	String sourceCRS = "+proj=tmerc +lat_0=38 +lon_0=127.0028902777778 +k=1 +x_0=200000 +y_0=500000 +ellps=bessel +units=m +no_defs +towgs84=-115.80,474.99,674.11,1.16,-2.31,-1.63,6.43"; 
        String targetCRS = "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs"; 
        
        // 좌표계 객체 생성
        CRSFactory crsFactory = new CRSFactory();
        CoordinateReferenceSystem source = crsFactory.createFromParameters("EPSG:5174", sourceCRS);
        CoordinateReferenceSystem target = crsFactory.createFromParameters("EPSG:4326", targetCRS);
        BasicCoordinateTransform transformer = new BasicCoordinateTransform(source, target);

        // 좌표 변환을 위한 ProjCoordinate 초기화
        ProjCoordinate sourceCoord = new ProjCoordinate(dblX, dblY);
        ProjCoordinate targetCoord = new ProjCoordinate();

        // 좌표 변환 실행
        transformer.transform(sourceCoord, targetCoord);

        // targetCoord.y : 위도 / targetCoord.x : 경도;
        return targetCoord;
    }
    
    public void updateTransform() {
		List<Hospital> transList = hService.selectAllList();
		for (Hospital items : transList) {
			double latitude = items.gethY(); // 병원 항목의 위도 (EPSG:2097 좌표)
		    double longitude = items.gethX(); // 병원 항목의 경도 (EPSG:2097 좌표)

		    // 좌표 변환을 수행하여 위경도 좌표로 변환
		    ProjCoordinate targetCoord = transform(longitude, latitude);

		    // 변환된 좌표를 사용하여 Hospital 객체 업데이트
		    Hospital hosLocation = new Hospital(items.gethNo(), targetCoord.y, targetCoord.x);

		    // 각 병원 항목에 대해 업데이트 수행
		    int result = hService.updateXYtoLatLng(hosLocation);
		}		
    }

}
