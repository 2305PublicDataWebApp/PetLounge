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
        <link rel="stylesheet" href="/resources/css/notice/notice_list.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard-dynamic-subset.css" />
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
                <ul>
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
                        			<td>
                        				${i.count }
                       				</td>
                        			<c:url var="detailUrl" value="/notice/notice_detail.pet">
                        				<c:param name="nNo" value="${notice.nNo }" />
                        			</c:url>
                        			<td>
                        				<a href="${detailUrl }">${notice.nTitle }</a>
                        			</td>
                        			<td>
                        				<fmt:formatDate pattern="yyyy-MM-dd" value="${notice.nCreate }" />
                        			</td>
                        			<td>
                        				${notice.nViewCount }
                        			</td>
                        		</tr>
                       		</c:forEach>
                        		
                        	
<!--                             <tr> -->
<!--                                 <td colspan="5"><hr class="line3"></td> -->
<!--                             </tr> -->
<!--                             <tr> -->
<!--                                 <td class="right1" style="text-align: left;">펫라운지 공지1</td> -->
<!--                                 <td class="right2">2023.10.03</td> -->
<!--                                 <td class="right2">12</td> -->
<!--                             </tr> -->
<!--                             <tr> -->
<!--                                 <td colspan="5"><hr class="line3"></td> -->
<!--                             </tr> -->
<!--                             <tr> -->
<!--                                 <td class="right1" style="text-align: left;">펫라운지 공지2</td> -->
<!--                                 <td class="right2">2023.10.03</td> -->
<!--                                 <td class="right2">8</td> -->
<!--                             </tr> -->
<!--                             <tr> -->
<!--                                 <td colspan="5"><hr class="line3"></td> -->
<!--                             </tr> -->
<!--                             <tr> -->
<!--                                 <td class="right1" style="text-align: left;">펫라운지 공지3</td> -->
<!--                                 <td class="right2">2023.10.03</td> -->
<!--                                 <td class="right2">21</td> -->
<!--                             </tr> -->
<!--                             <tr> -->
<!--                                 <td colspan="5"><hr class="line3"></td> -->
<!--                             </tr> -->
<!--                             <tr> -->
<!--                                 <td class="right1" style="text-align: left;">펫라운지 공지4</td> -->
<!--                                 <td class="right2">2023.10.03</td> -->
<!--                                 <td class="right2">11</td> -->
<!--                             </tr> -->
<!--                             <tr> -->
<!--                                 <td colspan="5"><hr class="line3"></td> -->
<!--                             </tr> -->
<!--                             <tr> -->
<!--                                 <td class="right1" style="text-align: left;">펫라운지 공지5</td> -->
<!--                                 <td class="right2">2023.10.03</td> -->
<!--                                 <td class="right2">17</td> -->
<!--                             </tr> -->
<!--                             <tr> -->
<!--                                 <td colspan="5"><hr class="line3"></td> -->
<!--                             </tr> -->
                        </tbody>
                    </table>
                </ul>
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
        	<c:if test="${sessionScope.uId eq 'admin' }">
	            <div class="search-container">
	                <div>
	                    <input type="text" class="search-input">
	                    <button class="search-button">검색</button>
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
	                    <input type="text" class="search-input" style="margin-right : 5px;">
	                    <button class="search-button">검색</button>
	                </div>
	            </div>		
			</c:if>        	

        </main>
      	<footer>
		<jsp:include page="../include/footer.jsp"></jsp:include>
		</footer>
    </body>
    </html>
    
    
    
    