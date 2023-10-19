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
        <link rel="stylesheet" href="/resources/css/board/freeDetail.css">
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
                <ul>
                    <li><input type="text" class="notice-title" value="${board.fTitle }" readonly></li>
                    <li class="user-info">
                        <div class="user-img">
                            <img alt="유저 프로필 이미지" src="../../resources/userUploadFiles/profile.png">
                            <span>${uNickname}</span>
                        </div>
                        <div class="menu">
                            <div class="info">
                                <span>
                                <fmt:formatDate pattern="yyyy.MM.dd" value="${board.fCreate }" />                                
                                </span>
                                <span>조회수 ${board.fViewCount }</span>
                            </div>
                        </div> 
                    </li>
                    <li><textarea id="textarea" class="notice-content" readonly>${board.fContent }</textarea></li>
                </ul>
            </div>
        </div>
		<c:choose>
		    <c:when test="${sessionScope.uId == 'admin'}">
		        <div class="square-container2">
		            <div class="search-container"> 
		                <div class="sub">
		                    <button class="submit">수정하기</button>
		                    <button class="submit-del">삭제하기</button>
		                </div>
		                <button class="backtolist" onClick="location.href='/board/freeList.pet'">목록으로</button>
		            </div>
		        </div>
		    </c:when>
		    <c:when test="${sessionScope.uId != null && sessionScope.uId == board.uId}">
		        <div class="square-container2">
		            <div class="search-container"> 
		                <div class="sub">
		                    <button class="submit">수정하기</button>
		                    <button class="submit-del">삭제하기</button>
		                </div>
		                <button class="bookmark">북마크하기</button>
		                <button class="backtolist" onClick="location.href='/board/freeList.pet'">목록으로</button>
		            </div>
		        </div>
		    </c:when>
		    <c:when test="${sessionScope.uId != null && sessionScope.uId != board.uId}">
		        <div class="square-container2">
		            <div class="search-container-1"> 
		                <div class="sub">
		                </div>
		                <button class="backtolist" onClick="location.href='/board/freeList.pet'">목록으로</button>
		            </div>
		        </div>
		    </c:when>
		    <c:otherwise>
		        <div class="square-container2">
		            <div class="search-container-1"> 
		                <div class="sub">
		                </div>
		                <button class="backtolist" onClick="location.href='/board/freeList.pet'">목록으로</button>
		            </div>
		        </div>
		    </c:otherwise>
		</c:choose>        
          

          
        <div class="reply-container">
            <textarea class="reply-input"></textarea>
            <button class="submit2">등록</button>
        </div>

        <div class="square-container3">
            <div id="notice">
                <ul>
                    <table>
                        <colgroup>
                            <col width="7%">
                            <col width="70%">
                            <col width="15%">
                        </colgroup>
                        <thead>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="right2">
                                    <div class="user-img">
                                        <img alt="유저 프로필 이미지" src="../../resources/userUploadFiles/profile.png">
                                    </div>
                                </td>
                                <td class="right1" style="text-align: left;">
                                    <span>동숲주민</span><span> 2023.10.01</span><span> 답글</span><br>
                                    <span>리뷰 내용</span>
                                </td>
                                <td class="right2">
                                    <span>수정</span><span> 삭제</span>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">
                                    <div class="user-img">
                                        <img alt="유저 프로필 이미지" src="../../resources/img/board/user_sample.png">
                                    </div>
                                </td>
                                <td class="right1" style="text-align: left;">
                                    <span>동숲주민</span><span> 2023.10.01</span><span> 답글</span><br>
                                    <span>리뷰 내용</span>
                                </td>
                                <td class="right2">
                                    <span>수정</span><span> 삭제</span>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">
                                    <div class="user-img">
                                        <img alt="유저 프로필 이미지" src="../../resources/img/board/user_sample.png">
                                    </div>
                                </td>
                                <td class="right1" style="text-align: left;">
                                    <span>동숲주민</span><span> 2023.10.01</span><span> 답글</span><br>
                                    <span>리뷰 내용</span>
                                </td>
                                <td class="right2">
                                    <span>수정</span><span> 삭제</span>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">
                                    <div class="user-img">
                                        <img alt="유저 프로필 이미지" src="../../resources/img/board/user_sample.png">
                                    </div>
                                </td>
                                <td class="right1" style="text-align: left;">
                                    <span>동숲주민</span><span> 2023.10.01</span><span> 답글</span><br>
                                    <span>리뷰 내용</span>
                                </td>
                                <td class="right2">
                                    <span>수정</span><span> 삭제</span>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">
                                    <div class="user-img">
                                        <img alt="유저 프로필 이미지" src="../../resources/img/board/user_sample.png">
                                    </div>
                                </td>
                                <td class="right1" style="text-align: left;">
                                    <span>동숲주민</span><span> 2023.10.01</span><span> 답글</span><br>
                                    <span>리뷰 내용</span>
                                </td>
                                <td class="right2">
                                    <span>수정</span><span> 삭제</span>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                        </tbody>
                    </table>
                </ul>
            </div>

        </main>
        
		<jsp:include page="../include/footer.jsp"></jsp:include>        
		
    </body>
    </html>
    
    
    