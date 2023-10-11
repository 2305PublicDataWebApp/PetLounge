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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.lounge.pet.hospital.domain.Hospital;
import com.lounge.pet.hospital.service.HospitalService;

@Controller
@RequestMapping("/hospital")
public class HospitalController {
	
	@Autowired
	private HospitalService hService;
	
	// 동물병원 안내 페이지
	@ResponseBody
	@GetMapping("/page.do")
	public ModelAndView hospitalPage(HttpSession session
									, ModelAndView mv) {
		try {
			String sessionId = (String) session.getAttribute("userId");
			Hospital userLocation = null;
			
			if(sessionId == null) {
				userLocation = new Hospital(37.5679212, 126.9830358); // 기본 주소 (종로)
			} else {
				// ======== 여기에 sessionId로 user select하는 쿼리
				// ======== 여기에 회원 주소 위도 경도로 변환하는 쿼리
				userLocation = new Hospital(37.5555739, 126.953635); // 회원 기본 주소
			}
			
			List<Hospital> hList = hService.selectFiveHos(userLocation);
			
			
			//  EPSG:2097 좌표를 보정하여(EPSG:5174) 위경도 좌표로 변환 (1회 업데이트 완료 후 주석처리)
			// updateTransform();
			
			mv.addObject("hList", hList)
			.setViewName("/hospital/hospitalPage");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	// 동물병원 안내 세부 페이지
	@GetMapping("/detail.do")
	public ModelAndView hospitalDetailPage(int hNo, ModelAndView mv) {
		Hospital hOne = hService.selectOneByhNo(hNo);
		mv.addObject("hOne", hOne)
		.setViewName("/hospital/hospitalDetail");
		return mv;
	}
		
	// 동물병원 검색 기능
	@PostMapping("/search.do")
	public ModelAndView hospitalSearch(@ModelAttribute Hospital hospital
									, @RequestParam("hSearchKeyword") String hSearchKeyword
									, HttpSession session
									, ModelAndView mv) {
		
		try {
			String sessionId = (String) session.getAttribute("userId");
			Hospital userSearchLocation = null;
			
			if(sessionId == null) {
				userSearchLocation = new Hospital(37.5679212, 126.9830358, hSearchKeyword); // 기본 주소 (종로)
			} else {
				// ======== 여기에 sessionId로 user select하는 쿼리
				// ======== 여기에 회원 주소 위도 경도로 변환하는 쿼리
				userSearchLocation = new Hospital(37.5555739, 126.953635, hSearchKeyword); // 회원 기본 주소
			}
			
			List<Hospital> hList = hService.selectFiveByKeyword(userSearchLocation);
			mv.addObject("hSearchKeyword", hSearchKeyword).addObject("hList", hList)
			.setViewName("/hospital/hospitalPage");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	// 좌표 이동
	@ResponseBody
	@GetMapping("/moveLocation.do")
	public String hospitalPage(@RequestParam(value="latitude", required = false) Double latitude
							 , @RequestParam(value="longitude", required = false) Double longitude) {
		Hospital userLocation = null;
		userLocation = new Hospital(latitude, longitude);
		
		List<Hospital> hList = hService.selectFiveHos(userLocation);
		Gson gson = new Gson();
			System.out.println( gson.toJson(hList));
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
