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
                    <label for="tmi" class="tmi-text">
                        <img class="free-img" src="/resources/images/weather/jong.png">그거 아시개?
	                    <input type="text" id="tmi" readonly>
                    </label>
                    <!-- 자유게시판 이동 -->
                    <a class="free-board" href="/board/free_list.pet">
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
                    <div class="time-temp">
                    	<ul>
                    		<li>
                    			<div class="time" id="time-01"></div>
                    			<div class="time">^^</div>
                    			<span class="time">1시</span>
                    		</li>
                    		<li>
                    			<div class="time" id="time-02"></div>
                    			<div class="time">^^</div>
                    			<span class="time">2시</span>
                    		</li>
                    		<li>
                    			<div class="time" id="time-03"></div>
                    			<div class="time">^^</div>
                    			<span class="time">3시</span>
                    		</li>
                    		<li>
                    			<div class="time" id="time-04"></div>
                    			<div class="time">^^</div>
                    			<span class="time">4시</span>
                    		</li>
                    		<li>
                    			<div class="time" id="time-05"></div>
                    			<div class="time">^^</div>
                    			<span class="time">5시</span>
                    		</li>
                    		<li>
                    			<div class="time" id="time-06"></div>
                    			<div class="time">^^</div>
                    			<span class="time">6시</span>
                    		</li>
                    		<li>
                    			<div class="time" id="time-07"></div>
                    			<div class="time">^^</div>
                    			<span class="time">7시</span>
                    		</li>
                    		<li>
                    			<div class="time" id="time-08"></div>
                    			<div class="time">^^</div>
                    			<span class="time">8시</span>
                    		</li>
                    		<li>
                    			<div class="time" id="time-09"></div>
                    			<div class="time">^^</div>
                    			<span class="time">9시</span>
                    		</li>
                    		<li>
                    			<div class="time" id="time-10"></div>
                    			<div class="time">^^</div>
                    			<span class="time">10시</span>
                    		</li>
                    		<li>
                    			<div class="time" id="time-11"></div>
                    			<div class="time">^^</div>
                    			<span class="time">11시</span>
                    		</li>
                    		<li>
                    			<div class="time" id="time-12"></div>
                    			<div class="time">^^</div>
                    			<span class="time">12시</span>
                    		</li>
                    		<li>
                    			<div class="time" id="time-13"></div>
                    			<div class="time">^^</div>
                    			<span class="time">13시</span>
                    		</li>
                    		<li>
                    			<div class="time" id="time-14"></div>
                    			<div class="time">^^</div>
                    			<span class="time">14시</span>
                    		</li>
                    		<li>
                    			<div class="time" id="time-15"></div>
                    			<div class="time">^^</div>
                    			<span class="time">15시</span>
                    		</li>
                    		<li>
                    			<div class="time" id="time-16"></div>
                    			<div class="time">^^</div>
                    			<span class="time">16시</span>
                    		</li>
                    		<li>
                    			<div class="time" id="time-17"></div>
                    			<div class="time">^^</div>
                    			<span class="time">17시</span>
                    		</li>
                    		<li>
                    			<div class="time" id="time-18"></div>
                    			<div class="time">^^</div>
                    			<span class="time">18시</span>
                    		</li>
                    		<li>
                    			<div class="time" id="time-19"></div>
                    			<div class="time">^^</div>
                    			<span class="time">19시</span>
                    		</li>
                    		<li>
                    			<div class="time" id="time-20"></div>
                    			<div class="time">^^</div>
                    			<span class="time">20시</span>
                    		</li>
                    		<li>
                    			<div class="time" id="time-21"></div>
                    			<div class="time">^^</div>
                    			<span class="time">21시</span>
                    		</li>
                    		<li>
                    			<div class="time" id="time-22"></div>
                    			<div class="time">^^</div>
                    			<span class="time">22시</span>
                    		</li>
                    		<li>
                    			<div class="time" id="time-23"></div>
                    			<div class="time">^^</div>
                    			<span class="time">23시</span>
                    		</li>
                    		<li>
                    			<div class="time" id="time-24"></div>
                    			<div class="time">^^</div>
                    			<span class="time">0시</span>
                    		</li>
                    	</ul>
                    </div>
                </div>
				
                <!-- 일별 기온 -->
                <div class="date-weather">
                    <h2>일별 기온</h2>
                    <div class="date-temp">
	                    <ul>
	                    	<li>
			                    <div class="day-temp" id="day-temp-one">
			                    	<span id="today">오늘 </span>
			                    	강수 확률 : <span id="today-rain"></span><br>
			                    	최저 기온 : <span id="today-temp-min"></span> 최고 기온: <span id="today-temp-max"></span>
			                    </div>
		                        <img class="day-dog1" src="/resources/images/weather/day-dog1.png">
	                    	</li>
	                    	<li>
			                    <div class="day-temp" id="day-temp-two">
			                    	<span id="tomorrow">내일 </span>
			                    	강수 확률 : <span id="tomorrow-rain"></span><br>
			                    	최저 기온 : <span id="tomorrow-temp-min"></span> 최고 기온: <span id="tomorrow-temp-max"></span>
			                    </div>
			                    <img class="day-dog2" src="/resources/images/weather/day-dog2.png">
	                    	</li>
	                    	<li>
			                    <div class="day-temp" id="day-temp-three">
			                    	<span id="aft-tomorrow">모레 </span>
			                    	강수 확률 : <span id="aft-tomorrow-rain"></span><br>
			                    	최저 기온 : <span id="aft-tomorrow-temp-min"></span> 최고 기온: <span id="aft-tomorrow-temp-max"></span>
			                    </div>
			                    <img class="day-dog3" src="/resources/images/weather/day-dog3.png">
	                    	</li>
	                    </ul>
                    </div>
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
            
            // tmi 출력
            // 랜덤 문장 배열
			const randomSentences = [
				"개과 동물 중 멍멍하는건 개밖에 없다.",
			    "개도 터널등을 지날 때 귀가 멍멍해진다.",
			    "개는 똥을 쌀 때 지구 자기장 축 방향에 맞춰 싼다.",
			    "개들은 자기와 비슷한 음역대를 가진 음악을 좋아한다고 한다.",
			    "강아지는 냄새로 시간을 느낀다.",
			    "개는 뒷다리 구조 상 발가락으로 걸어다닌다.",
			    "개가 등을 보여주는건 신뢰한다는 의미이다.",
			    "개가 견주의 몸에 다리를 올리는 해동은 우위의식을 뜻한다.",
			    "개의 시력은 0.3정도이다.",
			    "개는 평균족으로 150~200개의 단어를 기억할 수 있다.",
			    "개들도 스트레스를 받으면 새치가 난다.",
			    "안겨있는 개각 손을 핥는 이유는 놔달라는 부탁의 뜻이다.",
			    "개가 긴장했을 때 주인이 심호흡을 하면 긴장완화 효과가 있다.",
			    "고음은 개를 움직이게 하고 저음은 멈추게 한다.",
			    "겁이 많은 개에게는 느리게 행동해주는 것이 좋다.",
			    "인기 있는 반려견 이름 1위는 코코다.",
			    "개도 가끔 주인을 못알아본다!",
			    "털이 곱슬인 말티즈가 은근히 많다.",
			    "개는 일광욕을 즐긴다.",
			    "고양이에게는 유당의 소화를 돕는 효소가 없다.",
			    "고양이가 살짝 깨무는 것은 애정표현이다.",
			    "고양이는 안전하고 편안한 곳에서만 식빵을 굽는다.",
			    "고양이의 스크래쳐에는 반가움과 애정의 표현도 담겨있다.",
			    "고양이가 집사에게 엉덩이를 들이대는 것은 애정표현이다.",
			    "개가 달달 떠는 것은 대부분 스트레스 때문이다.",
			    "개도 스트레스 받으면 탈모가 온다.",
			    "고양이들은 주인의 해동을 관찰해 배운다.",
			    "고양이는 자기 키의 5배 높게 점프할 수 있다.",
			    "고양이는 입으로도 냄새를 맡을 수 있다.",
			    "고양이의 눈 색깔은 성장하며 변한다.",
			    "고양이의 단기기억력은 15분이다.",
			    "고양이는 발자국이 일렬도 찍힌다.",
			    "고양이는 그루밍을 통해 체온을 조절 한다.",
			    "햄스터의 앞니는 평생동안 자라서 견과류로 이갈이를 해줘야 한다.",
			    "햄스터는 당황하면 똥오줌을 싼다.",
			    "햄스터는 새가슴이라 잘 놀란다.",
			    "햄스터는 한 케이지당 한마리만 키워야 한다.",
			    "햄스터에서 말리지 않은 과일을 먹이면 설사를 유발한다.",
			    "햄스터는 나이를 먹을수록 귀가 커진다.",
			    "토끼는 성대가 퇴화되어, 코와 목의 울림으로 소리를 낸다.",
			    "토끼는 점프할 때 꼬리로 균형을 잡는다.",
			    "토끼는 매우 미식가이고, 편식이 심하다.",
			    "토끼는 1시간에 10~20회 정도 깜빡인다.",
			    "토끼는 양쪽 귀를 따로 움직일 수 있다.",
			    "고양이는 유대를 표현하기 위해 서로 꼬리를 감는다.",
			    "강이지의 코는 사람의 지문처럼 다 다르게 생겼다.",
			    "고양이는 머쓱하면 그루밍을 하기도 한다.",
			    "토끼는 기분이 좋으면 엉덩이를 씰룩거린다.",
			    "강아지는 밥주는 사람보다 산책 시켜주는 사람을 더 좋아한다."
			];
			
			// input 엘리먼트 찾기
			const tmiInput = document.getElementById("tmi");
			
			// 랜덤 문장 선택
			const randomIndex = Math.floor(Math.random() * randomSentences.length);
			const randomSentence = randomSentences[randomIndex];
			
			// input 값에 랜덤 문장 설정
			tmiInput.value = randomSentence;

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
		        weatherDay(nx, ny);
		        
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
        	weatherDay('60', '127');
        	
            function weatherTemp(nx, ny) {
            	apiUrl = "https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst";
            	
			    const formattedTime = getFormattedTime(); // 현재 시간을 가져옴
   				base_time = calculateBaseTime(formattedTime, 60);
				console.log("온도 베이스타임:" + base_time);
				
	            let url = apiUrl + "?serviceKey=" +  serviceKey + "&pageNo=" + pageNo + "&numOfRows=" + numOfRows + "&dataType=" + dataType + "&base_date=" + base_date + "&base_time=" + base_time + "&nx=" + nx + "&ny=" + ny;
	          	
	            console.log("현재온도 url" + url);  
	          	
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
			
			// ************************************************ 초단기 예보(일 시간별 기온) ************************************************//
			function getTimeByUltraShort(base_time) {
				
				const time = base_time.toString().padStart(4, '0');
				
				if(time >= "0030" && time <= "0130") {
					return "0030";
				} else if(time >= "0130" && time < "0230") {
					return "0130";
				} else if(time >= "0230" && time < "0330") {
					return "0230";0
				} else if(time >= "0330" && time < "0430") {
					return "0330";
				} else if(time >= "0430" && time < "0530") {
					return "0430";
				} else if(time >= "0530" && time < "0630") {
					return "0530";
				} else if(time >= "0630" && time < "0730") {
					return "0630"
				} else if(time >= "0730" && time < "0830") {
					return "0730";
				} else if(time >= "0830" && time < "0930") {
					return "0830";
				} else if(time >= "0930" && time < "1030") {
					return "0930";
				} else if(time >= "1030" && time < "1130") {
					return "1030";
				} else if(time >= "1130" && time < "1230") {
					return "1130";
				} else if(time >= "1230" && time < "1330") {
					return "1230";
				} else if(time >= "1330" && time < "1430") {
					return "1330";
				} else if(time >= "1430" && time < "1530") {
					return "1430";
				} else if(time >= "1530" && time < "1630") {
					return "1530";
				} else if(time >= "1630" && time < "1730") {
					return "1630";
				} else if(time >= "1730" && time < "1830") {
					return "1730";
				} else if(time >= "1830" && time < "1930") {
					return "1830";
				} else if(time >= "1930" && time < "2030") {
					return "1930";
				} else if(time >= "2030" && time < "2130") {
					return "2030";
				} else if(time >= "2130" && time < "2230") {
					return "2130";
				} else if(time >= "2230" && time < "2330") {
					return "2230";
				} else if((time >= "2330" && time < "2339") || time >= 0000 && time < 0030) {
					return "2330";
				} else {
					return "Unknown";
				}
			}
			
			// ************************************************ 단기 예보(강수확률) ************************************************//
         	function weatherRain(nx, ny) {
         		
	         	apiUrl = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst";
				base_time="0200";
				
	         	// api url
	         	url = apiUrl + "?serviceKey=" +  serviceKey + "&pageNo=" + pageNo + "&numOfRows=" + numOfRows + "&dataType=" + dataType + "&base_date=" + base_date + "&base_time=" + base_time + "&nx=" + nx + "&ny=" + ny;
// 	         	console.log("강수확률 url : " + url);
	         	
				$.getJSON (url, function(data){
					const probRain = data.response.body.items.item[152].fcstValue;
// 					console.log(data.response.body.items.item[152]);
// 					console.log("강수확률: "+probRain);
					
					$('.pro-rain').empty().append(probRain); // 강수 확률
				});
         	}
			
			// ************************************************ 단기 예보(최고/최저 기온) ************************************************//
			function weatherTempMinMax(nx, ny) {
				base_time = "0200";
				console.log("최고/최저 기온 베이스타임:" + base_time);
				apiUrl = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst";
				url = apiUrl + "?serviceKey=" +  serviceKey + "&pageNo=" + pageNo + "&numOfRows=" + numOfRows + "&dataType=" + dataType + "&base_date=" + base_date + "&base_time=" + base_time + "&nx=" + nx + "&ny=" + ny;
// 				console.log(base_time);
				console.log("최고/최저온도 url" + url);
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
// 				const formattedTime = getFormattedTime(); // 현재 시간을 가져옴
				base_time = "0030"
	         	console.log("일 시간별 / 기준시간:" + base_time);
				
				apiUrl = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtFcst";
				
				url = apiUrl + "?serviceKey=" +  serviceKey + "&pageNo=" + pageNo + "&numOfRows=" + numOfRows + "&dataType=" + dataType + "&base_date=" + base_date + "&base_time=" + base_time + "&nx=" + nx + "&ny=" + ny;
				console.log("일 시간별 url : " + url);
				
				$.getJSON (url, function(data){
					const celsius = "℃";
					
					const tempOne = data.response.body.items.item[24].fcstValue	 // 01:00
					const tempTwo = data.response.body.items.item[25].fcstValue	 // 02:00
					const tempThr = data.response.body.items.item[26].fcstValue	 // 03:00
					const tempFour = data.response.body.items.item[27].fcstValue // 04:00
					const tempFive = data.response.body.items.item[28].fcstValue // 05:00
					const tempSix = data.response.body.items.item[29].fcstValue	 // 06:00
					
					$('#time-01').empty().append(tempOne).append(celsius);
					$('#time-02').empty().append(tempTwo).append(celsius);
					$('#time-03').empty().append(tempThr).append(celsius);
					$('#time-04').empty().append(tempFour).append(celsius);
					$('#time-05').empty().append(tempFive).append(celsius);
					$('#time-06').empty().append(tempSix).append(celsius);
				});
				
				base_time = "0630"
				apiUrl = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtFcst";
				url = apiUrl + "?serviceKey=" +  serviceKey + "&pageNo=" + pageNo + "&numOfRows=" + numOfRows + "&dataType=" + dataType + "&base_date=" + base_date + "&base_time=" + base_time + "&nx=" + nx + "&ny=" + ny;
				
				$.getJSON (url, function(data){
					const celsius = "℃";
					const tempSev = data.response.body.items.item[24].fcstValue	 // 07:00
					const tempEig = data.response.body.items.item[25].fcstValue	 // 08:00
					const tempNine = data.response.body.items.item[25].fcstValue // 09:00
					const tempTen = data.response.body.items.item[26].fcstValue  // 10:00
					const tempEle = data.response.body.items.item[27].fcstValue	 // 11:00
					const tempTwe = data.response.body.items.item[28].fcstValue	 // 12:00
					console.log(data.response.body.items.item[28]);
					
					$('#time-07').empty().append(tempSev).append(celsius);
					$('#time-08').empty().append(tempEig).append(celsius);
					$('#time-09').empty().append(tempNine).append(celsius);
					$('#time-10').empty().append(tempTen).append(celsius);
					$('#time-11').empty().append(tempEle).append(celsius);
					$('#time-12').empty().append(tempTwe).append(celsius);
				});
				
				base_time = "0730"
				apiUrl = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtFcst";
				url = apiUrl + "?serviceKey=" +  serviceKey + "&pageNo=" + pageNo + "&numOfRows=" + numOfRows + "&dataType=" + dataType + "&base_date=" + base_date + "&base_time=" + base_time + "&nx=" + nx + "&ny=" + ny;
				
				$.getJSON (url, function(data){
					const celsius = "℃";
					const tempThi = data.response.body.items.item[24].fcstValue	 	 // 13:00
					const tempFou = data.response.body.items.item[25].fcstValue	 	 // 14:00
					const tempFif = data.response.body.items.item[25].fcstValue 	 // 15:00
					const tempSixteen = data.response.body.items.item[26].fcstValue  // 16:00
					const tempSeven = data.response.body.items.item[27].fcstValue	 // 17:00
					const tempEigh = data.response.body.items.item[28].fcstValue	 // 18:00
					console.log(data.response.body.items.item[28]);
					
					$('#time-13').empty().append(tempThi).append(celsius);
					$('#time-14').empty().append(tempFou).append(celsius);
					$('#time-15').empty().append(tempFif).append(celsius);
					$('#time-16').empty().append(tempSixteen).append(celsius);
					$('#time-17').empty().append(tempSeven).append(celsius);
					$('#time-18').empty().append(tempEigh).append(celsius);
				});
				
				base_time = "1830"
				apiUrl = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtFcst";
				url = apiUrl + "?serviceKey=" +  serviceKey + "&pageNo=" + pageNo + "&numOfRows=" + numOfRows + "&dataType=" + dataType + "&base_date=" + base_date + "&base_time=" + base_time + "&nx=" + nx + "&ny=" + ny;
				
				$.getJSON (url, function(data){
					const celsius = "℃";
					const tempNineteen = data.response.body.items.item[24].fcstValue	// 19:00
					const tempTwenty = data.response.body.items.item[25].fcstValue		// 20:00
					const tempTwentyOne = data.response.body.items.item[25].fcstValue	// 21:00
					const tempTwentyTwo = data.response.body.items.item[26].fcstValue	// 22:00
					const tempTwentyThr = data.response.body.items.item[27].fcstValue	// 23:00
					const tempTwentyFour = data.response.body.items.item[28].fcstValue	// 00:00
					console.log(data.response.body.items.item[28]);
					
					$('#time-19').empty().append(tempNineteen).append(celsius);
					$('#time-20').empty().append(tempTwenty).append(celsius);
					$('#time-21').empty().append(tempTwentyOne).append(celsius);
					$('#time-22').empty().append(tempTwentyTwo).append(celsius);
					$('#time-23').empty().append(tempTwentyThr).append(celsius);
					$('#time-24').empty().append(tempTwentyFour).append(celsius);
				});
			}
			
			// 시간대별 온도 추가해야함.
			
			// ************************************************ 단기 예보(일별 기온) ************************************************//
			function weatherDay(nx, ny) {
				// 오늘 날짜 출력
	            const $now = new Date($.now());
// 	           	const $today =($now.getMonth() + 1) +'월 ' + $now.getDate() +'일 ';
// 	           	const $tomorrow =($now.getMonth() + 1) +'월 ' + ($now.getDate()+1) +'일 ';
	           	const $aftTomorrow =($now.getMonth() + 1) +'월 ' + ($now.getDate()+2) +'일 ';
// 	            $('#today').empty().append($today);
// 	            $('#tomorrow').empty().append($tomorrow);
	            $('#aft-tomorrow').empty().append($aftTomorrow);
	            console.log($date);
	            
	            base_time="0200";
	            apiUrl = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst";
	            url = apiUrl + "?serviceKey=" +  serviceKey + "&pageNo=" + pageNo + "&numOfRows=" + numOfRows + "&dataType=" + dataType + "&base_date=" + base_date + "&base_time=" + base_time + "&nx=" + nx + "&ny=" + ny;
				console.log("일별 url : " + url);
				
				$.getJSON (url, function(data){ // 오후 3시 기준	
					const percentage = "%";
					const celsius = "℃";
				
				
					const todayRain = data.response.body.items.item[152].fcstValue    		 // 오늘 강수량
					const tomorrowRain = data.response.body.items.item[442].fcstValue		 // 내일 강수량
					const afterTomorrowRain = data.response.body.items.item[732].fcstValue   // 모레 강수량
					const todayTempN = data.response.body.items.item[48].fcstValue   		 
					const todayTempMin = Math.round(todayTempN);							 // 오늘 최저기온
					const todayTempM = data.response.body.items.item[157].fcstValue   		 
					const todayTempMax = Math.round(todayTempM);							 // 오늘 최고기온
					const tomorrowTempN = data.response.body.items.item[338].fcstValue   		 
					const tomorrowTempMin = Math.round(tomorrowTempN);						 // 내일 최저기온
					const tomorrowTempM = data.response.body.items.item[447].fcstValue   		 
					const tomorrowTempMax = Math.round(tomorrowTempM);						 // 내일 최고기온
					const aftTomorrowTempN = data.response.body.items.item[628].fcstValue   		 
					const aftTomorrowTempMin = Math.round(aftTomorrowTempN);				 // 모레 최저기온
					const aftTomorrowTempM = data.response.body.items.item[737].fcstValue   		 
					const aftTomorrowTempMax = Math.round(aftTomorrowTempM);				 // 모레 최고기온
					
					$('#today-rain').empty().append(todayRain).append(percentage);
					$('#tomorrow-rain').empty().append(tomorrowRain).append(percentage);
					$('#aft-tomorrow-rain').empty().append(afterTomorrowRain).append(percentage);
					$('#today-temp-min').empty().append(todayTempMin).append(celsius);
					$('#today-temp-max').empty().append(todayTempMax).append(celsius);
					$('#tomorrow-temp-min').empty().append(tomorrowTempMin).append(celsius);
					$('#tomorrow-temp-max').empty().append(tomorrowTempMax).append(celsius);
					$('#aft-tomorrow-temp-min').empty().append(aftTomorrowTempMin).append(celsius);
					$('#aft-tomorrow-temp-max').empty().append(aftTomorrowTempMax).append(celsius);
				});
			}
			
        </script>
    </body>
</html>