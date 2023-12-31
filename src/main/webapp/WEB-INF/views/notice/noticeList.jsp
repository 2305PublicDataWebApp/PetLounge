<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<jsp:include page="../include/importSource.jsp"></jsp:include>
<!-- 		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" /> -->
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <link rel="stylesheet" href="/resources/css/notice/noticeList.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard-dynamic-subset.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <title>공지사항</title>
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
                    <table>
                        <colgroup>
                            <col width="10%">
                            <col width="60%">
                            <col width="20%">
                            <col width="10%">
                        </colgroup>
                        <thead>
                            <tr>
                            	<th>번호</th>
                                <th>제목</th>
                                <th>작성일</th>
                                <th>조회수</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<c:forEach var="notice" items="${nList }" varStatus="i">
	                            <tr>
	                                <td colspan="5"><hr class="line3"></td>
	                            </tr>
                        		<tr>
                        			<td class="right2">
                        				${(totalCount - i.index) - ((pInfo.currentPage - 1) * pInfo.recordCountPerPage)}
                        			</td>
                        			<c:url var="detailUrl" value="/notice/noticeDetail.pet">
                        				<c:param name="nNo" value="${notice.nNo }" />
                        			</c:url>
                        			<td class="right1" style="text-align: left;">
                        				<a href="${detailUrl }">${notice.nTitle }</a>
                        			</td>
                        			<td class="right2">
                        				<fmt:formatDate pattern="yyyy.MM.dd" value="${notice.nCreate }" />
                        			</td>
                        			<td class="right2">
                        				${notice.nViewCount }
                        			</td>
                        		</tr>
                       		</c:forEach>
                        </tbody>
                    </table>
            </div>
      	        <div class="pagination">
	                <c:if test="${pInfo.startNavi != 1 }">
						<c:url var="prevUrl" value="/notice/noticeList.pet">
		                	<c:param name="page" value="${pInfo.startNavi -1 }"></c:param>
	    	            </c:url>
	                	<a class="prev" href="${prevUrl }">
	                		<i class="bi bi-caret-left-fill"></i>	                	
	                	</a>
	                </c:if>	       
		             <c:forEach begin="${pInfo.startNavi }" end="${pInfo.endNavi }" var="p">
						<c:url var="pageUrl" value="/notice/noticeList.pet">
							<c:param name="page" value="${p }"></c:param>
						</c:url>
						    <c:choose>
						        <c:when test="${p == pInfo.currentPage}">
						            <a class="page current" href="${pageUrl}">${p}</a>
						        </c:when>
						        <c:otherwise>
						            <a class="page" href="${pageUrl}">${p}</a>
						        </c:otherwise>
						    </c:choose>
					</c:forEach>
	                <c:if test="${pInfo.endNavi != pInfo.naviTotalCount}">
						<c:url var="nextUrl" value="/notice/noticeList.pet">
			                <c:param name="page" value="${pInfo.endNavi +1 }"></c:param>
	    	            </c:url>
	                	<a class="next" href="${nextUrl }">
	                		<i class="bi bi-caret-right-fill" id="right-fill"></i>
	                	</a>
	                </c:if>
                </div>	
        </div>
        	<c:if test="${sessionScope.uId eq 'admin' }">
	            <div class="search-container">
	                <div>
  	                    <form id="searchForm" action="/notice/noticeSearch.pet" method="get">
      	                        <select name="searchCondition" id="selec" class="search-select">
									<option value="all">전체</option>
									<option value="no">글번호</option>
									<option value="title">제목</option>
<!-- 									<option value="date">작성일</option> -->
								</select>
		                    <input type="text" name="searchKeyword" id="search" class="search-input" style="margin-right : 5px;">
<!-- 		                    <input type="submit" class="search-button" value="검색"> -->
		                    <button type="submit" class="none1">
		                    	<i class="bi bi-search" id="searchIcon" ></i>
		                    </button>
	                    </form>
	                </div>
	                <div class="sub">
	                    <button class="submit" onclick="showSubmitForm()">글쓰기</button>
	                </div>
	            </div>
			</c:if>
        	<c:if test="${sessionScope.uId ne 'admin' }">
	            <div class="search-container">
	                <div>
	                </div>
	                <div class="sub">
  	                    <form id="searchForm" action="/notice/noticeSearch.pet" method="get">
      	                        <select name="searchCondition" id="selec" class="search-select">
									<option value="all">전체</option>
									<option value="no">글번호</option>
									<option value="title">제목</option>
								</select>
		                    <input type="text" name="searchKeyword" id="search" class="search-input" style="margin-right : 5px;">
		                    <button type="submit" class="none1">
		                    	<i class="bi bi-search" id="searchIcon" ></i>
		                    </button>
	                    </form>
	                </div>
	            </div>		
			</c:if>        	

        </main>
      	<footer>
		<jsp:include page="../include/footer.jsp"></jsp:include>
		</footer>
		<script>
			function showSubmitForm(){
				location.href="/notice/noticeSubmit.pet"
			}
		</script>
		<script>
			$(document).ready(function() {
			    $("#searchIcon").click(function() {
			        $("#searchForm").submit();
			    });
			});
		</script>
    </body>
    </html>
    
    
    
    