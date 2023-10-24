<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
		<style>
        /* 모달 스타일 */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
        }
        .modal-content {
            background-color: white;
            width: 700px;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #ccc;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
        }
	</style>
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
				
				<div id="weather">
	                <section class="choice-area">
	                    <!-- 지역 선택 -->
	                    <div class="region-selector">
	                        <div id="region">
	                            <button class="select-button">지역</button>
	                            <p id="select-region"></p>
	                        </div>
	                        	<input type="hidden" id="addressInput" value="${ user.uAddr }">
	                            <ul class="region-list">
	                                <li>
	                                    <button class="button-item active" onclick="handleButtonClick('60', '127', 'Seoul')">
	                                        서울
	                                    </button>
	                                </li>
	                                <li>
	                                    <button class="button-item" onclick="handleButtonClick('66', '103', 'Sejong')">
	                                        세종
	                                    </button>
	                                </li>
	                                <li>
	                                    <button class="button-item" onclick="handleButtonClick('51', '67', 'Jeollanam-do')">
	                                        전남
	                                    </button>
	                                </li>
	                                <li>
	                                    <button class="button-item" onclick="handleButtonClick('89', '91', 'Gyeongsangbuk-do')">
	                                        경북
	                                    </button>
	                                </li>
	                                <li>
	                                    <button class="button-item" onclick="handleButtonClick('91', '77', 'Gyeongsangnam-do')">
	                                        경남
	                                    </button>
	                                </li>
	                                <li>
	                                    <button class="button-item" onclick="handleButtonClick('60', '120', 'Gyeonggi-do')">
	                                        경기
	                                    </button>
	                                </li>
	                                <li>
	                                    <button class="button-item" onclick="handleButtonClick('68', '100', 'Chungcheongnam-do')">
	                                        충남
	                                    </button>
	                                </li>
	                                <li>
	                                    <button class="button-item" onclick="handleButtonClick('63', '89', 'Jeollabuk-do')">
	                                        전북
	                                    </button>
	                                </li>
	                                <li>
	                                    <button class="button-item" onclick="handleButtonClick('98', '76', 'Busan')">
	                                        부산
	                                    </button>
	                                </li>
	                                <li>
	                                    <button class="button-item" onclick="handleButtonClick('73', '134', 'Gangwon-do')">
	                                        강원
	                                    </button>
	                                </li>
	                                <li>
	                                    <button class="button-item" onclick="handleButtonClick('55', '124', 'Incheon')">
	                                        인천
	                                    </button>
	                                </li>
	                                <li>
	                                    <button class="button-item" onclick="handleButtonClick('69', '107', 'Chungcheongbuk-do')">
	                                        충북
	                                    </button>
	                                </li>
	                                <li>
	                                    <button class="button-item" onclick="handleButtonClick('89', '90', 'Daegu')">
	                                        대구
	                                    </button>
	                                </li>
	                                <li>
	                                    <button class="button-item" onclick="handleButtonClick('102', '84', 'Ulsan')">
	                                        울산
	                                    </button>
	                                </li>
	                                <li>
	                                    <button class="button-item" onclick="handleButtonClick('52', '38', 'Jeju')">
	                                        제주
	                                    </button>
	                                </li>
	                                <li>
	                                    <button class="button-item" onclick="handleButtonClick('67', '100', 'Daejeon')">
	                                        대전
	                                    </button>
	                                </li>
	                                <li>
	                                    <button class="button-item" onclick="handleButtonClick('58', '74', 'Gwangju')">
	                                        광주
	                                    </button>
	                                </li>
	                            </ul>
	                    </div>
	                </section>
		                
					<!-- 버튼을 클릭하여 모달 창 열기 -->
					<!-- 모달 창 -->
					<c:if test="${ sessionScope.uId eq 'admin' }">
						<button type="button" id="modal-btn" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
						TMI 등록
						</button>
					</c:if>
					
					<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">펫 라운지 TMI</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<input type="text" name="tmiContent" id="tmiContent">
								</div>
								<div class="modal-footer">
									<div>
										<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
										<button type="button" class="btn btn-primary" id="add-tmi">추가하기</button>
									</div>
								</div>
								
								<!-- 이 부분에 리스트를 추가할 div -->
				                <div id="tmiListDiv">
				                    <ul id="tmiList">
				                    </ul>
				                </div>
				                
							</div>
						</div>
					</div>
					
	                <!-- 오늘의 tmi -->
	                <section class="today-tmi">
		                <div class="tmi-text">
							<img class="free-img" src="/resources/images/weather/jong.png">
							<div class="tmi" id="randomTmi">곧 tmi가 출력됩니다.</div>
		                </div>

						<div class="img-area">
						    <img class="dog-img" src="/resources/images/weather/dog.png">
						</div>
	                </section>
					
					<div class="weather-area">
						<section class="now-weather">
			                <!-- 오늘의 날씨 -->
			                <div class="today-weather-area">
		                        <!-- 오늘 날짜 -->
								<div class="tDate"></div>
				                <div class="today-weather">
				                    <div class="today-left">
				                        <!-- 기온 -->
				                        <div class="today-weather-Temperature">
				                        
				                        	<!-- 날씨 아이콘 동적으로 수정 예정 -->
				                        	
				                        	<!-- 날씨 아이콘 -->
				                        	<img id="weather-icon" src="../resources/images/weather/loading.gif" alt="날씨 아이콘">
											<div id="tIcon"></div>
				                            <span class="tTemp"></span>
				                        </div>
				                    </div>
				
				                    <div class="today-right">
				                        <!-- 강수 확률 -->
				                        <div id="pro-rain" class="today-info">
				                            강수 확률 <span class="pro-rain"></span>
				                        </div>
				                        <!-- 최고 기온 -->
				                        <div id="temp-max" class="today-info">
				                            최고 기온 <span class="temp-max"></span>
				                        </div>
				                        <!-- 최저 기온 -->
				                        <div id="temp-min" class="today-info">
				                            최저 기온 <span></span>
				                            <span class="temp-min"></span>
				                        </div>
				                    </div>
				                </div>
			                </div>
						</section>
			
		                <!-- 시간별 기온 -->
		                <section class="today-time-weather">
			                <div class="time-weather">
			                	<div>
				                    <h2>시간별 기온</h2>
			                	</div>
			                    <div class="time-temp">
			                    	<ul>
			                    		<!-- 0030, 0630, 1230, 1830 기준으로 6시간씩 출력 -->
										<c:forEach begin="0" end="5" varStatus="i">
				                    		<li>
				                    			<div class="time" id="weather${i.index }"></div>
				                    			<img class="time-icon" id="time-${i.index }-icon" src="../resources/images/weather/loading.gif" alt="날씨 아이콘">
				                    			<span class="time" id="time-today${i.index }"></span>
				                    		</li>
										</c:forEach>
			                    	</ul>
			                    </div>
			                </div>
		                </section>
					</div>
				</div>
                
