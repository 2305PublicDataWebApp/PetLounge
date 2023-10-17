<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<jsp:include page="../include/importSource.jsp"></jsp:include>
		
		<link rel="stylesheet" href="/resources/css/user/userUpdateForm.css">
		<link rel="stylesheet" href="/resources/css/user/userBoardList.css">
		<link rel="stylesheet" href="/resources/css/user/userMyPage.css">
		<link rel="stylesheet" href="/resources/css/font.css">
		<link rel="stylesheet" href="/resources/css/reset.css">
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<title>즐겨찾는 병원</title>
	</head>
	<body>
		<jsp:include page="../include/header.jsp"></jsp:include>
		<main>
	
			<section style="padding-top: 120px;">
				<div id="wrap" class="clearfix">
					<aside class="aside">
					<div class="logo">
						<img class="logoImg" src="${user.uFilePath }">
					</div>
					<nav class="nav" style="display: block;">
							<ul>
								<li><a href="#">회원관리</a>
									<ul class="subMenu">
										<li><a href="/user/userInfo.pet">회원정보조회</a></li>
										<li><a href="/user/checkPw.pet">회원정보수정</a></li>
										<li><a href="/user/delete.pet">회원탈퇴</a></li>
									</ul></li>
								<li><a href="#">게시글관리</a>
									<ul class="subMenu">
										<li><a href="/user/searchBoard.pet">게시글 조회</a></li>
										<li><a href="/user/searchBoardReply.pet">댓글 조회</a></li>
										<li><a href="/user/searchBoardMark.pet">북마크</a></li>
									</ul></li>
								<li><a href="#">후원관리</a>
									<ul class="subMenu">
										<li><a href="/user/searchSupport.pet">후원목록</a></li>
										<li><a href="/user/searchSupportReply.pet">후원댓글</a></li>
									</ul></li>
								<li><a href="#">병원관리</a>
									<ul class="subMenu">
										<li><a href="/user/uHospital.pet">즐겨찾는 병원</a></li>
										<li><a href="/user/searchHospitalReview.pet">병원리뷰</a></li>
									</ul></li>
							</ul>
						</nav>
					</aside>
					<section class="contents">
						<div>
							<div class="title">
								<div class="info_img">
									<img src="/resources/images/pet.png">
								</div>
								<div class="info_h1">
									<h1 style="font-size: 1em; font-weight: bold;">즐겨찾는 병원</h1>
								</div>
							</div>
							<div class="info_hr">
								<hr>
							</div>
						</div>
						<div style="margin: 30px 60px 30px 60px;">
							<div id="boardTable" class="board-list">
								<form action="/user/searchHospital.pet" method=get>
								<input type="hidden" name="uId" value="${uId}">
									<div class="filter input-group mb-3">
										<select name="searchCondition" style="border-radius: 20px; padding-top: 2px;">
											<option value="all" <c:if test="${param.searchCondition == 'all' }">selected</c:if>>전체</option>
											<option value="name" <c:if test="${param.searchCondition == 'name' }">selected</c:if>>병원명</option>
											<option value="addr" <c:if test="${param.searchCondition == 'addr' }">selected</c:if>>주소</option>
											<option value="phone" <c:if test="${param.searchCondition == 'phone' }">selected</c:if>>전화번호</option>   
										</select> <input class="form-control" type="text" name="searchKeyword"
											placeholder="검색"
											style="width: 75%; height: 28px; text-indent: 5px; border-radius: 20px; margin-left: 0; border-color: #FFD370; padding-top: 10px;" />
										<input type="submit" value="검색" 
											style="background-color: #ffd370; color: white; border-color: #ffd370; width: 10%; height: 28px; border-radius: 20px; margin-left: 0; padding-top: 3px;">
									</div>
								</form>
							</div>
							<table class="table table-borderd  table-fixed">
								<thead>
									<tr>
										<th style="border-bottom: 1px solid #dee2e6;">No</th>
										<th style="border-bottom: 1px solid #dee2e6;">병원명</th>
										<th style="border-bottom: 1px solid #dee2e6;">주소</th>
										<th style="border-bottom: 1px solid #dee2e6;">전화번호</th>
									</tr>
								</thead>
								<tbody>
								
									<c:forEach items="${hList }" var="hList" varStatus="i">
										<tr>
											<td>${i.count }</td>
											<c:url var="detailUrl" value="/hospital/detail.pet">
												<c:param name="hNo" value="${hList.hNo }"></c:param>
											</c:url>
											<td><a href="${detailUrl }">${hList.hName }</a></td>
											 <td>${hList.hAddr}</td>
											<td style="width: 135px;">
												<c:if test="${hList.hPhone eq null}">
										        번호정보없음
											    </c:if>
											    <c:if test="${hList.hPhone ne null}">
													${hList.hPhone }
											    </c:if>
										    </td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							
							<div aria-label="Page navigation example" class="page">
							
						        <c:url var="prevUrl" value="/user/uHospital.pet">
									<c:param name="page" value="${aInfo.startNavi -1 }"></c:param>
								</c:url>
					            <div></div>
					          	<ul style="display: flex; justify-content: center;">
						         	<c:if test="${aInfo.startNavi != 1 }">
										<li><a href="${prevUrl }" >이전</a></li>
						            </c:if>
					            
						            <c:forEach begin="${aInfo.startNavi }" end="${aInfo.endNavi }" var="p">
										<c:url var="pageUrl" value="/user/uHospital.pet">
											<c:param name="page" value="${p }"></c:param>
										</c:url>
						            	&nbsp;&nbsp;&nbsp;<li><a href="${pageUrl }">${p }</a></li>&nbsp;&nbsp;&nbsp;
						            </c:forEach>
					            
						            <c:if test="${aInfo.endNavi != aInfo.naviTotalCount }">
										<c:url var="nextUrl" value="/user/uHospital.pet"> 
											<c:param name="page" value="${aInfo.endNavi + 1 }"></c:param>
										</c:url>
						            	<li><a href="${nextUrl }">Next</a></li>
						            </c:if>
					            </ul>
					        </div> 
					        
        
