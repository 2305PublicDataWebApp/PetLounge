<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <jsp:include page="../include/importSource.jsp"></jsp:include>
        <link rel="stylesheet" href="/resources/css/faq/insert.css">
        <link rel="stylesheet" href="/resources/css/reset.css">
        <link rel="stylesheet" href="/resources/css/font.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css">
        <title>FAQ 등록</title>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"
        integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/summernote/lang/summernote-ko-KR.js"></script>
    </head>
    <body>
        <jsp:include page="../include/header.jsp"></jsp:include>

        <main class="main">
            <div class="contanier">
                <!-- 타이틀 -->
                <div class="main-title">
                    <h1 id="title-text">FAQ 등록</h1>
                </div>

                <div id="line"></div>

                <!-- 게시글 등록 -->
                <div id="board-title">
<!--                     <form action="/faq/insert.pet" method="post"> -->
                        <div id="faq-borad">
                            <label for="faq-title" id="title">제목</label>
                            <div id="content">
                                <input type="text" name="faqTitle" id="faq-title" placeholder="제목을 입력해 주세요.">
                            </div>
                        </div>
<!--                         <div id="summernote"> -->
                      	<textarea name="faqContent" id="summernote" style="display: none;"></textarea>

<!--                         </div> -->
		                <div id="btn">
<!-- 		                    <input id="register-sub" type="submit" value="등록하기"> -->
		                    <button id="register-sub" type="button">등록하기</button>
		                    <a class="btn-list" href="/faq/list.pet" >목록으로</a>
		                </div>
<!--                     </form> -->
                </div>
            </div>
        </main>

        <jsp:include page="../include/footer.jsp"></jsp:include>

        <script>
            // <!-- summernote -->
            $(document).ready(function() {
                //여기 아래 부분
                $('#summernote').summernote({
                    height: 500,                 // 에디터 높이
                    minHeight: null,             // 최소 높이
                    maxHeight: null,             // 최대 높이
                    focus: false,                // 에디터 로딩후 포커스를 맞출지 여부
                    lang: "ko-KR",              // 한글 설정
                    placeholder: '답변을 작성해 주세요.',  //placeholder 설정
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
            
            // 글 등록 ajax
            const maxFaqItems = 10;
        	const registerLink = document.querySelector("#register-sub");
            $("#register-sub").on("click", function() {
				var faqContent = $("#summernote").summernote('code');
            	var faqTitle = $("#faq-title").val(); // 제목 가져옴
            	$.ajax({
            		url : "/faq/insert.pet",
            		data : { faqContent : faqContent, faqTitle : faqTitle },
            		type : "POST",
            		success : function(result) {
            			if(result == "success") {
// 	        				window.location.replace("/faq/list.pet"); // 성공한 경우 리스트로 이동
	         				location.href="/faq/list.pet";
	         			} else {
	         				alert("faq 등록 실패");
	         			}
            		},
            		error : function() {
            			alert("관리자에게 문의 바랍니다.");
            		}
           		});
            });
            </script>
    </body>
</html>