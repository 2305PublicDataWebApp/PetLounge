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
            padding: 8px;
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
            justify-content: space-between;
            width: 250px;
            margin-left: auto;
            gap: 10px;
            margin-top: 20px;
            margin-bottom: 20px;
        }
        .search-input {
            flex: 1;
            border: 2px solid #ffd370;
            padding: 3px;
            font-size: 15px;
        }
        .search-button {
            background-color: #ffffff;
            border: 2px solid;
            color: #ffd370;
            padding: 5px 5px;
            font-size: 12px;
            border-radius: 15%;
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
                <p class="sub-title-name2">회원 목록 조회</p>
            </div>
            <div id="notice">
                <ul>
                    <table>
                        <colgroup>
                            <col width="10%">
                            <col width="20%">
                            <col width="15%">
                            <col width="20%">
                            <col width="20%">
                        </colgroup>
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>아이디</th>
                                <th>이름</th>
                                <th>닉네임</th>
                                <th>휴대폰</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td colspan="5"><hr class="line3-1"></td>
                            </tr>
                            <tr>
                                <td class="right2">1</td>
                                <td class="right1" style="text-align: center;">user01</td>
                                <td class="right1">김이름</td>
                                <td class="right1">여행가고싶다</td>
                                <td class="right1">01072932193</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">2</td>
                                <td class="right1" style="text-align: center;">user02</td>
                                <td class="right1">이용자</td>
                                <td class="right1">이용자</td>
                                <td class="right1">01023125888</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">3</td>
                                <td class="right1" style="text-align: center;">user03</td>
                                <td class="right1">삼용자</td>
                                <td class="right1">삼용자</td>
                                <td class="right1">01020205587</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">4</td>
                                <td class="right1" style="text-align: center;">user04</td>
                                <td class="right1">사용자</td>
                                <td class="right1">사용자</td>
                                <td class="right1">01055489657</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">5</td>
                                <td class="right1" style="text-align: center;">user05</td>
                                <td class="right1">오용자</td>
                                <td class="right1">오용자</td>
                                <td class="right1">01032125557</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                        </tbody>
                    </table>
                </ul>
            </div>
            <div class="page">
                <ul class="pagination">
                    <li class="Mui-selected"><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li><a href="#">다음</a></li>
                </ul>
            </div>
            <div class="search-container">
                <input type="text" class="search-input">
                <button class="search-button">검색</button>
            </div>
    </div>



    </body>
    </html>
    
    
    