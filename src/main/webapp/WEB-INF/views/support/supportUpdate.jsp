<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="/resources/css/reset.css">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		<link rel="stylesheet" href="/resources/css/include/header.css">
		<link rel="stylesheet" href="/resources/css/include/footer.css">
		<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
		
		<style type="text/css">
        	@import url('https://fonts.googleapis.com/css2?family=Red+Hat+Text:wght@400;700&display=swap');
			@import url('https://fonts.googleapis.com/css2?family=Permanent+Marker&display=swap');
			@font-face {
			    font-family: 'GmarketSansMedium';
			    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
			    font-weight: normal;
			    font-style: normal;
			}
	        *:not(.note-editing-area *) {
			    font-family: 'GmarketSansMedium';
			    font-size: 1em;
			    color: #3d3d3d;
			}
        </style>
		
		<link rel="stylesheet" href="/resources/css/support/supportUpdate.css">

		<!-- jQuery -->		
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
		
        <!-- include summernote css/js -->
        <link
        href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
        rel="stylesheet">
        <script
        src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/summernote/lang/summernote-ko-KR.js"></script>
        
        
		<title>펫 라운지 모금함 : 수정</title>
	</head>
	<body>
		<jsp:include page="../include/header.jsp"></jsp:include>
		
		<main id="main">
            <section id="title">
                <h1>후원 수정</h1>
                <div id="line"></div>
			</section>
			<form action="/support/update.pet" method="post"
				enctype="multipart/form-data" id="updateForm">
				<input type="hidden" name="sNo" value="${support.sNo }">
	            <section id="content">
	                <div id="content-top">
	                    <input type="file" class="real-upload" accept="image/*" 
	                        onchange="setThumbnail(event);" name="uploadFile"
	                        multiple style="display: none;">
                        <input type="hidden" id="s-image-url" name="sImageUrl" value="${support.sImageUrl }">
	                    <div id="thumbnail">
	                        <img id="image-preview" src="${support.sImageUrl } ">
	                    </div>
	                    <div class="labels">
	                        <div class="label">
	                            <label for="s-category">카테고리</label>
	                        </div> 
	                        <div class="label">
	                            <label for="s-title">제목</label>
	                        </div> 
	                        <div class="label">
	                            <label for="s-start">모금 기간</label>
	                        </div> 
	                        <div class="label">
	                            <label for="s-target-amount">목표 금액</label>
	                        </div> 
	                        <div class="label">
	                            <label for="s-group">모금 단체</label>
	                        </div> 
	                    </div>
	                    <div class="inputs">
	                        <div class="input">
	                            <select name="sCategory" id="s-category" class="no-border">
	                                <option value="none" style="color:#ccc;" selected disabled>카테고리를 선택해주세요.</option>
	                                <option value="residence" <c:if test="${support.sCategory == 'residence' }">selected</c:if>>주거</option>
	                                <option value="living" <c:if test="${support.sCategory == 'living' }">selected</c:if>>생계</option>
	                                <option value="health" <c:if test="${support.sCategory == 'health' }">selected</c:if>>건강</option>
	                                <option value="improvement" <c:if test="${support.sCategory == 'improvement' }">selected</c:if>>개선</option>
	                            </select> 
	                        </div>
	                        <div class="input">
	                            <input type="text" name="sTitle" id="s-title" class="no-border" value="${support.sTitle }">
	                        </div>
	                        <div class="input">
	                            <input type="date" name="sStart" id="s-start" value="${support.sStart }"> ~
	                            <input type="date" name="sEnd" id="s-end" value="${support.sEnd }">
	                        </div>
	                        <div class="input">
	                            <input type="text" name="sTargetAmountInput" id="s-target-amount-input" class="no-border" 
	                            onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');" maxlength="15" value=""> 
	                            <input type="hidden" name="sTargetAmount" id="s-target-amount" value="${support.sTargetAmount }">
	                            원
	                        </div>
	                        <div class="input">
	                            <input type="text" name="sGroup" id="s-group" class="no-border" value="${support.sGroup }">
	                        </div>
	                    </div>
	                </div>
	                <div id="content-bottom">
	                    <textarea id="summernote" name="sContent" spellcheck="false" required>${support.sContent }</textarea>
	                </div>
	            </section>
	            <section id="button" style="margin-bottom: 100px;">
	                <button class="btn-update" type="submit" onClick="return insertCheck()">수정하기</button>
	                <button class="btn-cancel" type="button" onClick="location.href='/support/detail.pet?sNo=${support.sNo }'">돌아가기</button>
	            </section>
            </form>
        </main>
		
		<jsp:include page="../include/footer.jsp"></jsp:include>
		<script>
			<!-- 후원글 수정 유효성 체크 -->
	    	function insertCheck() {
	    		// 사진, 카테고리, 제목, 모금 시작일, 종료일, 목표금액, 모금단체, 내용
	    		const sImageUrl = $("#s-image-url");
	    		const sCategory = $("#s-category");
	    		const sTitle = $("#s-title");
	    		const sStart = $("#s-start");
	    		const sEnd = $("#s-end");
	    		const sTargetAmount = $("#s-target-amount-input");
	    		const sGroup = $("#s-group");
	    		const sContent = $("#summernote");
	    		
	    		if (!sImageUrl.val()) {
	    			alert('이미지를 첨부해주세요.');
	    			return false;
	   	        } else if (!sCategory.val()) {
	    			alert('카테고리를 선택해주세요.');
	    			sCategory.focus();
	    			return false;
	   	        } else if (!sTitle.val().trim()) {
	    			alert('제목을 입력해주세요.');
	    			sTitle.focus();
	    			return false;
	   	        } else if (!sStart.val()	) {
	    			alert('모금 시작일을 선택해주세요.');
	    			sStart.focus();
	    			return false;
	   	        } else if (!sEnd.val()) {
	    			alert('모금 종료일을 선택해주세요.');
	    			sEnd.focus();
	    			return false;
	   	        } else if (!sTargetAmount.val()) {
	    			alert('목표 금액을 입력해주세요.');
	    			sTargetAmount.focus();
	    			return false;
	   	        } else if (!sGroup.val().trim()) {
	    			alert('모금 단체를 입력해주세요.');
	    			sGroup.focus();
	    			return false;
	   	        } else if (!sContent.val()) {
	    			alert('내용을 입력해주세요.');
	    			sContent.focus();
	    			return false;
	   	        } else {
	   	        	return true;
	   	        }
	    	};
            <!-- 이미지 div 선택시 파일 업로드 -->
            const realUpload = document.querySelector('.real-upload');
            const upload = document.querySelector('#thumbnail');
            upload.addEventListener('click', () => realUpload.click());
            <!-- 이미지 업로드 미리보기, S3에 파일업로드 후에 받은 url input에 넣어주기 -->
            function setThumbnail(event){
            	let formData = new FormData();
            	   formData.append("multipartFile", event.target.files[0]);
            	   
            	   let imageUrl = document.getElementById('s-image-url');
            	   
            	   $.ajax({
            	      type: "POST",
            	      url: '/s3/file.im',
            	      data: formData,
            	      async: false,
            	      enctype: "multipart/form-data",
            	      processData: false,
            	      contentType: false,
            	      success: function(result) {
            	         console.log("파일 업로드 성공");
            	         for(const image of event.target.files){
                             const reader = new FileReader();
                             reader.onload = function(event){
                                 const img = document.getElementById("image-preview");
                                 img.src = event.target.result;
                                 img.removeAttribute("style");
                             }
                             reader.readAsDataURL(image);
                         }
            	         console.log(result);
            	         imageUrl.setAttribute('value', result);
            	      },
            	      error: function(error) {
            	         console.log(error);
            	      }
            	   });
            }
            <!-- 목표 금액 불러온 숫자 사이에 , 넣어주기  -->
            let sTargetAmount = (${support.sTargetAmount }).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            $(document).ready(function() {
                $('#s-target-amount-input').val(sTargetAmount);
            });

            <!-- 숫자만 사용 가능, 콤마 -->
            document.getElementById("s-target-amount-input").addEventListener("keyup", function (e) {
            	// 숫자 사이에 콤마 
                $(this).val($(this).val().replace(/\,/g, '').replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'));
             	// 사용자가 입력한 값에서 쉼표 제거하여 숫자만 추출
                let inputValue =  $(this).val().replace(/\,/g, '');
                // 추출한 숫자를 정수로 변환
                let numericValue = parseInt(inputValue, 10);
             	// hidden으로 숨겨둔 input에 넣어서 DB로 보낼 수 있게 함 
                document.getElementById("s-target-amount").value = numericValue;
            });
            
            <!-- Input date 시작일, 종료일 -->
            // 현재 날짜를 가져오는 함수
            function getCurrentDate() {
                const today = new Date();
                const year = today.getFullYear();
                let month = today.getMonth() + 1;
                let day = today.getDate();

                // 날짜 형식을 맞추기 위해 한 자리 수인 경우 0을 추가
                month = month < 10 ? '0' + month : month;
                day = day < 10 ? '0' + day : day;
				
                // 날짜 형식으로 합쳐주기 
                currentDate = year+'-'+month+'-'+day;
                return currentDate;
            }

            // 현재 날짜를 가져와서 input 요소에 설정
            document.getElementById('s-start').min = getCurrentDate();

            document.addEventListener("DOMContentLoaded", function () {
                const startDateInput = document.getElementById('s-start');
                const endDateInput = document.getElementById('s-end');

                startDateInput.addEventListener('input', function () {
                    // 시작일이 변경되면 종료일의 최소값을 시작일로 설정
                    endDateInput.min = startDateInput.value;

                    // 만약 종료일이 시작일보다 이전이라면 초기화
                    if (endDateInput.value < startDateInput.value) {
                    endDateInput.value = startDateInput.value;
                    }
                });

                endDateInput.addEventListener('input', function () {
                    // 종료일이 변경되면 시작일의 최대값을 종료일로 설정
                    startDateInput.max = endDateInput.value;

                    // 만약 시작일이 종료일보다 이후라면 초기화
                    if (startDateInput.value > endDateInput.value) {
                    startDateInput.value = endDateInput.value;
                    }
                });
            });
            <!-- summernote -->
            $(document).ready(function() {  
                $('#summernote').summernote({
                    height: 500,                 // 에디터 높이
                    minHeight: null,             // 최소 높이
                    maxHeight: null,             // 최대 높이
                    focus: false,                // 에디터 로딩후 포커스를 맞출지 여부
                    lang: "ko-KR",				// 한글 설정
                    placeholder: '후원 상세 내용을 적어주세요.',	//placeholder 설정
                    toolbar: [
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