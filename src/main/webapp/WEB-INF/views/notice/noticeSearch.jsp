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
                        	<c:choose>
                        		<c:when test="${empty nList }">
                        			<tr>
                        				<td class="right1" id="none" colspan="5"><i class="bi bi-file-earmark-x" id="fail"></i>검색결과가 없습니다!</td>
                        			</tr>
                   			        <script>
							            // 검색 결과가 없을 때, pagination 숨기기
							            $(document).ready(function () {
							                $(".pagination").hide();
							            });
							        </script>
                        		</c:when>
                        		<c:otherwise>
		                        	<c:forEach var="notice" items="${nList }" varStatus="i">
			                            <tr>
			                                <td colspan="5"><hr class="line3"></td>
			                            </tr>
		                        		<tr>
		                        			<td class="right2">
		                        				${notice.nNo }
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
                        		</c:otherwise>
                        	</c:choose>
                        </tbody>
                    </table>
            </div>
      	        <div class="pagination">
	                <c:if test="${pInfo.startNavi != 1 }">
						<c:url var="prevUrl" value="//notice/noticeSearch.pet">
		                	<c:param name="page" value="${pInfo.startNavi -1 }"></c:param>
               	            <c:param name="searchCondition" value="${param.searchCondition}" />
           					<c:param name="searchKeyword" value="${param.searchKeyword}" />
	    	            </c:url>
	                	<a class="prev" href="${prevUrl }">
	                		<i class="bi bi-caret-left-fill"></i>	                	
	                	</a>
	                </c:if>	       
		             <c:forEach begin="${pInfo.startNavi }" end="${pInfo.endNavi }" var="p">
						<c:url var="pageUrl" value="/notice/noticeSearch.pet">
							<c:param name="page" value="${p }"></c:param>
							<c:param name="searchCondition" value="${param.searchCondition}" />
           					<c:param name="searchKeyword" value="${param.searchKeyword}" />
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
						<c:url var="nextUrl" value="/notice/noticeSearch.pet">
			                <c:param name="page" value="${pInfo.endNavi +1 }"></c:param>
  							<c:param name="searchCondition" value="${param.searchCondition}" />
           					<c:param name="searchKeyword" value="${param.searchKeyword}" />
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
  	                    <form action="/notice/noticeSearch.pet" method="get">
      	                        <select name="searchCondition" id="selec" class="search-select">
									<option value="all">전체</option>
									<option value="no">글번호</option>
									<option value="title">제목</option>
<!-- 									<option value="date">작성일</option> -->
								</select>
		                    <input type="text" name="searchKeyword" id="search" class="search-input" value="${searchKeyword }" style="margin-right : 5px;">
<!-- 		                    <input type="submit" class="search-button" value="검색"> -->
		                    <button type="submit" class="none1">
		                    	<i class="bi bi-search" id="searchIcon" ></i>
		                    </button>
	                    </form>
	                </div>
	                <div class="sub">
	                    <button class="submit">글쓰기</button>
	                </div>
	            </div>
			</c:if>
        	<c:if test="${sessionScope.uId ne 'admin' }">
	            <div class="search-container">
	                <div>
	                </div>
	                <div class="sub">
  	                    <form action="/notice/noticeSearch.pet" method="get">
      	                        <select name="searchCondition" id="selec" class="search-select">
									<option value="all" <c:if test="${searchCondition == 'all' 		}"	>selected</c:if>>전체</option>
									<option value="no" <c:if test="${searchCondition == 'no' 		}"	>selected</c:if>>글번호</option>
									<option value="title" <c:if test="${searchCondition == 'title' 		}"	>selected</c:if>>제목</option>
<%-- 									<option value="date" <c:if test="${searchCondition == 'date' 		}"	>selected</c:if>>작성일</option> --%>
								</select>
		                    <input type="text" name="searchKeyword" id="search" class="search-input" value="${searchKeyword}" style="margin-right : 5px;">
<!-- 		                    <input type="submit" class="search-button" value="검색"> -->
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
    </body>
    </html>
    
    
    
    