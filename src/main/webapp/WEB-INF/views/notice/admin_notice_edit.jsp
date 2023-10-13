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
            line-height: 50px; /* li 세로 간격 */
        }
        #notice ul li span {
            display: block;
            float: right;
            width: 150px;
            text-align: center;
            color: #505D68;
        }
        
        .square-container {
            max-width: 600px;
            border: 3px solid #ffd370;
            margin: 0 auto;
            padding: 15px 50px 30px 50px;
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
            position: fixed;
            left: calc(50% - -200px / 2);
            display: flex;
            align-items: flex-end;
            justify-content: center;
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
        }

        input[type="text"] {
            width: 99%;
            height: 25px;
            border : 1px solid #ffd370;
        }
        input[type="text"]::placeholder {
            font-size: 16px;
            font-weight: bold;
            font-family: Pretendard;
            letter-spacing: -0.02em;
            color: rgb(217, 218, 220);
        }
        </style>
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
        integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
        crossorigin="anonymous"></script>
        <link
            href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
            rel="stylesheet">
        <script
            src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/summernote/lang/summernote-ko-KR.js"></script>
        <link rel="stylesheet" href="/resources/css/reset.css">
        <link rel="stylesheet" href="/resources/css/font.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard-dynamic-subset.css" />
    </head>
    <body>
        <header>
        </header>

        <main class="custom-main">
        <br><br><br><br>
        <h2>공지사항 수정</h2>
        <div id="line"></div>

        <div class="square-container">
            <div id="notice">
                <ul>
                    <li><input type="text" placeholder="공지사항 제목을 입력해 주세요"></li>
                </ul>
                <div id="summernote"></div>
            </div>
        </div>
            <div class="search-container">
                <div class="sub">
                    <button class="submit">수정하기</button>
                </div>
                <button class="backtolist">목록으로</button>
            </div>

        </main>
        <script>
            // <!-- summernote -->
            $(document).ready(function() {
                //여기 아래 부분
                $('#summernote').summernote({
                    height: 300,                 // 에디터 높이
                    minHeight: null,             // 최소 높이
                    maxHeight: null,             // 최대 높이
                    focus: false,                // 에디터 로딩후 포커스를 맞출지 여부
                    lang: "ko-KR",              // 한글 설정
                    placeholder: '공지사항 내용을 작성해주세요',  //placeholder 설정
                    toolbar: [
                        ['style', ['style']],
                        ['fontname', ['fontname']],
                        ['fontsize', ['fontsize']],
                        ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
                        ['color', ['forecolor','color']],
                        ['table', ['table']],
                        ['para', ['ul', 'ol', 'paragraph']],
                        ['height', ['height']],
                        ['insert',['link']],
                        ['view', ['fullscreen', 'help']]
                    ],
                    fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
                    fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
                });
            });
            </script>
    </body>
    </html>
    
    
    