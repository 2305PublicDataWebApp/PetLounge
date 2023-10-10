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
            line-height: 40px; /* li 세로 간격 */
        }
        /* #notice ul li span {
            display: block;
            float: right;
            width: 150px;
            text-align: center;
            color: #505D68;
        } */
        
        .square-container {
            max-width: 600px;
            border: 3px solid #ffd370;
            margin: 0 auto;
            padding: 15px 50px 30px 50px;
        }
        .square-container2 {
            max-width: 600px;
            border: none;
            margin: 0 auto;
            padding: 15px 50px 30px 50px;
        }
        .square-container3 {
            max-width: 600px;
            border: none;
            margin: 0 auto;
            padding: 15px 20px 30px 20px;
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
        }

        .pagination li:last-child {
            background-color: #ffffff;
            border: 2px solid #ffd370;
            color: #ffd370;
            padding: 2px;
            font-size: 13px;
        }

        .search-container {
            position: relative;
            /* left: calc(50% - 100px / 2); */
            display: flex;
            align-items: flex-end;
            justify-content: center;
            width: 450px;
            margin-left: 200px;
            margin-right: auto;
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
        .backtolist {
            background-color: #ffffff;
            border: 2px solid;
            color: #ffd370;
            padding: 5px 5px;
            font-size: 12px;
            border-radius: 7px;
            width: 250px;
            font-weight: bold;
            font-family: Pretendard;
            letter-spacing: -0.02em;   
        }
        .bookmark {
            background-color: #ffffff;
            border: 2px solid;
            color: #ffd370;
            padding: 5px 5px;
            font-size: 12px;
            border-radius: 7px;
            width: 250px;
            font-weight: bold;
            font-family: Pretendard;
            letter-spacing: -0.02em;   
        }
        .sub {
            display: flex;
            align-items: flex-end;
            justify-content: center;
            width: 250px;
            margin-left: auto;
            margin-right: auto;
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
            margin-top: auto;
            margin-right: 5px;
        }

        input[type="text"] {
            border : 1px solid #ffd370;
            outline: none;
        }
        input[type="text"]::placeholder {
            font-size: 16px;
            font-weight: bold;
            font-family: Pretendard;
            letter-spacing: -0.02em;
            color: rgb(98, 99, 100);
        }

        .notice-title {
            width: 99%;
            height: 25px;            
        }
        .notice-content {
            width: 99%;
            height: 300px;
            border : 1px solid #ffd370;
            outline: none;
        }
        .notice-content::placeholder {
            font-size: 14px;
            font-weight: bold;
            font-family: Pretendard;
            letter-spacing: -0.02em;
            color: rgb(153, 150, 150);
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
        .user-img span {
            display: inline-block;
            vertical-align: 23px;
            color: #505D68;
            font-size: 14px;
            font-weight: bold;
            font-family: Pretendard;
        }
        .menu .info span {
            margin: 0;
            display: block;
            float: left;
            text-align: center;
            font-family: Pretendard;
            font-style: normal;
            letter-spacing: -0.02em;
            color: rgb(184, 186, 190);
            font-size: 14px;     
        }
        .user-info {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .menu .info {
            display: flex;
            justify-content: flex-end;
        }
        .menu span:nth-child(1) {
            margin-right: 10px;
        }
        .reply-container {
            display: flex;
            align-items: center;
            margin-top: 20px;
            margin-bottom: 20px;
            justify-content: center;
            gap: 15px;
        }
        .reply-container .reply-input {
            background-color: #f7f4f4;
            width: 600px;
            height: 50px;
            border: none;
            outline: none;
        }
        .reply-container .submit2 {
            background-color: #ffd370;
            border: none;
            padding: 10px 20px;
            border-radius: 10px;
            font-size: 16px;
            font-weight: bold;
            font-family: Pretendard;
            letter-spacing: -0.02em;    
            color:#ffffff;
        }

        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            padding: 2 px;
            line-height: 1px; /* li 세로 간격 */
            font-family: Pretendard;
            font-style: normal;
            letter-spacing: -0.02em;
            text-align: center;
        }

        .right1 {
            color: #505D68;    
            font-size: 14px;   
            font-weight: bold;     
            text-align: left;  
            white-space: pre-line;
            line-height: 0.8;
        }
        .right1 span:nth-child(2) {
            font-family: Pretendard;
            font-style: normal;
            letter-spacing: -0.02em;
            color: rgb(184, 186, 190);
            font-size: 13px;      
        }
        .right1 span:nth-child(3) {
            font-family: Pretendard;
            font-style: normal;
            letter-spacing: -0.02em;
            color: rgb(154, 154, 156);
            font-size: 12px;      
        }
        .right2 {
            font-family: Pretendard;
            font-style: normal;
            letter-spacing: -0.02em;
            color: rgb(154, 154, 156);
            font-size: 12px;      
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
        </style>
        <link rel="stylesheet" href="/resources/css/reset.css">
        <link rel="stylesheet" href="/resources/css/font.css">
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
                    <li><input type="text" class="notice-title" placeholder="자유1"></li>
                    <li class="user-info">
                        <div class="user-img">
                            <img alt="유저 프로필 이미지" src="../../resources/img/board/user_sample.png">
                            <span>사이다</span>
                        </div>
                        <div class="menu">
                            <div class="info">
                                <span>2023.10.01</span>
                                <span>조회수 0</span>
                            </div>
                        </div> 
                    </li>
                    <li><textarea id="textarea" class="notice-content" placeholder="자유11111"></textarea></li>
                </ul>
            </div>
        </div>
        <div class="square-container2">
            <div class="search-container"> 
                <div class="sub">
                    <button class="submit">수정하기</button>
                    <button class="submit">삭제하기</button>
                </div>
                <button class="bookmark">북마크하기</button>
                <button class="backtolist">목록으로</button>
            </div>
        </div>
        <div class="reply-container">
            <textarea class="reply-input"></textarea>
            <button class="submit2">등록</button>
        </div>

        <div class="square-container3">
            <div id="notice">
                <ul>
                    <table>
                        <colgroup>
                            <col width="7%">
                            <col width="70%">
                            <col width="15%">
                        </colgroup>
                        <thead>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="right2">
                                    <div class="user-img">
                                        <img alt="유저 프로필 이미지" src="../../resources/img/board/user_sample.png">
                                    </div>
                                </td>
                                <td class="right1" style="text-align: left;">
                                    <span>동숲주민</span><span> 2023.10.01</span><span> 답글</span><br>
                                    <span>리뷰 내용</span>
                                </td>
                                <td class="right2">
                                    <span>수정</span><span> 삭제</span>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">
                                    <div class="user-img">
                                        <img alt="유저 프로필 이미지" src="../../resources/img/board/user_sample.png">
                                    </div>
                                </td>
                                <td class="right1" style="text-align: left;">
                                    <span>동숲주민</span><span> 2023.10.01</span><span> 답글</span><br>
                                    <span>리뷰 내용</span>
                                </td>
                                <td class="right2">
                                    <span>수정</span><span> 삭제</span>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">
                                    <div class="user-img">
                                        <img alt="유저 프로필 이미지" src="../../resources/img/board/user_sample.png">
                                    </div>
                                </td>
                                <td class="right1" style="text-align: left;">
                                    <span>동숲주민</span><span> 2023.10.01</span><span> 답글</span><br>
                                    <span>리뷰 내용</span>
                                </td>
                                <td class="right2">
                                    <span>수정</span><span> 삭제</span>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">
                                    <div class="user-img">
                                        <img alt="유저 프로필 이미지" src="../../resources/img/board/user_sample.png">
                                    </div>
                                </td>
                                <td class="right1" style="text-align: left;">
                                    <span>동숲주민</span><span> 2023.10.01</span><span> 답글</span><br>
                                    <span>리뷰 내용</span>
                                </td>
                                <td class="right2">
                                    <span>수정</span><span> 삭제</span>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">
                                    <div class="user-img">
                                        <img alt="유저 프로필 이미지" src="../../resources/img/board/user_sample.png">
                                    </div>
                                </td>
                                <td class="right1" style="text-align: left;">
                                    <span>동숲주민</span><span> 2023.10.01</span><span> 답글</span><br>
                                    <span>리뷰 내용</span>
                                </td>
                                <td class="right2">
                                    <span>수정</span><span> 삭제</span>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                        </tbody>
                    </table>
                </ul>
            </div>

        </main>
    </body>
    </html>
    
    
    