<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
        body {
        height: 100%;
        margin: 0;
        padding: 0;
        display: flex;
        flex-direction: row;
        }

        header {
            width: 100%;
            height: 60px;
            background: #ffd370;
            position: fixed;
            z-index: 1000;
        }
        
        a {
            text-decoration: none;
            color: #505D68;
        }

        li {
            list-style: none;
        }

        ul {
        padding-inline-start: 0px;
        }


        /* 왼쪽 메뉴 바 스타일 설정 */
        .menu {
            width: 250px;
            height: 800px;
            background-color: #fff;
            color: #ffffff; /* 텍스트 색상 설정 */
            padding: 20px; /* 여백 설정 */
            margin-top: 60px;
        }

        .menu .sub-menu {
            list-style: none;
            padding: 0px;
        }

        .menu .sub-menu > li {
            display: flex;
            flex-direction: column;
            cursor: pointer;
            padding: 20px 0px;
        }

        .menu .sub-menu > li .m-name {
            display: flex;
            gap: 15px;
            font-family: Pretendard;
            font-style: normal;
            letter-spacing: -0.02em;
            text-align: center;
        }

        .m-container {
            width: 140px;
            border: 2px solid black;
            border-radius: 10px;
            padding: 20px;
            margin-top: 20px;
        }

        .m-name {
            justify-content: center;
        }

        .sub-title {
            /* display: flex; */
            flex-direction: column;
            align-items: center;
            text-align: center;
            margin-top: 10px;
            min-height: 20px;
        }
        .sub-title-name {
            color: black;
            margin: 0;
            font-family: Pretendard;
            font-style: normal;
            letter-spacing: -0.02em;
            text-align: center;
            font-size: 20px;
            font-weight: bold;
        }

        .line4 {
            border: none;
            border-top: 3px solid black;
            width: 70%;
            margin: 10px auto;
        }
        /* 오른쪽 메인 화면 스타일 설정 */
        .main {
            flex: 1; /* 남은 공간을 차지하도록 설정 */
            padding: 20px; /* 여백 설정 */
            margin-top: 60px;
        }

        .square-container {
            max-width: 800px;
            border: none;
            margin: 0;
            padding: 50px 50px 70px 50px;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 30px;
        }
        th, td {
            padding: 0 0 12px 0;
            line-height: 0px; /* li 세로 간격 */
            font-family: Pretendard;
            font-style: normal;
            letter-spacing: -0.02em;
            text-align: center;
        }
        .right1 {
            color: #505D68;            
        }
        .right2 {
            font-family: Pretendard;
            font-style: normal;
            letter-spacing: -0.02em;
            color: rgb(184, 186, 190);
            font-size: 16px;            
        }
        .main-title-name {
            color: black;
            margin: 0;
            font-family: Pretendard;
            font-style: normal;
            letter-spacing: -0.02em;
            text-align: right;
            font-size: 22px;
            font-weight: bold;
        }

        .line5 {
            border: none;
            border-top: 3px solid black;
            width: 100%;
            margin: 10px auto;
        }

        .line3 {
            border-width: 0;
            border-style: solid;
            border-color: rgba(145, 158, 171, 0.24);
            border-bottom-width: thin;
                }

        .line3-1 {
            border-width: 0;
            border-top: 2px solid;
            border-color: rgba(145, 158, 171, 0.24);
            border-bottom-width: thin;
                }
                
        .sub-title2 {
            border: 1px solid #ffd370;
            width: 100%;
            height: 30px;
            margin-top: 30px;
        }
        .sub-title-name2 {
            margin: 0;
            font-family: Pretendard;
            font-style: normal;
            letter-spacing: -0.02em;
            color: rgb(184, 186, 190);
            font-size: 18px; 
            margin-top: 5px;
            margin-left: 10px;
        }

        .pagination {
            display: flex;
            list-style: none;
            padding: 0;
            justify-content: center;
            padding: 0px 0 0 0;
            margin: 0;
        }

        .pagination li {
            margin-right: 10px;
            color: #505D68;
            margin-top: auto;
            margin-bottom: auto;
        }

        .pagination li:last-child {
            background-color: #ffffff;
            border: 2px solid #ffd370;
            color: #ffd370;
            padding: 3px;
            font-size: 12px;
            border-radius: 5px;
        }

        .pagination li a {
            line-height: 1.85714;
            font-size: 0.875rem;
            font-family: Pretendard, sans-serif;
        }
        .pagination li.Mui-selected {
            font-weight: 700;
        }
        .page {
            margin-top: 0px;
        }

        .search-container {
            position: relative;
            /* left: calc(50% - -200px / 2); */
            display: flex;
            align-items: flex-end;
            justify-content: center;
            width: 250px;
            margin-left: auto;
            margin-right: auto;
            gap: 10px;
            margin-top: 20px;
            margin-bottom: 20px;
        }
        .search-input {
            flex: 1;
            border: 1.5px solid #e2e2e2;
            padding: 3px;
            font-size: 15px;
            width: 70%;
            outline: none;
        }
        .search-button1 {
            background-color: #ffd370;
            border: 2px solid;
            color: #ffffff;
            padding: 5px 5px;
            font-size: 14px;
            border-radius: 10px;
            width: 150px;
            font-weight: bold;
        }
        .search-button2 {
            background-color: #ffffff;
            border: 2px solid;
            color: #ffd370;
            padding: 5px 5px;
            font-size: 14px;
            border-radius: 10px;
            width: 150px;
            font-weight: bold;
        }

        .user-img {
            margin: 0;
        }
        .user-img img{
            width: 50px;
            height: 50px;
            border-radius: 40px;
            margin-right: 5px;
            display: inline-block;
        }

        .addphoto {
            background-color: #ffffff;
            border: 2px solid;
            color: #ffd370;
            padding: 5px 5px;
            font-size: 12px;
            border-radius: 7px;
            width: 70px;
            font-weight: bold;
            font-family: Pretendard;
            letter-spacing: -0.02em;   
        }
        .address {
            background-color: #ffffff;
            border: 2px solid;
            color: #ffd370;
            padding: 5px 5px;
            font-size: 12px;
            border-radius: 7px;
            width: 70px;
            font-weight: bold;
            font-family: Pretendard;
            letter-spacing: -0.02em;   
            margin-left: 10px;
        }
        </style>
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard-dynamic-subset.css" />
    </head>
    <body>
        <header>
        </header>

    <!-- 왼쪽 메뉴 바 -->
    <div class="menu">
        <div class="m-container">
            <div class="sub-title">
                <p class="sub-title-name">관리자페이지</p>
                <hr class="line4">
            </div>
            <ul class="sub-menu">
                <li class="menu-item">
                    <div>
                    <span>
                    </span>  
                    <span class="m-name">
                        <a href="#">통계 관리</a>
                    </span>
                    </div>
                </li>
                <li class="menu-item">
                    <div>
                    <span></span>  
                    <span class="m-name">
                        <a href="#">회원 관리</a>
                    </span>
                    </div>
                </li>
                <li class="menu-item">
                    <div>
                    <span></span>  
                    <span class="m-name">
                        <a href="#">후원 관리</a>
                    </span>
                    </div>
                </li>
                <li class="menu-item">
                    <div>
                    <span></span>  
                    <span class="m-name">
                        <a href="#">게시판 관리</a>
                    </span>
                    </div>
                </li>
            </ul>
        </div>
    </div>

    <!-- 오른쪽 메인 화면 -->
    <div class="main">
        <div class="square-container">
            <div class="sub-title">
                <p class="main-title-name">회원 관리</p>
                <hr class="line5">
            </div>
            <div class="sub-title2">
                <p class="sub-title-name2">회원 정보 수정</p>
            </div>
            <div id="notice">
                <ul>
                    <table>
                        <colgroup>
                            <col width="25%">
                            <col width="75%">
                        </colgroup>
                        <thead>
                            <tr>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <!-- <td colspan="5"><hr class="line3-1"></td> -->
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">아이디</td>
                                <td class="right1" style="text-align: left;"><input type="text" class="search-input" placeholder="khuser01"></td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">이름</td>
                                <td class="right1" style="text-align: left;"><input type="text" class="search-input" placeholder="김이름"></td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">닉네임</td>
                                <td class="right1" style="text-align: left;"><input type="text" class="search-input" placeholder="여행가고싶다"></td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">이메일</td>
                                <td class="right1" style="text-align: left;"><input type="text" class="search-input" placeholder="user01@naver.com"></td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">휴대폰</td>
                                <td class="right1" style="text-align: left;"><input type="text" class="search-input" placeholder="010-7293-2193"></td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">주소</td>
                                <td class="right1" style="text-align: left;"><input type="text" class="search-input" placeholder="서울특별시 중구 남대문로 120 그레이츠 청계"><button class="address">주소등록</button></td>                                
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">프로필 사진</td>
                                <td class="right1" style="text-align: left;">
                                    <div class="user-img">
                                        <img alt="유저 프로필 이미지" src="../../resources/img/board/user_sample.png">
                                        <button class="addphoto">사진등록</button>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                        </tbody>
                    </table>
                </ul>
            </div>
            <div class="search-container">
                <button class="search-button1">수정하기</button>
            </div>
    </div>



    </body>
    </html>
    
    
    