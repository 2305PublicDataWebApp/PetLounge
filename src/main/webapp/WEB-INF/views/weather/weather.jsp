<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <jsp:include page="../include/importSource.jsp"></jsp:include>
        <link rel="stylesheet" href="/resources/css/weather/weather.css">
        <link rel="stylesheet" href="/resources/css/reset.css">
        <link rel="stylesheet" href="/resources/css/font.css">
        <title>산책 날씨 예보</title>
        <script src="http://code.jquery.com/jquery-1.7.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    </head>
    <body>
        <jsp:include page="../include/header.jsp"></jsp:include>

        <main class="main">
            <div class="contanier">
                <!-- 타이틀 -->
                <div class="main-title">
                    <h1>산책 날씨 예보</h1>
                </div>

                <div id="line"></div>

                <div class="choice-area">
                    <!-- 지역 선택 -->
                    <div class="region-selector">
                        <div id="region">
                            <button class="select-button">지역</button>
                            <p id="select-region"></p>
                        </div>
                            <ul class="region-list">
                                <li>
                                    <button class="button-item active" onclick="handleButtonClick('60', '127')">
                                        서울
                                    </button>
                                </li>
                                <li>
                                    <button class="button-item" onclick="handleButtonClick('66', '103')">
                                        세종
                                    </button>
                                </li>
                                <li>
                                    <button class="button-item" onclick="handleButtonClick('51', '67')">
                                        전남
                                    </button>
                                </li>
                                <li>
                                    <button class="button-item" onclick="handleButtonClick('89', '91')">
                                        경북
                                    </button>
                                </li>
                                <li>
                                    <button class="button-item" onclick="handleButtonClick('91', '77')">
                                        경남
                                    </button>
                                </li>
                                <li>
                                    <button class="button-item" onclick="handleButtonClick('60', '120')">
                                        경기
                                    </button>
                                </li>
                                <li>
                                    <button class="button-item" onclick="handleButtonClick('68', '100')">
                                        충남
                                    </button>
                                </li>
                                <li>
                                    <button class="button-item" onclick="handleButtonClick('63', '89')">
                                        전북
                                    </button>
                                </li>
                                <li>
                                    <button class="button-item" onclick="handleButtonClick('98', '76')">
                                        부산
                                    </button>
                                </li>
                                <li>
                                    <button class="button-item" onclick="handleButtonClick('73', '134')">
                                        강원
                                    </button>
                                </li>
                                <li>
                                    <button class="button-item" onclick="handleButtonClick('55', '124')">
                                        인천
                                    </button>
                                </li>
                                <li>
                                    <button class="button-item" onclick="handleButtonClick('69', '107')">
                                        충북
                                    </button>
                                </li>
                                <li>
                                    <button class="button-item" onclick="handleButtonClick('89', '90')">
                                        대구
                                    </button>
                                </li>
                                <li>
                                    <button class="button-item" onclick="handleButtonClick('102', '84')">
                                        울산
                                    </button>
                                </li>
                                <li>
                                    <button class="button-item" onclick="handleButtonClick('52', '38')">
                                        제주
                                    </button>
                                </li>
                                <li>
                                    <button class="button-item" onclick="handleButtonClick('67', '100')">
                                        대전
                                    </button>
                                </li>
                                <li>
                                    <button class="button-item" onclick="handleButtonClick('58', '74')">
                                        광주
                                    </button>
                                </li>
                            </ul>
                    </div>
                </div>

                <!-- 오늘의 tmi -->
                <div class="today-tmi">
                    <label class="tmi-text">
                        <img class="free-img" src="/resources/images/weather/jong.png">오늘의 tmi
                    </label>
                    <!-- 자유게시판 이동 -->
                    <a class="free-board">
                        <img class="board-logo" src="/resources/images/weather/pet.png" alt="로고">
                        산책하개
                    </a>
                </div>

                <!-- 오늘의 날씨 -->
                <div class="today-weather">
                    <div class="today-left">
                        <!-- 오늘 날짜 -->
                        <div class="today-weather-date">
                            <div class="tDate"></div>
                        </div>
                        <!-- 기온 -->
                        <div class="today-weather-Temperature">
                            <div class="tIcon"></div> <span class="tTemp"></span>℃
                        </div>
                        <div class="img-area">
                            <img class="dog-img" src="/resources/images/weather/dog.png">
                        </div>
                    </div>

                    <div class="today-rigth">
                        <!-- 강수 확률 -->
                        <div id="pro-rain" class="today-info">
                            강수 확률 <span class="pro-rain"></span>%
                        </div>
                        <!-- 최고 기온 -->
                        <div id="temp-max" class="today-info">
                            최고 기온 <span class="temp-max"></span>℃
                        </div>
                        <!-- 최저 기온 -->
                        <div id="temp-min" class="today-info">
                            최저 기온 <span></span>
                            <span class="temp-min"></span>℃
                        </div>
                    </div>
                </div>

                <!-- 시간별 기온 -->
                <div class="time-weather">
                    <h2>시간별 기온</h2>
                </div>

                <!-- 일별 기온 -->
                <div class="date-weather">
                    <h2>일별 기온</h2>
                </div>
            </div>
        </main>

        <jsp:include page="../include/footer.jsp"></jsp:include>

        <script>
            // 지역 선택
            document.addEventListener("DOMContentLoaded", function () {
                const selectRegion = document.getElementById("select-region");
                selectRegion.textContent = "서울"; // 기본값으로 서울 설정
            });
            const selectRegion = document.getElementById("select-region");
            const buttons = document.querySelectorAll(".button-item");

            buttons.forEach(button => {
                button.addEventListener("click", () => {
                    // 모든 버튼에서 active 클래스를 제거
                    buttons.forEach(btn => {
                        btn.classList.remove("active");
                    });

                    // 클릭한 버튼에만 active 클래스 추가
                    button.classList.add("active");

                    const buttonText = button.textContent;
                    selectRegion.textContent = buttonText;
                });
            });

			// ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 기상청 api ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ //
			
			// 오늘 날짜 출력
            const $now = new Date($.now());
           	const $date = $now.getFullYear() + '년 ' + ($now.getMonth() + 1) +'월 ' + $now.getDate() +'일 ' +$now.getHours() + '시 ' + $now.getMinutes() + '분';
            $('.tDate').prepend($date);
            
			// API url - 날짜 형식 만들어두기
	        let date = new Date();
	        let year = date.getFullYear();          // 2023
	        let month = "0" + (date.getMonth() +1);
	        let month2 = month.substr(-2);          // 월
	        let day = "0" + date.getDate();
	        let day2 = day.substr(-2);              // 일
	        let initDate = year + month2 + day2;    // 오늘 날짜

			// ******************** time 메소드화 ********************//
			function getFormattedTime() {
			    const now = new Date();
			    const hours = String(now.getHours()).padStart(2, '0');
			    const minutes = String(now.getMinutes()).padStart(2, '0');
			    console.log("ft : " + hours + minutes);
			    return hours + minutes;
			}
			
			function calculateBaseTime(formattedTime, subtractMinutes) {
			    let base_time = "0" + (formattedTime - subtractMinutes);
			    console.log("bt : " +base_time);
			    console.log("bt : " +base_time.slice(-4));
			    return base_time.slice(-4);
			}
			
			// 사용 예
			const formattedTime = getFormattedTime();
			console.log("formattedTime:", formattedTime);
			
			let time = calculateBaseTime(formattedTime, 60);
			console.log("time:", time);
			// ******************** time 메소드화 ********************//
			
	
	        // parameter, serviceKey
	        let apiUrl = "https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst";
            const serviceKey = "4pYTUL0IAyNldYcuL1CFGcJpGrgPllaY%2BkD8xcBEHAbaLSA8xraNMsfHFO%2BXhGJmos%2FBszyn6LH7HoSBORAAhQ%3D%3D";
            const pageNo = "1";
            const numOfRows = "1000";
            const dataType = "JSON";
            let base_date = initDate;
            let nx = "60";
            let ny = "127";
