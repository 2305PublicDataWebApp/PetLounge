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
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />   		
        <link rel="stylesheet" href="/resources/css/board/free_list.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard-dynamic-subset.css" />
        <title>자유게시판</title>
    </head>
    <body>
        <jsp:include page="../include/header.jsp"></jsp:include>

        <main class="custom-main">

        <section id="title-section">
            <h1>자유게시판</h1>
            <div id="line"></div>
        </section>

        <div class="square-container">
            <div id="notice">
                    <table>
                        <colgroup>
                            <col width="7%">
                            <col width="50%">
                            <col width="15%">
                            <col width="15%">
                            <col width="15%">
                        </colgroup>
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>제목</th>
                                <th>닉네임</th>
                                <th>작성일</th>
                                <th>조회수</th>
                            </tr>
                        </thead>
                        <tbody>
                           	<c:forEach var="board" items="${bList }" varStatus="i">
	                            <tr>
	                                <td colspan="5"><hr class="line3"></td>
	                            </tr>
	                            <tr>
	                                <td class="right2">
	                                	${board.fNo }
	                                </td>
                                    <c:url var="detailUrl" value="/board/free_detail.pet">
                        				<c:param name="fNo" value="${board.fNo }" />
                        			</c:url>
	                                <td class="right1" style="text-align: left;">
                        				<a href="${detailUrl }">${board.fTitle }</a>
	                                </td>
	                                <td class="right2">
	                                	${board.uId }
	                                </td>
                        			<td class="right2">
                        				<fmt:formatDate pattern="yyyy.MM.dd" value="${board.fCreate }" />
                        			</td>
                        			<td class="right2">
                        				${board.fViewCount }
                        			</td>
	                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
            </div>
                <ul class="pagination">
                    <li class="Mui-selected"><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li><a href="#">다음</a></li>
                </ul>
        </div>
            <div class="search-container">
                <div>
                    <input type="text" class="search-input">
                    <button class="search-button">검색</button>
                </div>
                <div class="sub">
                    <button class="submit">글쓰기</button>
                </div>
            </div>

        </main>
      	<footer>
		<jsp:include page="../include/footer.jsp"></jsp:include>
		</footer>
    </body>
    </html>
    
    
    