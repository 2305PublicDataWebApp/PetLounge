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
                <p class="main-title-name">통계 관리</p>
                <hr class="line5">
            </div>
            <div class="sub-title2">
                <p class="sub-title-name2">가입자수 통계</p>
            </div>
            <div class="sub-title2">
                <p class="sub-title-name2">후원금액 통계(월별)</p>
            </div>
            <div class="sub-title2">
                <p class="sub-title-name2">후원 순위</p>
            </div>
            <div id="notice">
                <ul>
                    <table>
                        <colgroup>
                            <col width="10%">
                            <col width="60%">
                            <col width="30%">
                        </colgroup>
                        <thead>
                            <tr>
                                <th>순위</th>
                                <th>닉네임</th>
                                <th>후원금액</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td colspan="5"><hr class="line3-1"></td>
                            </tr>
                            <tr>
                                <td class="right2">1</td>
                                <td class="right1" style="text-align: center;">사이다</td>
                                <td class="right2">10,322,000</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">2</td>
                                <td class="right1" style="text-align: center;">여울이</td>
                                <td class="right2">5,810,000</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">3</td>
                                <td class="right1" style="text-align: center;">클레오</td>
                                <td class="right2">3,520,000</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">4</td>
                                <td class="right1" style="text-align: center;">스피카</td>
                                <td class="right2">1,125,000</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">5</td>
                                <td class="right1" style="text-align: center;">뽀야미</td>
                                <td class="right2">580,000</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                        </tbody>
                    </table>
                </ul>
            </div>
            <div class="sub-title2">
                <p class="sub-title-name2">병원 순위(리뷰)</p>
            </div>
            <div id="notice">
                <ul>
                    <table>
                        <colgroup>
                            <col width="10%">
                            <col width="60%">
                            <col width="30%">
                        </colgroup>
                        <thead>
                            <tr>
                                <th>순위</th>
                                <th>이름</th>
                                <th>리뷰 수</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td colspan="5"><hr class="line3-1"></td>
                            </tr>
                            <tr>
                                <td class="right2">1</td>
                                <td class="right1" style="text-align: center;">가로수동물병원</td>
                                <td class="right2">270</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">2</td>
                                <td class="right1" style="text-align: center;">케어덴동물병원</td>
                                <td class="right2">222</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">3</td>
                                <td class="right1" style="text-align: center;">그레이스동물병원</td>
                                <td class="right2">180</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">4</td>
                                <td class="right1" style="text-align: center;">메이트동물병원</td>
                                <td class="right2">132</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">5</td>
                                <td class="right1" style="text-align: center;">커비동물병원</td>
                                <td class="right2">105</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                        </tbody>
                    </table>
                </ul>
            </div>
            <div class="sub-title2">
                <p class="sub-title-name2">병원 순위(좋아요)</p>
            </div>
            <div id="notice">
                <ul>
                    <table>
                        <colgroup>
                            <col width="10%">
                            <col width="60%">
                            <col width="30%">
                        </colgroup>
                        <thead>
                            <tr>
                                <th>순위</th>
                                <th>이름</th>
                                <th>좋아요</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td colspan="5"><hr class="line3-1"></td>
                            </tr>
                            <tr>
                                <td class="right2">1</td>
                                <td class="right1" style="text-align: center;">가로수동물병원</td>
                                <td class="right2">100</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">2</td>
                                <td class="right1" style="text-align: center;">케어덴동물병원</td>
                                <td class="right2">80</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">3</td>
                                <td class="right1" style="text-align: center;">그레이스동물병원</td>
                                <td class="right2">60</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">4</td>
                                <td class="right1" style="text-align: center;">메이트동물병원</td>
                                <td class="right2">40</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">5</td>
                                <td class="right1" style="text-align: center;">커비동물병원</td>
                                <td class="right2">20</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                        </tbody>
                    </table>
                </ul>
            </div>
    </div>



    </body>
    </html>
    
    
    