//             let nx; // 격자 x 값
//             let ny; // 격자 y 값
            
			// 지역 선택(버튼 클릭)
			function handleButtonClick (nxValue, nyValue) {
				// 버튼 클릭 시 전달된 nxValue와 nyValue 값을 사용
		        console.log('버튼이 클릭되었습니다.');
		        console.log('nx:', nxValue);
		        console.log('ny:', nyValue);
		        
		        nx = nxValue;
		        ny = nyValue;
		        
		        weatherTemp(nx, ny);
		        weatherRain(nx, ny);
		        weatherTempMinMax(nx, ny);
		        weatherTime(nx, ny);
		        
				// 오늘 날짜 출력
	            const $now = new Date($.now());
	           	const $date = $now.getFullYear() + '년 ' + ($now.getMonth() + 1) +'월 ' + $now.getDate() +'일 ' +$now.getHours() + '시 ' + $now.getMinutes() + '분';
	            $('.tDate').empty().prepend($date);
			}
            
            // ************************************************ 초단기 실황(현재 온도) ************************************************//
            // !!!!!!!!!! 이거 시간 어떻게 계산해야할 지 강사님께 여쭤보기
//             let base_time = "0"+(formattedTime-60);	// 시간
//             base_time = base_time.slice(-4);
//             console.log(base_time);
        	weatherTemp('60', '127'); // 기본값 (서울)
        	weatherRain('60', '127');
        	weatherTempMinMax('60', '127');
        	weatherTime('60', '127');
        	
            function weatherTemp(nx, ny) {
            	apiUrl = "https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst";
            	
			    const formattedTime = getFormattedTime(); // 현재 시간을 가져옴
   				base_time = calculateBaseTime(formattedTime, 60);
				console.log("온도 베이스타임:" + base_time);
				
	            let url = apiUrl + "?serviceKey=" +  serviceKey + "&pageNo=" + pageNo + "&numOfRows=" + numOfRows + "&dataType=" + dataType + "&base_date=" + base_date + "&base_time=" + base_time + "&nx=" + nx + "&ny=" + ny;
	          	
	            console.log(url);  
	          	
	            $.getJSON (url, function(data){
		            const temp = data.response.body.items.item[3].obsrValue;
		            
// 		            $('.tTemp').append(temp);   // 현재 온도
		            $('.tTemp').empty().append(temp); // 현재 온도
		        });
            }
            
         	// ************************************************ 단기 예보(강수량) ************************************************//
         	// 단기 예보 시간 구하는 함수
			function getTimeByCondition(base_time) {
			    // base_time을 "HHMM" 형식의 문자열로 가정합니다.
			    // 문자열로 변환하고 앞에 0을 붙입니다.
			    const time = base_time.toString().padStart(4, '0');
			
			    if (time >= '0211' && time <= '0459') {
			        return "0200";
			    } else if (time >= '0511' && time <= '0810') {
			        return "0500";
			    } else if (time >= '0811' && time <= '1110') {
			        return "0800";
			    } else if (time >= '1111' && time <= '1410') {
			        return "1100";
			    } else if (time >= '1411' && time <= '1710') {
			        return "1400";
			    } else if (time >= '1711' && time <= '2010') {
			        return "1700";
			    } else if (time >= '2011' && time <= '2310') {
			        return "2000";
			    } else if ((time >= '2311' && time <= '2400') || (time >= '0000' && time <= '0200')) {
			        return "2300";
			    } else {
			        return "Unknown";
			    }
			}
			
			// ************************************************ 단기 예보(강수확률) ************************************************//
         	function weatherRain(nx, ny) {
         		
	         	apiUrl = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst";
	         	const formattedTime = getFormattedTime(); // 현재 시간을 가져옴
   				base_time = getTimeByCondition(calculateBaseTime(formattedTime, 60));
	         	console.log("강수확률 베이스타임:" + base_time);
				
				// 함수 호출하여 가져온 시간 문자열을 base_time에 넣음
// 				base_time = getTimeByCondition(base_time);
// 				console.log("강수확률 ="+base_time);
	         	
	         	// api url
	         	url = apiUrl + "?serviceKey=" +  serviceKey + "&pageNo=" + pageNo + "&numOfRows=" + numOfRows + "&dataType=" + dataType + "&base_date=" + base_date + "&base_time=" + base_time + "&nx=" + nx + "&ny=" + ny;
	         	console.log(url);
	         	
				$.getJSON (url, function(data){
					const probRain = data.response.body.items.item[7].fcstValue;
	// 				const tempMax = data.response.body.items.item[].fcstValue;
					console.log("강수확률: "+probRain);
					// 기존 강수 확률을 비우고 새로운 강수 확률을 표시
					$('.pro-rain').empty().append(probRain); // 강수 확률
				});
         	}
			
			// ************************************************ 단기 예보(최고/최저 기온) ************************************************//
			function weatherTempMinMax(nx, ny) {
				base_time = "0200";
				console.log("최고/최저 기온 베이스타임:" + base_time);
				apiUrl = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst";
				url = apiUrl + "?serviceKey=" +  serviceKey + "&pageNo=" + pageNo + "&numOfRows=" + numOfRows + "&dataType=" + dataType + "&base_date=" + base_date + "&base_time=" + base_time + "&nx=" + nx + "&ny=" + ny;
				console.log(base_time);
				console.log(url);
				$.getJSON (url, function(data){
					const tempMax = data.response.body.items.item[158].fcstValue;
					const tempMin = data.response.body.items.item[48].fcstValue;
					const roundedTempMax = Math.round(tempMax);
					const roundedTempMin = Math.round(tempMin);
					
					$('.temp-max').empty().append(roundedTempMax); // 최고 기온
					$('.temp-min').empty().append(roundedTempMin); // 최고 기온
				});
			}
			
			// ************************************************ 초단기 예보(일 시간별 기온) ************************************************//
			function weatherTime(nx, ny) {
			    const base_time = getFormattedTime(); // 기준시간
				console.log("시간별 베이스타임:" + base_time);
				apiUrl = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtFcst";
				
				// 시간대별 base_time
				if(base_time >= "1600" && base_time < "1700") {
					return "1600";
				}
				console.log("시간별 기온: "+base_time);
				url = apiUrl + "?serviceKey=" +  serviceKey + "&pageNo=" + pageNo + "&numOfRows=" + numOfRows + "&dataType=" + dataType + "&base_date=" + base_date + "&base_time=" + base_time + "&nx=" + nx + "&ny=" + ny;
			}
        </script>
    </body>
</html>