<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<jsp:include page="../include/importSource.jsp"></jsp:include>
		
		<link rel="stylesheet" href="/resources/css/user/userBoardForm.css">
		<link rel="stylesheet" href="/resources/css/user/userBoardList.css">
		<link rel="stylesheet" href="/resources/css/user/userBoardPage.css">
		<link rel="stylesheet" href="/resources/css/font.css">
		<link rel="stylesheet" href="/resources/css/reset.css">
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<title>즐겨찾는 병원</title>
	</head>
	<body>
		<jsp:include page="../include/header.jsp"></jsp:include>
		<main>
	
			<section style="padding-top: 170px;">
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
										<li><a href="/user/uBoard.pet">게시글 조회</a></li>
										<li><a href="/user/uBoardReply.pet">댓글 조회</a></li>
										<li><a href="/user/uBoardMark.pet">북마크</a></li>
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

<!-- 											<option value="all">전체</option> -->
<!-- 											<option value="name">이름</option> -->
<!-- 											<option value="id">아이디</option> -->
<!-- 											<option value="nickname">닉네임</option> -->
										</select> <input class="form-control" type="text" name="searchKeyword"
											placeholder="검색" value="${paramMap.searchKeyword }"
											style="width: 73%; height: 28px; text-indent: 5px; border-radius: 20px; margin-left: 10px; border-color: #FFD370; padding-top: 10px; margin-right: 10px;" />
										<input type="submit" value="검색"  
											style="background-color: #ffd370; color: white; border-color: #ffd370; width: 10%; height: 28px; border-radius: 20px; margin-left: 0; padding-top: 3px;">
									</div>
								</form>
							</div>
						<table class="table table-borderd  table-fixed">
							<colgroup>
								<col width="10%">
								<col width="25%">
								<col width="40%">
								<col width="25%">
							</colgroup>
							<thead>
								<tr>
									<th style="border-bottom: 1px solid #dee2e6;">No</th>
									<th style="border-bottom: 1px solid #dee2e6; width: 165px;">병원명</th>
									<th style="border-bottom: 1px solid #dee2e6;">주소</th>
									<th style="border-bottom: 1px solid #dee2e6;">전화번호</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty hList }">
										<tr>
											<td class="right1" id="none" colspan="5"><i
												class="bi bi-file-earmark-x" id="fail"></i>검색결과가 없습니다!</td>
										</tr>
										<script>
											// 검색 결과가 없을 때, pagination 숨기기
											$(document).ready(function() {
												$(".page").hide();
											});
										</script>
									</c:when>
									<c:otherwise>
										<c:forEach items="${hList }" var="hList" varStatus="i">
											<c:url var="detailUrl" value="/hospital/detail.pet">
												<c:param name="hNo" value="${hList.hNo }"></c:param>
											</c:url>
											<tr onclick="window.location.href='${detailUrl}'" id="tr">
												<td>${(totalCount - i.index) - ((aInfo.currentPage - 1) * aInfo.recordCountPerPage)}</td>
												<td>${hList.hName }</td>
												<%-- 											 <td>${hList.hAddr}</td> --%>
												<c:set var="inputString" value="${hList.hAddr}" />
												<!-- sList.sTitle 값을 inputString 변수에 저장 -->
												<td style="text-align: left; padding-left: 25px;">
													<!-- 왼쪽 정렬 스타일을 적용 --> <c:choose>
														<c:when test="${fn:length(inputString) > 15}">
															<!-- 만약 문자열 길이가 5를 초과한다면 -->
															<c:set var="truncatedString"
																value="${fn:substring(inputString, 0, 15)}..." />
															<!-- 문자열을 자르고 "..."을 추가하여 truncatedString 변수에 저장 -->
															<c:out value="${truncatedString}" />
															<!-- truncatedString을 출력 -->
														</c:when>
														<c:otherwise>
															<c:out value="${inputString}" />
															<!-- 그렇지 않으면 원래 문자열을 출력 -->
														</c:otherwise>
													</c:choose>
												</td>
												<td style="width: 135px;"><c:if
														test="${hList.hPhone eq null}">
										        번호정보없음
											    </c:if> <c:if test="${hList.hPhone ne null}">
													${hList.hPhone }
											    </c:if></td>
											</tr>
										</c:forEach>

									</c:otherwise>
								</c:choose>

							</tbody>
						</table>
						<br><br>
							
							<div aria-label="Page navigation example" class="page">
							
							<c:url var="prevUrl" value="/user/searchHospital.pet">
								<c:param name="page" value=""></c:param>
								<c:param name="searchCondition" value="${paramMap.searchCondition }"></c:param>
								<c:param name="searchKeyword" value="${paramMap.searchKeyword }"></c:param>
								<c:param name="uId" value="${sessionScope.uId}"></c:param>
							</c:url>
							<div></div>
				            <ul style="display: flex; justify-content: center;">
					         	<c:if test="${aInfo.startNavi != 1 }">
						            <li class="boardLi"  ><a class="page-link" id="pageBtn"  href="${prevUrl }" ><img src="/resources/images/user/previous.png" style="width: 13px;"></a></li>&nbsp;
					            </c:if>
					         
					            <c:forEach begin="${aInfo.startNavi }" end="${aInfo.endNavi }" var="p">
									<c:url var="pageUrl" value="/user/searchHospital.pet">
										<c:param name="page" value="${p }"></c:param>
										<c:param name="searchCondition" value="${paramMap.searchCondition }"></c:param>
										<c:param name="searchKeyword" value="${paramMap.searchKeyword }"></c:param>
										<c:param name="uId" value="${sessionScope.uId}"></c:param>
									</c:url>
										<c:if test="${ aInfo.currentPage ne p }">
						            	<li class="boardLi"><a class="page-link" id="pageBtn"  href="${pageUrl }">${p }</a></li>
										</c:if>
										<c:if test="${ aInfo.currentPage eq p }">
						            	<li class="boardLi"><a class="page-link" id="pageBtnSelect"  href="${pageUrl }">${p }</a></li>
										</c:if>						            </c:forEach>
					            <c:if test="${aInfo.endNavi != aInfo.naviTotalCount }">
									<c:url var="nextUrl" value="/user/searchHospital.pet"> 
										<c:param name="page" value="${aInfo.endNavi + 1 }"></c:param>
										<c:param name="searchCondition" value="${paramMap.searchCondition }"></c:param>
										<c:param name="searchKeyword" value="${paramMap.searchKeyword }"></c:param>
										<c:param name="uId" value="${sessionScope.uId}"></c:param>
									</c:url>
						            &nbsp;<li class="boardLi"><a class="page-link" id="pageBtn" href="${nextUrl }"><img src="/resources/images/user/next.png" style="width: 13px;"></a></li>
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