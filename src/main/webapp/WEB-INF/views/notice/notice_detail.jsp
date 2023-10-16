<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<jsp:include page="../include/importSource.jsp"></jsp:include>
        <link rel="stylesheet" href="/resources/css/notice/notice_detail.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard-dynamic-subset.css" />
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
                    <li><textarea id="textarea" class="notice-content" readonly>${notice.nContent}</textarea></li>
                </ul>
            </div>
        </div>
            <c:if test="${sessionScope.uId eq 'admin' }">
	            <div class="search-container">
	                <button class="edit" onclick="location.href='/notice/notice_update.pet?nNo='+${notice.nNo }">수정하기</button>
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
      	<footer>
		<jsp:include page="../include/footer.jsp"></jsp:include>
		</footer>
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
// 		    	location.href = "/notice/notice_list.pet?page="+${pInfo.currentPage };
		    	location.href = "/notice/notice_list.pet";
		    }		
		</script>
    </body>
    </html>
    
    
    