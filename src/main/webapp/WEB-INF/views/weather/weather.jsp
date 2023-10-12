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
                                    <button id="seoul" class="button-item active">
                                        서울
                                    </button>
                                </li>
                                <li>
                                    <button id="sejong" class="button-item">
                                        세종
                                    </button>
                                </li>
                                <li>
                                    <button class="button-item">
                                        전남
                                    </button>
                                </li>
                                <li>
                                    <button class="button-item">
                                        경북
                                    </button>
                                </li>
                                <li>
                                    <button class="button-item">
                                        경남
                                    </button>
                                </li>
                                <li>
                                    <button class="button-item">
                                        경기
                                    </button>
                                </li>
                                <li>
                                    <button class="button-item">
                                        충남
                                    </button>
                                </li>
                                <li>
                                    <button class="button-item">
                                        전북
                                    </button>
                                </li>
                                <li>
                                    <button class="button-item">
                                        부산
                                    </button>
                                </li>
                                <li>
                                    <button class="button-item">
                                        강원
                                    </button>
                                </li>
                                <li>
                                    <button class="button-item">
                                        인천
                                    </button>
                                </li>
                                <li>
                                    <button class="button-item">
                                        충북
                                    </button>
                                </li>
                                <li>
                                    <button class="button-item">
                                        대구
                                    </button>
                                </li>
                                <li>
                                    <button class="button-item">
                                        울산
                                    </button>
                                </li>
                                <li>
                                    <button class="button-item">
                                        제주
                                    </button>
                                </li>
                                <li>
                                    <button class="button-item">
                                        대전
                                    </button>
                                </li>
                                <li>
                                    <button class="button-item">
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
                        <div class="today-info">
                            강수 확률<span></span>
                        </div>
                        <!-- 최고 기온 -->
                        <div class="">
                            최고 기온<span></span>
                            <span class="tHightemp"></span>℃
                        </div>
                        <!-- 최저 기온 -->
                        <div>
                            최저 기온<span></span>
                            <span class="tLowtemp"></span>℃
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
			// 오늘 날짜
	        let date = new Date();
	        let year = date.getFullYear();          // 2023
	        let month = "0" + (date.getMonth() +1);
	        let month2 = month.substr(-2);          // 월
	        let day = "0" + date.getDate();
	        let day2 = day.substr(-2);              // 일
	        let initDate = year + month2 + day2;    // 오늘 날짜
// 	        console.log(initDate);
	
	        // 현재 시간
	        const now = new Date();
	        const hours = String(now.getHours()).padStart(2, '0');
	        const minutes = String(now.getMinutes()).padStart(2, '0');
	     	// base_time이 정시 이후일 경우 40분에 api 시간이 제공되기 때문에 
	     	// 정시 이후부터 40분 이전까지의 시간의 날씨를 제공하기 위해 시간에 오차를 줌
	        const formattedTime = (hours + minutes)-50;  
	        console.log(formattedTime); 
	
	        // parameter, serviceKey
	        let apiUrl1 = "https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst";
            const serviceKey = "4pYTUL0IAyNldYcuL1CFGcJpGrgPllaY%2BkD8xcBEHAbaLSA8xraNMsfHFO%2BXhGJmos%2FBszyn6LH7HoSBORAAhQ%3D%3D";
            const pageNo = "1";
            const numOfRows = "1000";
            const dataType = "JSON";
            let base_date = initDate;
            let base_time = formattedTime;
            let nx = "60";
            let ny = "127";
            apiUrl1 += "?serviceKey=" +  serviceKey + "&pageNo=" + pageNo + "&numOfRows=" + numOfRows + "&dataType=" + dataType + "&base_date=" + base_date + "&base_time=" + base_time + "&nx=" + nx + "&ny=" + ny;
          	console.log(apiUrl1);  
            // ************************************************ 초단기 실황(현재 온도) ************************************************//
            $.getJSON (apiUrl1, function(data){
	            const $now = new Date($.now());
            	const $date = $now.getFullYear() + '년 ' + ($now.getMonth() + 1) +'월 ' + $now.getDate() +'일 ' +$now.getHours() + '시 ' + $now.getMinutes() + '분';
				
	            const temp = data.response.body.items.item[3].obsrValue;
	            $('.tDate').prepend($date); // 오늘 날짜
	            $('.tTemp').append(temp);   // 현재 온도
	        });
            
         // ************************************************ 단기 예보(강수량, 최고/최저 기온, ) ************************************************//
         	let apiUrl2 = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst";
         	apiUrl2 += "?serviceKey=" +  serviceKey + "&pageNo=" + pageNo + "&numOfRows=" + numOfRows + "&dataType=" + dataType + "&base_date=" + base_date + "&base_time=" + base_time + "&nx=" + nx + "&ny=" + ny;
         	console.log(apiUrl2);
			$.getJSON (apiUrl2, function(data){
				const probRain = data.response.body.items.item[7].fcstValue;
				console.log(probRain);
			});
        </script>
    </body>
</html>