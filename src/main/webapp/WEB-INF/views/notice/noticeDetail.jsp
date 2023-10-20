<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
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
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
		
     	
   		<style type="text/css">
        	@import url('https://fonts.googleapis.com/css2?family=Red+Hat+Text:wght@400;700&display=swap');
			@import url('https://fonts.googleapis.com/css2?family=Permanent+Marker&display=swap');
			@font-face {
			    font-family: 'GmarketSansMedium';
			    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
			    font-weight: normal;
			    font-style: normal;
			}
	        *:not(.n-content *) {
			    font-family: 'GmarketSansMedium';
			    font-size: 1em;
			    color: #3d3d3d;
			}
			*:not(.n-content) h1 {
			    font-family: 'GmarketSansMedium';
			    font-size: 2.5em;
			    font-weight: bold;
			} 
			*:not(.n-content) .edit {
			    font-family: Pretendard;
			    color: #ffffff;
			    font-size: 13px;
			    font-weight: bold;
			} 
			*:not(.n-content) .backtolist2 {
			    font-family: Pretendard;
			    border-color: #ffffff;
			    color: #ffd370;
			    font-size: 13px;
			    font-weight: bold;
			} 
        </style> 

        <link rel="stylesheet" href="/resources/css/notice/noticeDetail.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard-dynamic-subset.css" />
        
        <title>공지사항</title>
    <script>
		history.replaceState({}, null, location.pathname);
	</script>
    </head>
    <body>
        <jsp:include page="../include/header.jsp"></jsp:include>
        
        <main class="custom-main">

        <section id="title-section">
            <h1>공지사항</h1>
            <div id="line"></div>
        </section>

        <div class="square-container">
            <div id="notice">
                <ul>
                    <li><input type="text" class="notice-title" value="${notice.nTitle}" readonly></li>
                    <li class="user-info">
                        <div class="user-img">
                            <img alt="유저 프로필 이미지" src="../../resources/userUploadFiles/profile.png">
                            <span>펫 라운지</span>
                        </div>
                        <div class="menu">
                            <div class="info">
                              	<span><fmt:formatDate pattern="yyyy.MM.dd" value="${notice.nCreate }" /></span>
                                <span>조회수 ${notice.nViewCount +1}</span>
                            </div>
                        </div> 
                    </li>
                    <li>
                    	<div class="n-content">
						    <div class="custom-text-box">
						        ${notice.nContent}
						    </div>
                    	</div>
                    </li>
                </ul>
            </div>
        </div>
            <c:if test="${sessionScope.uId eq 'admin' }">
	            <div class="search-container">
	                <button class="edit" onclick="location.href='/notice/noticeUpdate.pet?nNo='+${notice.nNo }">수정하기</button>
	                <button class="delete" onclick="noticeDelete();">삭제하기</button>
	                <button class="backtolist" onclick="backToNoticeList();">목록으로</button>
	            </div>
            </c:if>
            <c:if test="${sessionScope.uId ne 'admin' }">
	            <div class="search-container">
	                <button class="backtolist" onclick="backToNoticeList();">목록으로</button>
	            </div>
            </c:if>

        </main>
        
		<jsp:include page="../include/footer.jsp"></jsp:include>

		<script>
			function noticeDelete() {
				const nNo = '${notice.nNo}';
				if (confirm("삭제하시겠습니까?")) {
					location.href = "/notice/delete.pet?nNo=" + nNo;
				}
			}
		</script>
		<script>
		    function backToNoticeList() {
		    	location.href = "/notice/noticeList.pet";
		    }		
		</script>	
    </body>
    </html>
    
    
    