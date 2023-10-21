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
	        *:not(.f-content *) {
			    font-family: 'GmarketSansMedium';
			    font-size: 1em;
			    color: #3d3d3d;
			}
			*:not(.f-content) h1 {
			    font-family: 'GmarketSansMedium';
			    font-size: 2.5em;
			    font-weight: bold;
			} 
			*:not(.f-content) .edit {
			    font-family: Pretendard;
			    color: #ffffff;
			    font-size: 13px;
			    font-weight: bold;
			} 
			*:not(.f-content) .backtolist2 {
			    font-family: Pretendard;
			    border-color: #ffffff;
			    color: #ffd370;
			    font-size: 13px;
			    font-weight: bold;
			} 
        </style> 
		
		
        <link rel="stylesheet" href="/resources/css/board/freeDetail.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard-dynamic-subset.css" />
        <title>자유게시판</title>
    <script>
        history.replaceState({}, null, location.pathname);
    </script>
    </head>
    <body>
        <jsp:include page="../include/header.jsp"></jsp:include>
            
        <main class="custom-main">
        
        <section id="title-section">
            <h1>자유게시판</h1>
            <div id="line"></div>
        </section>

		<div class="bmark">
			<div class="sub-bmark">
	          	<c:if test="${ fBookmark eq 1 }">
				    <span id="bookmark-icon" class="material-symbols-outlined bookmark-icon-fill" data-tooltip-text="북마크" style="color: #FFD370;" onclick="fBookmark(${ bOne.fNo });">
				        <i class="bi bi-bookmark-heart-fill"></i>
				    </span>
				</c:if>
				<c:if test="${ fBookmark eq 0 }">
				    <span id="bookmark-icon" class="material-symbols-outlined bookmark-icon-none" data-tooltip-text="북마크" style="color: #FFD370;" onclick="fBookmark(${ bOne.fNo });">
				        <i class="bi bi-bookmark" id="empty"></i>
				    </span>
				</c:if>
			</div>
		</div>
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
                                <span>조회수 ${board.fViewCount +1}</span>
                            </div>
                        </div> 
                    </li>
                    <li>
	                   	<div class="f-content">
					    	<div class="custom-text-box">
					        	${board.fContent }
					    	</div>
                    	</div>
                    </li>
                </ul>
            </div>
        </div>
		<c:choose>
		    <c:when test="${sessionScope.uId == 'admin'}">
		        <div class="square-container2">
		            <div class="search-container3"> 
		                <div class="sub">
		                    <button class="submit" onclick="location.href='/board/freeDetailEdit.pet?fNo='+${board.fNo }">수정하기</button>
		                    <button class="submit-del" onclick="freeBoardDelete();">삭제하기</button>
		                </div>
		                <button class="backtolist1" onClick="location.href='/board/freeList.pet'">목록으로</button>
		            </div>
		        </div>
		    </c:when>
		    <c:when test="${sessionScope.uId != null && sessionScope.uId == board.uId}">
		        <div class="square-container2">
		            <div class="search-container"> 
		                <div class="sub">
		                    <button class="submit" onclick="location.href='/board/freeDetailEdit.pet?fNo='+${board.fNo }">수정하기</button>
		                    <button class="submit-del" onclick="freeBoardDelete();">삭제하기</button>
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
		
		<script>
			function freeBoardDelete() {
				const fNo = '${board.fNo}';
				if (confirm("삭제하시겠습니까?")) {
					location.href = "/board/fdelete.pet?fNo=" + fNo;
				}
			}
		</script>
		
		<!-- 즐겨찾기 -->
		<script>
		    function fBookmark(bookmarkfNo) {
		        var bookmark = document.getElementById('bookmark-icon');
		
		        $.ajax({
		            url: '/board/addToFBookmark.pet',
		            type: 'POST',
		            data: {
		                fNo: bookmarkfNo
		            },
		            success: function (data) {		// success 함수: Ajax 요청이 성공할 경우 실행되는 함수
		                if (data == "insert") {
		                    bookmark.classList.remove('bookmark-icon-none');
		                    bookmark.classList.add('bookmark-icon-fill');
		                } else if (data == "delete") {
		                    bookmark.classList.remove('bookmark-icon-fill');
		                    bookmark.classList.add('bookmark-icon-none');
		                } else if (data == "loginFail") {
		                    alert("로그인이 필요한 서비스입니다.");
		                    location.href="/user/login.pet";
		                } 
		            },
		            error: function () {
		            	alert("게시글 북마크 오류. 관리자에게 문의 바랍니다.");
		            }
		        });
		    }
		</script>		     
    </body>
    </html>
    
    
    