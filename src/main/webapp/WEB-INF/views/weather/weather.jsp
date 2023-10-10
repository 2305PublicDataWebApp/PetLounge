<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>산책 날씨 예보</title>
        <script src="http://code.jquery.com/jquery-1.7.min.js"></script>
        <link rel="stylesheet" href="/resources/css/weather/weather.css">
        <link rel="stylesheet" href="/resources/css/reset.css">
        <link rel="stylesheet" href="/resources/css/font.css">
    </head>
    <body>
        <header>
            
        </header>
        

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
                                    <button class="button-item active">
                                        서울
                                    </button>
                                </li>
                                <li>
                                    <button class="button-item">
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
                            <img src=""> <span class="tTemp"></span>℃
                        </div>
                        <div class="img-area">
                            <img class="dog-img" src="/resources/images/weather/dog.png">
                        </div>
                    </div>

                    <div class="today-rigth">
                        <!-- 강수 확률 -->
                        <div class="today-precipitation">
                            강수 확률 5%
                        </div>
                        <!-- 최고 기온 -->
                        <div class="">
                            최고 기온
                            <span class="tHightemp"></span>℃
                        </div>
                        <!-- 최저 기온 -->
                        <div>
                            최저 기온
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


        <footer>
            
        </footer>

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

            // 현재 날씨 정보 (서울)
        // 서울 현재 온도
        $.getJSON ('https://api.openweathermap.org/data/2.5/weather?id=1835848&appid=a5d1dc2dfcf28e0c9a351c9a21ef186f&units=metric', function(data){
            var $minTemp = data.main.temp_min;         // 최저 온도
            var $roundedLTemp = Math.round($minTemp);  // 최저 온도(반올림)
            var $maxTemp = data.main.temp_max;         // 최고 온도
            var $roundedHTemp = Math.round($maxTemp);  // 최고 온도(반올림)
            var $temp = data.main.temp;                // 현재 온도
            var $roundedTemp = Math.round($temp);      // 현재 온도(반올림)
            var $now = new Date($.now());              // 오늘 날짜
            var $date = $now.getFullYear() + '년 ' + ($now.getMonth() + 1) +'월 ' + $now.getDate() +'일 ' +$now.getHours() + '시 ' + $now.getMinutes() + '분';           // 오늘 날짜s
            var $wIcon = data.weather[0].icon;         // 날씨 아이콘

            $('.tLowtemp').append($roundedLTemp);
            $('.tHightemp').append($roundedHTemp);
            $('.tTemp').append($roundedTemp);
            $('.tDate').prepend($date);
            $('.tIcon').append('<img src="https://openweathermap.org/img/wn/' + $wIcon + '.png" />')
        });


        </script>
    </body>
</html>