<!-- 							<div class="paging" style="margin-top: 50px;"> -->
<!-- 								<div> -->
<%-- 									<c:if test="${aInfo.nStartNavi != 1}"> --%>
<%-- 										<c:url var="preUrl" value="/user/uHospital.pet"> --%>
<%-- 											<c:param name="page" value="${aInfo.startNavi -1 }" /> --%>
<%-- 										</c:url> --%>
<%-- 										<a href="${preUrl }">[이전]</a> --%>
<%-- 									</c:if> --%>
<%-- 									<c:forEach begin="${aInfo.startNavi }" end="${aInfo.endNavi }"var="n"> --%>
<%-- 										<c:url var="pageUrl" value="/user/uHospital.pet"> --%>
<%-- 											<c:param name="page" value="${n }"></c:param> --%>
<%-- 										</c:url> --%>
<%-- 										<a href="${pageUrl }">${n }</a>&nbsp; --%>
<%-- 	                                </c:forEach> --%>
<%-- 									<c:if test="${aInfo.nEndNavi != aInfo.naviTotalCount }"> --%>
<%-- 										<c:url var="nextUrl" value="/user/uHospital.pet"> --%>
<%-- 											<c:param name="page" value="${aInfo.endNavi +1 }" /> --%>
<%-- 										</c:url> --%>
<%-- 										<a href="${nextUrl }">[다음]</a> --%>
<%-- 									</c:if> --%>
<!-- 								</div> -->
<!-- 							</div> -->
							
							
						</div>
					</section>
				</div>
			</section>
		</main>
		<jsp:include page="../include/footer.jsp"></jsp:include>
	
		<script>
	        // 클릭했을 때
	        $(".nav > ul > li > a").click(function (e) {
	            e.preventDefault();
	
	            // 현재 클릭한 버튼에 대한 하위 메뉴만 열기
	            var subMenu = $(this).next('.subMenu').not(':animated');
	            subMenu.slideToggle();
	
	            // 다른 모든 하위 메뉴 닫기
	            $(".subMenu").not(subMenu).slideUp();
	        });
	        
	        
	      
	    
	
	    </script>
	</body>
</html>