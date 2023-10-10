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
        }

        header {
            width: 100%;
            height: 60px;
            background: #ffd370;
            position: fixed;
            z-index: 1000;
        }
        
        #line {
        width: 60%;
        height: 1.5px;
        background-color: lightgray;
        margin: 20px auto 60px auto;
        }

        #line2 {
        width: 100%;
        height: 1px;
        background-color: lightgray;
        margin: 0px auto 12px auto;
        }

        .custom-main {
		height: auto;
		}

        h2 {
        text-align: center;
        margin-top: 0; 
        margin-bottom: 10px;
        color: #505D68;
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

        #notice ul {
            width: 100%;
        }
        #notice ul li {
            line-height: 50px; /* li 세로 간격 */
            font-family: Pretendard;
            font-style: normal;
            letter-spacing: -0.02em;
        }
        #notice ul li span {
            display: block;
            float: right;
            width: 63px;
            text-align: center;
            font-family: Pretendard;
            font-style: normal;
            letter-spacing: -0.02em;
            color: rgb(205, 209, 217);
            font-size: 14px;
        }
        
        /* #notice ul p {
            color: #505D68;
            font-weight: bold;
            display: block;
            float: left;
            margin: 0;
            margin-left: 10px;
        } */
        .square-container {
            max-width: 800px;
            border: 3px solid #ffd370;
            margin: 0 auto;
            padding: 50px 50px 70px 50px;
        }

        .pagination {
            display: flex;
            list-style: none;
            padding: 0;
            justify-content: center;
            padding: 20px 0 0 0;
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

        .search-container {
            position: fixed;
            left: calc(50% - 900px / 2);
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

        hr {
            display: block;
            unicode-bidi: isolate;
            margin-block-start: 0.5em;
            margin-block-end: 0.5em;
            margin-inline-start: auto;
            margin-inline-end: auto;
            overflow: hidden;
            border-style: inset;
            border-width: 1px;
        }
        .line3 {
            border-width: 0;
            border-style: solid;
            border-color: rgba(145, 158, 171, 0.24);
            border-bottom-width: thin;
                }

        .pagination li a {
            line-height: 1.85714;
            font-size: 0.875rem;
            font-family: Pretendard, sans-serif;
        }
        .pagination li.Mui-selected {
            font-weight: 700;
        }

        .sub {
            position: fixed;
            left: calc(50% - -660px / 2);            
        }
        .submit {
            background-color: #ffd370;
            border: 2px solid;
            color: #ffffff;
            padding: 5px 5px;
            font-size: 13px;
            border-radius: 7px;
            width: 120px;
            margin-top: 40px;
            font-weight: bold;
            font-family: Pretendard;
            letter-spacing: -0.02em;    
        }

        .header-row {
            color: #505D68;
            font-weight: bold;            
        }

        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            padding: 8px;
            line-height: 10px; /* li 세로 간격 */
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
        </style>
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard-dynamic-subset.css" />
    </head>
    <body>
        <header>
        </header>

        <main class="custom-main">
        <br><br><br><br>
        <h2>자유게시판</h2>
        <div id="line"></div>

        <div class="square-container">
            <div id="notice">
                <ul>
                    <table>
                        <colgroup>
                            <col width="7%">
                            <col width="50%">
                            <col width="15%">
                            <col width="15%">
                            <col width="15%">
                        </colgroup>
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>제목</th>
                                <th>닉네임</th>
                                <th>작성일</th>
                                <th>조회수</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">1</td>
                                <td class="right1" style="text-align: left;">자유1</td>
                                <td class="right2">사이다</td>
                                <td class="right2">2023.10.03</td>
                                <td class="right2">12</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">2</td>
                                <td class="right1" style="text-align: left;">자유2</td>
                                <td class="right2">여울이</td>
                                <td class="right2">2023.10.03</td>
                                <td class="right2">8</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">3</td>
                                <td class="right1" style="text-align: left;">자유3</td>
                                <td class="right2">귀오미</td>
                                <td class="right2">2023.10.03</td>
                                <td class="right2">21</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">4</td>
                                <td class="right1" style="text-align: left;">자유4</td>
                                <td class="right2">모니카</td>
                                <td class="right2">2023.10.03</td>
                                <td class="right2">11</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">5</td>
                                <td class="right1" style="text-align: left;">자유5</td>
                                <td class="right2">스피카</td>
                                <td class="right2">2023.10.03</td>
                                <td class="right2">17</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">6</td>
                                <td class="right1" style="text-align: left;">자유6</td>
                                <td class="right2">뽀야미</td>
                                <td class="right2">2023.10.03</td>
                                <td class="right2">6</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                        </tbody>
                    </table>
                </ul>
            </div>
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
                <div class="sub">
                    <button class="submit">글쓰기</button>
                </div>
            </div>

        </main>
    </body>
    </html>
    
    
    