<!-- 				**************** 움직이는 강아지 **************** -->
<!-- 				<div class="dog-area"> -->
<!-- 					<div class="dog"> -->
<!-- 						<img src="https://media1.giphy.com/media/Rk2vpkjp446amkIwIz/giphy.gif" alt="Corgi Cartoon Transparent / 1,572 corgi cartoons on gograph. - Lainey Love" class=" nofocus" tabindex="0" aria-label="Corgi Cartoon Transparent / 1,572 corgi cartoons on gograph. - Lainey Love" style="position: absolute; height: 100%; width: 100%; inset: 0px; margin: auto;" data-bm="77"> -->
<!-- 					</div> -->
<!-- 				</div> -->
				
                <!-- 일별 기온 -->
                <section class="day-weather">
	                <div class="date-weather">
	                    <h2>일별 기온</h2>
	                    <div class="date-temp">
		                    <ul>
		                    	<li>
				                    <div class="day-temp" id="day-temp-one">
				                    	<span id="today">오늘</span>
				                    	강수 확률 : 
				                    	<span class="day-text">오전</span> <span id="today-rain-am" class="today-rain"></span> 
				                    	<span class="day-text">오후</span> <span id="today-rain-pm" class="today-rain"></span><br>
				                    	최저 기온 : <span id="today-temp-min"></span> 최고 기온: <span id="today-temp-max"></span>
				                    </div>
		                    	</li>
		                    	<li>
				                    <div class="day-temp" id="day-temp-two">
				                    	<span id="tomorrow">내일</span>
				                    	강수 확률 : 
				                    	<span class="day-text">오전</span> <span id="tomorrow-rain-am" class="tomorrow-rain"></span> 
				                    	<span class="day-text">오후</span> <span id="tomorrow-rain-pm" class="tomorrow-rain"></span><br>
				                    	최저 기온 : <span id="tomorrow-temp-min"></span> 최고 기온: <span id="tomorrow-temp-max"></span>
				                    </div>
		                    	</li>
		                    	<li>
				                    <div class="day-temp" id="day-temp-three">
										<span id="aft-tomorrow"></span>
				                    	강수 확률 :
				                    	<span class="day-text">오전</span> <span id="aft-tomorrow-am" class="aft-tomorrow"></span> 
				                    	<span class="day-text">오후</span> <span id="aft-tomorrow-pm"  class="aft-tomorrow"></span><br>
				                    	최저 기온 : <span id="aft-tomorrow-temp-min"></span> 최고 기온: <span id="aft-tomorrow-temp-max"></span>
				                    </div>
		                    	</li>
		                    </ul>
	                    </div>
	                </div>
                </section>
                
				<!-- **************** 움직이는 강아지 **************** -->
				<div class="dog-area">
					<div class="dog">
						<img src="https://media1.giphy.com/media/Rk2vpkjp446amkIwIz/giphy.gif" alt="Corgi Cartoon Transparent / 1,572 corgi cartoons on gograph. - Lainey Love" class=" nofocus" tabindex="0" aria-label="Corgi Cartoon Transparent / 1,572 corgi cartoons on gograph. - Lainey Love" style="position: absolute; height: 100%; width: 100%; inset: 0px; margin: auto;" data-bm="77">
					</div>
				</div>
				
            </div>
        </main>

        <jsp:include page="../include/footer.jsp"></jsp:include>

        <script>        
            // 지역 선택
            document.addEventListener("DOMContentLoaded", function () {
            	
            	if(${sessionScope.uId != null}) {
					// 회원 주소를 기본값 설정
		        	const addressInput = document.getElementById("addressInput");
		        	const addressValue = addressInput.value;
		        	
		        	// 주소 앞 2글자 추출
		        	const firstTwoCharacters = addressValue.substring(0, 2);
		        	
		        	for (var i = 0; i < buttons.length; i++) {
		                var button = buttons[i];
		                var buttonText = button.textContent.trim().toLowerCase(); // 버튼 텍스트를 소문자로 변환
	                    buttons.forEach(function (btn) {
	                        btn.classList.remove("active");
	                    });
		                
		                // 버튼의 텍스트 내용과 주소 값이 같으면 버튼을 활성화
		                if (buttonText === firstTwoCharacters) {
	
		                    button.classList.add("active");
		                    const selectRegion = document.getElementById("select-region");
			                selectRegion.textContent = firstTwoCharacters;
		                    break; // 일치하는 버튼을 찾았으므로 루프 종료
		                } else {	// 고객 주소와 버튼 지역값이 동일하지 않다면
			                const selectRegion = document.getElementById("select-region");
			                selectRegion.textContent = "서울"; // 기본값으로 서울 설정
		                }
		            }
            	} else {
	                const selectRegion = document.getElementById("select-region");
	                selectRegion.textContent = "서울"; // 기본값으로 서울 설정
            	}
            	
            	// 버튼을 선택
            	const buttonToClick = document.querySelector(".button-item.active"); // .active 클래스를 가진 버튼 선택

            	if (buttonToClick) {
            	  // 버튼을 찾았을 경우 클릭 이벤트를 발생시킴
            	  buttonToClick.click();
            	}
            	// TMI 목록 불러오기
				$.ajax({
				    url: "/weather/show.pet", // TMI 목록을 가져올 URL
				    type: "GET",
				    success: function (result) {
				        const tmiList = $("#tmiList"); // UL 엘리먼트 선택
				        tmiList.empty(); // 기존 목록을 비웁니다.

				        // 서버에서 받은 JSON 응답을 파싱합니다.
				        const tmiArray = JSON.parse(result);

				        // tmiArray를 순회하며 목록을 업데이트합니다.
				        tmiArray.forEach(function (tmi) {
				            const listItem = $("<li>").text(tmi.tmiContent);
				            const deleteIcon = $("<span id='delete-icon' class='material-symbols-outlined delete-icon' data-tmino="+tmi.tmiNo+" style='color: rgb(255, 112, 112);'>delete_forever</span>");
			                // 삭제 아이콘을 리스트 아이템에 추가합니다.
			                listItem.append(deleteIcon);
				            tmiList.append(listItem);
				        });
				    },
				    error: function () {
				        alert("시스템 오류");
				    }
				});
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

			// ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 날씨 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ //
			
			// 오늘 날짜 출력
            const $now = new Date($.now());
           	const $date = $now.getFullYear() + '년 ' + ($now.getMonth() + 1) +'월 ' + $now.getDate() +'일 ' +$now.getHours() + '시 ' + $now.getMinutes() + '분';
            $('.tDate').prepend($date);
            
			// API url 날짜 형식 변수화
	        let date = new Date();
	        let year = date.getFullYear();
	        let month = "0" + (date.getMonth() +1);
	        let month2 = month.substr(-2);
	        let day = "0" + date.getDate();
	        let day2 = day.substr(-2);
	        let initDate = year + month2 + day2;    // 오늘 날짜
	        
	        // 아이콘 출력을 위해 강수확률 값 저장할 변수 선언
	        let rainValue = "";
	        
	        // 시간별 기온 시간의 시작값 계산을 위한 변수 선언
	        let checkHour = "";
	        
	        // API url, serviceKey, parameter 기본값
	        let apiUrl = "https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst";
            const serviceKey = "4pYTUL0IAyNldYcuL1CFGcJpGrgPllaY%2BkD8xcBEHAbaLSA8xraNMsfHFO%2BXhGJmos%2FBszyn6LH7HoSBORAAhQ%3D%3D";
            const pageNo = "1";
            const numOfRows = "1000";
            const dataType = "JSON";
            let base_date = initDate;
	        
			// base_time 형식 메소드화 ex. 0200
			function getFormattedTime() {
			    const now = new Date();										// 현재 시간
			    const hours = String(now.getHours()).padStart(2, '0');		// 왼쪽에 0을 채워넣어 2자리 문자열로 변환(시간)
			    const minutes = String(now.getMinutes()).padStart(2, '0');	// 왼쪽에 0을 채워넣어 2자리 문자열로 변환(분)
			    return hours + minutes;										// 현재 시간
			}
			
			// 지역 선택(버튼 클릭)
			function handleButtonClick (nxValue, nyValue, city) {
		        
		        nx = nxValue; // 버튼 누른 지역의 nx 값
		        ny = nyValue; // 버튼 누른 지역의 ny 값
		        city = city
		        
		        weatherTemp(nx, ny, city);	// 현재 온도
		        weatherTime(nx, ny);		// 오늘 시간별 기온
		        weatherDay(nx, ny);			// 일별 강수량/최저, 최대 온도
			}

			// api 출력 메소드 위치 기본값 세팅(서울)
        	weatherTemp('60', '127', 'Seoul');
        	weatherTime('60', '127');
        	weatherDay('60', '127');
            
            // ************************************************ 초단기 실황(현재 온도) ************************************************//
            // openweathermap.api
            function weatherTemp(nx, ny, city) {
            	apiUrl = "https://api.openweathermap.org/data/2.5/weather";
            	const apiKey = "a5d1dc2dfcf28e0c9a351c9a21ef186f";
	            const url = apiUrl + "?q=" +  city + "&appid=" + apiKey + "&units=metric";

	            $.getJSON (url, function(data){
// 	            	$("#load-icon").attr("src", "");
	            	const celsius = "℃";
	            	
	            	let iconUrl;
	            	formattedTime = getFormattedTime();
	            	
		            const $temp = data.main.temp; // 현재 온도 api 배열
		            const reounderTemp = Math.round($temp * 10) / 10;
		            
		            $('.tTemp').empty().append(reounderTemp).append(celsius); // 현재 온도
		        });
            }

			// ************************************************ 초단기 예보(일 시간별 기온) ************************************************//
			
			function weatherTime(nx, ny) {
				//baseTime은 0030, 0630, 1230, 1830
				base_date = initDate
				
				let formattedTime = getFormattedTime();
				
				if(formattedTime >= "0000" && formattedTime < "0700") {
					base_time = "0030";
				} else if(formattedTime >= "0700" && formattedTime < "1300") {
					base_time = "0630";
				} else if(formattedTime >= "1300" && formattedTime < "1900") {
					base_time = "1230";
				} else if(formattedTime >= "1900" && formattedTime <= "2359") {
					base_time = "1830";
				}

				apiUrl = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtFcst";
				url = apiUrl + "?serviceKey=" +  serviceKey + "&pageNo=" + pageNo + "&numOfRows=" + numOfRows + "&dataType=" + dataType + "&base_date=" + base_date + "&base_time=" + base_time + "&nx=" + nx + "&ny=" + ny;
				$.getJSON (url, function(data) {
					
					const celsius = "℃";
					
					let t1hData = new Array();
					data.response.body.items.item.map(function(tempData) {
						if(tempData.category === "T1H") {
							t1hData.push(tempData);
						}
					});
					
					let hourTime;
					// 시간이 현재 시간 기준으로 6시간 출력 됨.
					for(let i = 0; i < 6; i++) {
						const temp = t1hData[i].fcstValue;
						let hour = parseInt(formattedTime.substring(0,2));
						$("#weather"+i).empty().append(temp).append(celsius);
						
						if(hour > 0 && hour < 7) {
							hourTime = 1+i;
							$("#time-today"+i).text(hourTime+"시");
						} else if(hour >= 7 && hour < 13) {
							hourTime = 7+i;
							$("#time-today"+i).text(hourTime+"시");
						} else if(hour > 12 && hour < 19) {
							hourTime = 13+i
							$("#time-today"+i).text(hourTime+"시");
						} else if((hour > 18 && hour < 24) || hour == 0) {
							hourTime = 19+i
							$("#time-today"+i).text(hourTime+"시");
						}
					}
					checkHour = hourTime - 5;
					
				});
			}
			
			// ************************************************ 단기 예보(최고/최저기온, 강수량) ************************************************//
			
			function weatherDay(nx, ny) {
				
				let formattedTime = getFormattedTime();
				
				if(formattedTime >= "0000" && formattedTime < "0700") {
					base_time = "0030";
				} else if(formattedTime >= "0700" && formattedTime < "1300") {
					base_time = "0630";
				} else if(formattedTime >= "1300" && formattedTime < "1900") {
					base_time = "1230";
				} else if(formattedTime >= "1900" && formattedTime <= "2359") {
					base_time = "1830";
				}
				
				// 오늘 날짜 출력
	            const $now = new Date($.now());
	           	const $aftTomorrow =($now.getMonth() + 1) +'월 ' + ($now.getDate()+2) +'일 ';
	            $('#aft-tomorrow').empty().append($aftTomorrow);
	            
	            base_time="0200";
	            apiUrl = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst";
	            url = apiUrl + "?serviceKey=" +  serviceKey + "&pageNo=" + pageNo + "&numOfRows=" + numOfRows + "&dataType=" + dataType + "&base_date=" + base_date + "&base_time=" + base_time + "&nx=" + nx + "&ny=" + ny;

	            $.getJSON (url, function(data){ // 오후 3시 기준	
					const percentage = "%";
					const celsius = "℃";

					
					// 오전/오후 강수량만 가져오는 배열
					let popData = new Array();
					let tmxData = new Array();
					let tmnData = new Array();
					data.response.body.items.item.map(function(weatherData) {
						if(weatherData.category === "POP") {
							popData.push(weatherData);
						}else if(weatherData.category === "TMX") {
							tmxData.push(weatherData);
						}else if(weatherData.category === "TMN") {
							tmnData.push(weatherData);
						}
					});
					
					// 시간에 맞는 강수 확률
					formattedTime = getFormattedTime(); // 현재 시간
					let fcstTime = formattedTime.slice(0, -2) + "00"; // 예보 시간
					
					const fcstTimes = ['0300', '0400', '0500', '0600', '0700', '0800', '0900', '1000', '1100', '1200', '1300', '1400', '1500', '1600', '1700', '1800', '1900', '2000', '2100', '2200', '2300', '2400'];

					for (let i = 0; i < fcstTimes.length; i++) {
					  if (fcstTime === fcstTimes[i]) {
					    rainValue = popData[i].fcstValue; // 현재 강수량
					    break; // 일치하는 시간대를 찾으면 반복문을 종료
					  }
					}
					
					// 강수 확률
					const todayRainAm = popData[4].fcstValue;	  		 // 오늘 오전 7시 강수확률
					const todayRainPm = popData[15].fcstValue;	 		 // 오늘 오후 6시 강수확률
					const tomorrowRainAm = popData[28].fcstValue; 		 // 내일 오전 7시 강수확률
					const tomorrowRainPm = popData[39].fcstValue; 		 // 내일 오후 6시 강수확률
					const aftRainAm = popData[52].fcstValue;	  		 // 모레 오전 7시 강수확률
					const aftRainPm = popData[63].fcstValue;	 		 // 모레 오후 6시 강수확률
					
					// 최고 기온
					const nowTempMax = Math.round(tmxData[0].fcstValue); // 오늘 최고 기온
					const tmoTempMax = Math.round(tmxData[1].fcstValue); // 내일 최고 기온
					const aftTempMax = Math.round(tmxData[2].fcstValue); // 모레 최고 기온
					
					// 최저 기온
					const nowTempMin = Math.round(tmnData[0].fcstValue); // 오늘 최저 기온
					const tmoTempMin = Math.round(tmnData[1].fcstValue); // 내일 최저 기온
					const aftTempMin = Math.round(tmnData[2].fcstValue); // 모레 최저 기온
					
					$('.pro-rain').empty().append(rainValue).append(percentage); 			  // 지금 강수확률
					$('#today-rain-am').empty().append(todayRainAm).append(percentage);		  // 오늘 오전 강수확률
					$('#today-rain-pm').empty().append(todayRainPm).append(percentage);		  // 오늘 오후 강수확률
					$('#tomorrow-rain-am').empty().append(tomorrowRainAm).append(percentage); // 내일 오전 강수확률
					$('#tomorrow-rain-pm').empty().append(tomorrowRainPm).append(percentage); // 내일 오후 강수확률
					$('#aft-tomorrow-am').empty().append(aftRainAm).append(percentage);		  // 모레 오전 강수확률
					$('#aft-tomorrow-pm').empty().append(aftRainPm).append(percentage); 	  // 모레 오후 강수확률
					
					$('.temp-max').empty().append(nowTempMax).append(celsius); 				  // 오늘 최고 기온(지금 날씨)
					$('#today-temp-max').empty().append(nowTempMax).append(celsius);		  // 오늘 최고 기온(일별)
					$('#tomorrow-temp-max').empty().append(tmoTempMax).append(celsius);		  // 내일 최고 기온(일별)
					$('#aft-tomorrow-temp-max').empty().append(aftTempMax).append(celsius);	  // 모레 최고 기온(일별)
					
					$('.temp-min').empty().append(nowTempMin).append(celsius); 				  // 오늘 최저 기온(지금 날씨)
					$('#today-temp-min').empty().append(nowTempMin).append(celsius);		  // 오늘 최저 기온(일별)
					$('#tomorrow-temp-min').empty().append(tmoTempMin).append(celsius);		  // 내일 최저 기온(일별)
					$('#aft-tomorrow-temp-min').empty().append(aftTempMin).append(celsius);	  // 모레 최저 기온(일별)
					
					
					
					// ********************* 현재 날씨 아이콘 *********************
					if (rainValue == "0") {
						// 오전 7시부터 오후 5시까지는 해 이미지
						if(formattedTime >= "0700" && formattedTime < "1800") {
							$("#weather-icon").attr("src", "https://bmcdn.nl/assets/weather-icons/v3.0/fill/svg/clear-day.svg");
						// 오후 6시부터 다음 날 아침 6시까지는 달 이미지
						} else {
							$("#weather-icon").attr("src", "https://bmcdn.nl/assets/weather-icons/v3.0/fill/svg/clear-night.svg");
						}
					} else if (rainValue > "0" && rainValue < "30") {
						if(formattedTime >= "0700" && formattedTime < "1800") {
							$("#weather-icon").attr("src", "https://bmcdn.nl/assets/weather-icons/v3.0/fill/svg/partly-cloudy-day.svg");
						}else {
							$("#weather-icon").attr("src", "https://bmcdn.nl/assets/weather-icons/v3.0/fill/svg/partly-cloudy-night.svg");
						}
					} else if (rainValue >= "30") {
						if(formattedTime >= "0700" && formattedTime < "1800") {
							$("#weather-icon").attr("src", "https://bmcdn.nl/assets/weather-icons/v3.0/fill/svg/partly-cloudy-day-rain.svg");
						} else {
							$("#weather-icon").attr("src", "https://bmcdn.nl/assets/weather-icons/v3.0/fill/svg/partly-cloudy-night-rain.svg");
						}
					}
					
					
					// ********************* 시간별 날씨 아이콘 *********************
					let hour = parseInt(checkHour).toString().padStart(2, '0');
					for(let i = 0; i < 6; i++) {
						let newHour = (parseInt(hour) + i).toString().padStart(2, '0');
						let timeRainValue = "0";
						
						for (let j = 0; j < fcstTimes.length; j++) {
						  if ((newHour) + "00" === fcstTimes[j]) {
							  timeRainValue = popData[j].fcstValue; // 현재 강수량
						  }
						}
						
						// checkHour -> 기준시간 중 첫번째 시간
						// newHour -> hour를 for문을 돌릴 수 있도록 재가공
						
						if(timeRainValue == 0) {
							// 오전 7시부터 오후 5시까지는 해 이미지
							if(newHour >= 7 && newHour < 18) {
								$("#time-"+i+"-icon").attr("src", "https://bmcdn.nl/assets/weather-icons/v3.0/fill/svg/clear-day.svg");
							// 오후 6시부터 다음 날 아침 6시까지는 달 이미지
							} else {
								$("#time-"+i+"-icon").attr("src", "https://bmcdn.nl/assets/weather-icons/v3.0/fill/svg/clear-night.svg");
							}
						} else if (timeRainValue > "0" && timeRainValue < "30") {
							if(newHour >= 7 && newHour < 18) {
								$("#time-"+i+"-icon").attr("src", "https://bmcdn.nl/assets/weather-icons/v3.0/fill/svg/partly-cloudy-day.svg");
							} else {
								$("#time-"+i+"-icon").attr("src", "https://bmcdn.nl/assets/weather-icons/v3.0/fill/svg/partly-cloudy-night.svg");
							}
						} else if(timeRainValue >= "30") {
							if(newHour >= 7 && newHour < 18) {
								$("#time-"+i+"-icon").attr("src", "https://bmcdn.nl/assets/weather-icons/v3.0/fill/svg/partly-cloudy-day-rain.svg");
							} else {
								$("#time-"+i+"-icon").attr("src", "https://bmcdn.nl/assets/weather-icons/v3.0/fill/svg/partly-cloudy-night-rain.svg");
							}
						}
					}
				});
	            
	            
	            
	            // tmi 등록
	            const registerButton = $("#add-tmi");
				registerButton.on("click", function() {
	            	var tmiContent = $("#tmiContent").val();
	            	$.ajax({
	            		url : "/weather/insertTmi.pet",
	            		data : { tmiContent : tmiContent },
	            		type : "POST",
	            		success: function(result) {
	                        if (result == "success") {
	                            alert("TMI 등록 성공!");
	                            
	                            // TMI 등록 성공 시, 목록 새로고침
	                            refreshTmiList();
	                            
	                            $("#tmiContent").val("");

	                        } else {
	                            alert("TMI 등록 실패!");
	                        }
	                    },
	                    error: function() {
	                        alert("시스템 오류");
	                    }
	            	});
	            });
				
				// TMI 목록 불러오기
				function refreshTmiList() {
					
					$.ajax({
					    url: "/weather/show.pet", // TMI 목록을 가져올 URL
					    type: "GET",
					    success: function (result) {
					        // 서버에서 받은 JSON 응답을 파싱합니다.
					        const tmiArray = JSON.parse(result);
	
					        const tmiListDiv = $("#tmiList");
					        tmiListDiv.empty();
					        // tmiArray를 순회하며 목록을 업데이트합니다.
					        tmiArray.forEach(function (tmi) {
					            const listItem = $("<li>").text(tmi.tmiContent);
					            const deleteIcon = $("<span id='delete-icon' class='material-symbols-outlined delete-icon' data-tmino="+tmi.tmiNo+" style='color: rgb(255, 112, 112);'>delete_forever</span>");
				                
				                // 삭제 아이콘을 리스트 아이템에 추가합니다.
				                listItem.append(deleteIcon);

				                // 리스트 아이템을 목록에 추가합니다.
				                tmiListDiv.append(listItem);
					        });
					    },
					    error: function () {
					        alert("시스템 오류");
					    }
					});
					
				}
				// TMI 삭제하기
				$(document).on("click", ".delete-icon", function() {
					const listItem = $(this).closest("li"); // 클릭한 아이콘의 부모 리스트 아이템을 가져옴
					const tmiNo = $(this).data("tmino"); // TMI 항목의 고유 ID를 데이터 속성으로 가져옴
					
					$.ajax({
						url: "/weather/deleteTmi.pet",
						type: "POST",
						data: { tmiNo: tmiNo }, // 삭제할 TMI 항목의 ID를 서버에 전달
						success: function(result) {
							if(result === "success") {
								alert("TMI 항목 삭제 성공!");
								listItem.remove();	// 항목 삭제
								refreshTmiList();	// 목록 새로고침
							} else {
								alert("TMI 항목 삭제 실패!");
							}
						},
						error: function() {
							alert("시스템 오류");
						}
					});
				});
				
	 		setInterval(function() {
				$.ajax({
					url : "/weather/randomTmi.pet",
					type : "get",
					dataType : "json",
					success : function(data) {
						$("#randomTmi").text(data.tmiContent);
					},
					error : function() {
						alert("관리자에게 문의바랍니다.");
					}
				})
				
			}, 5000);



				
			}

        </script>
        <script type="text/javascript" src="../resources/js/weather/tmi.js"></script>
    </body>
</html>