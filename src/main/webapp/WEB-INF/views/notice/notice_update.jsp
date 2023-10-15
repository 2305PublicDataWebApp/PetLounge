<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<jsp:include page="../include/importSource.jsp"></jsp:include>
        <link rel="stylesheet" href="/resources/css/notice/notice_update.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard-dynamic-subset.css" />
    </head>
    <body>
        <jsp:include page="../include/header.jsp"></jsp:include>
        
        <main class="custom-main">

        <section id="title-section">
            <h1>공지사항 수정</h1>
            <div id="line"></div>
        </section>
        <form action="/notice/notice_update.pet" method="post" enctype="multipart/form-data" id="updateForm">
        <div class="square-container">
            <div id="notice">
                <ul>
                    <li><input type="text" class="notice-title" name="nTitle" value="${notice.nTitle}"></li>
                    <li><textarea id="textarea" class="notice-content" name="nContent">${notice.nContent}</textarea></li>
                </ul>
            </div>
        </div>
            <c:if test="${sessionScope.uId eq 'admin' }">
	            <div class="search-container">
	                <button class="edit" type="submit">수정하기</button>
					<span class="backtolist">
						<span class="backtolist2" onclick="backToNoticeList();">목록으로</span>
					</span>
	            </div>
            </c:if>
            <c:if test="${sessionScope.uId ne 'admin' }">
	            <div class="search-container">
					<span class="backtolist">
						<span class="backtolist2" onclick="backToNoticeList();">목록으로</span>
					</span>
	            </div>
            </c:if>
		</form>
        </main>
      	<footer>
		<jsp:include page="../include/footer.jsp"></jsp:include>
		</footer>
		<script>
		    function backToNoticeList() {
		        history.back();
		    }		
		</script>
    </body>
    </html>
    
    
    