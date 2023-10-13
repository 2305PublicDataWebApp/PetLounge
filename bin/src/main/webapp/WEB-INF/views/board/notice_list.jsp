<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<jsp:include page="../include/importSource.jsp"></jsp:include>
        <link rel="stylesheet" href="/resources/css/board/notice_list.css">
<%--         <c:choose> --%>
<%--         	<c:when test="${sessionId == 'test'}"> --%>
<!--             	<link rel="stylesheet" type="text/css" href="/resources/css/board/notice_list2.css"> -->
<%--         	</c:when> --%>
<%--         	<c:otherwise> --%>
<!--             	<link rel="stylesheet" type="text/css" href="/resources/css/board/notice_list.css"> -->
<%--         	</c:otherwise> --%>
<%--     	</c:choose> --%>
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard-dynamic-subset.css" />
        <title>공지사항</title>
    </head>
    <body>
        <jsp:include page="../include/header.jsp"></jsp:include>

        <main class="custom-main">
        <br><br><br><br>
        <h2>공지사항</h2>
        <div id="line"></div>

        <div class="square-container">
            <div id="notice">
                <ul>
                    <table>
                        <colgroup>
                            <col width="60%">
                            <col width="10%">
                            <col width="10%">
                        </colgroup>
                        <thead>
                            <tr>
                                <!-- <th>제목</th>
                                <th>작성일</th>
                                <th>조회수</th> -->
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right1" style="text-align: left;">[공지사항] 펫라운지 공지1</td>
                                <td class="right2">2023.10.03</td>
                                <td class="right2">12</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right1" style="text-align: left;">[공지사항] 펫라운지 공지2</td>
                                <td class="right2">2023.10.03</td>
                                <td class="right2">8</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right1" style="text-align: left;">[공지사항] 펫라운지 공지3</td>
                                <td class="right2">2023.10.03</td>
                                <td class="right2">21</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right1" style="text-align: left;">[공지사항] 펫라운지 공지4</td>
                                <td class="right2">2023.10.03</td>
                                <td class="right2">11</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right1" style="text-align: left;">[공지사항] 펫라운지 공지5</td>
                                <td class="right2">2023.10.03</td>
                                <td class="right2">17</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
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
    
    
    
    