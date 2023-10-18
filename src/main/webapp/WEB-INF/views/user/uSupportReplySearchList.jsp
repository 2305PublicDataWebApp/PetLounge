<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
		<title>나의 후원 댓글</title>
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
										<li><a href="/user/Board.pet">게시글 조회</a></li>
										<li><a href="/user/searchBoardReply.pet">댓글 조회</a></li>
										<li><a href="/user/searchBoardMark.pet">북마크</a></li>
									</ul></li>
								<li><a href="#">후원관리</a>
									<ul class="subMenu">
										<li><a href="/user/uSupport.pet">후원내역</a></li>
										<li><a href="/user/uSupportReply.pet">후원댓글</a></li>
									</ul></li>
								<li><a href="#">병원관리</a>
									<ul class="subMenu">
										<li><a href="/user/uHospital.pet">즐겨찾는 병원</a></li>
										<li><a href="/user/uHosReview.pet">병원리뷰</a></li>
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
									<h1 style="font-size: 1em; font-weight: bold;">후원 댓글</h1>
								</div>
							</div>
							<div class="info_hr">
								<hr>
							</div>
						</div>
						<div style="margin: 30px 60px 30px 60px;">
							<div id="boardTable" class="board-list">
								<form action="/user/searchSupportReply.pet" method="get">
									<div class="filter input-group mb-3">
										<select name="searchCondition" style="border-radius: 20px; padding-top: 2px;">
											<option value="all" <c:if test="${param.searchCondition == 'all' }">selected</c:if>>전체</option>
											<option value="title" <c:if test="${param.searchCondition == 'title' }">selected</c:if>>제목</option>
											<option value="content" <c:if test="${param.searchCondition == 'content' }">selected</c:if>>내용</option>
											<option value="create" <c:if test="${param.searchCondition == 'create' }">selected</c:if>>작성일</option>   
										</select> <input class="form-control" type="text" name="searchKeyword"
											placeholder="검색" value="${paramMap.searchKeyword }"
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
										<th style="border-bottom: 1px solid #dee2e6;">제목</th>
										<th style="border-bottom: 1px solid #dee2e6;">내용</th>
										<th style="border-bottom: 1px solid #dee2e6;">작성일</th>
<!-- 										<th style="border-bottom: 1px solid #dee2e6;">작성자</th> -->
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${sRList }" var="sRList" varStatus="i">
										<tr>
											<td>${i.count }</td>
												<c:url var="detailUrl" value="/support/detail.pet">
													<c:param name="sNo" value="${sRList.sNo }"></c:param>
												</c:url>
											<td><a href="${detailUrl }">${sRList.sTitle }</a></td>
											<td>${sRList.sRContent}</td>
											<td>${sRList.sUpdate}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div aria-label="Page navigation example" class="page">
							
						        <c:url var="prevUrl" value="/user/searchSupportReply.pet">
									<c:param name="page" value="${aInfo.startNavi -1 }"></c:param>
									<c:param name="searchCondition" value="${paramMap.searchCondition }"></c:param>
									<c:param name="searchKeyword" value="${paramMap.searchKeyword }"></c:param>
									<c:param name="uId" value="${sessionScope.uId}"></c:param>
								</c:url>
					            <div></div>
					          	<ul style="display: flex; justify-content: center;">
						         	<c:if test="${aInfo.startNavi != 1 }">
										<li><a href="${prevUrl }" >이전</a></li>
						            </c:if>
					            
						            <c:forEach begin="${aInfo.startNavi }" end="${aInfo.endNavi }" var="p">
										<c:url var="pageUrl" value="/user/searchSupportReply.pet">
											<c:param name="page" value="${p }"></c:param>
											<c:param name="searchCondition" value="${paramMap.searchCondition }"></c:param>
											<c:param name="searchKeyword" value="${paramMap.searchKeyword }"></c:param>
											<c:param name="uId" value="${sessionScope.uId}"></c:param>
										</c:url>
						            	&nbsp;&nbsp;&nbsp;<li><a href="${pageUrl }">${p }</a></li>&nbsp;&nbsp;&nbsp;
						            </c:forEach>
					            
						            <c:if test="${aInfo.endNavi != aInfo.naviTotalCount }">
										<c:url var="nextUrl" value="/user/searchSupportReply.pet"> 
											<c:param name="page" value="${aInfo.endNavi + 1 }"></c:param>
											<c:param name="searchCondition" value="${paramMap.searchCondition }"></c:param>
											<c:param name="searchKeyword" value="${paramMap.searchKeyword }"></c:param>
											<c:param name="uId" value="${sessionScope.uId}"></c:param>
										</c:url>
						            	<li><a href="${nextUrl }">다음</a></li>
						            </c:if>
					            </ul>
					        </div> 
						</div>
					</section>
				</div>
			</section>
	
	
		</main>
		<jsp:include page="../include/footer.jsp"></jsp:include>
		<script>
			// 클릭했을 때
			$(".nav > ul > li > a").click(function(e) {
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