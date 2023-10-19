<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<jsp:include page="../include/importSource.jsp"></jsp:include> 
        <link rel="stylesheet" href="/resources/css/board/freeDetailSubmit.css">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
        integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
        crossorigin="anonymous"></script>
        <link
            href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
            rel="stylesheet">
        <script
            src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/summernote/lang/summernote-ko-KR.js"></script>
<!--         <link rel="stylesheet" href="/resources/css/reset.css"> -->
<!--         <link rel="stylesheet" href="/resources/css/font.css"> -->
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard-dynamic-subset.css" />
        <title>자유게시판</title>
    </head>
    <body>
        <jsp:include page="../include/header.jsp"></jsp:include>

        <main class="custom-main">
        <section id="title-section">
            <h1>자유게시판 등록</h1>
            <div id="line"></div>
        </section>
        <form action="/board/freeDetailSubmit.pet" method="post" enctype="multipart/form-data" id="submitForm">
        <div class="square-container">
            <div id="notice">
                <ul>
                    <li><input type="text" name="fTitle" placeholder="제목을 입력해 주세요"></li>
                </ul>
                <div>
                	<textarea id="summernote" name="fContent" spellcheck="false" required></textarea>
                </div>
            </div>
        </div>
            <div class="search-container">
                <div class="sub">
                    <button class="submit">등록하기</button>
                </div>
                <button class="backtolist" onclick="backToNoticeList();">목록으로</button>
            </div>
		</form>
        </main>
        		<jsp:include page="../include/footer.jsp"></jsp:include>
        		
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
                    placeholder: '내용을 작성해주세요',  //placeholder 설정
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
         <script>         
			function backToNoticeList() {
				location.href="/board/freeList.pet";
			}
        </script>
    </body>
    </html>
    
    
    