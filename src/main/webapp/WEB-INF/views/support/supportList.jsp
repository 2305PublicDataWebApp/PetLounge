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
		<link rel="stylesheet" href="/resources/css/support/supportList.css">
		<title>Pet Lounge</title>
	</head>
	<body>
		<jsp:include page="../include/header.jsp"></jsp:include>
		
		<main id="main">
            <section id="title">
                <h1>펫 라운지 모금함</h1>
                <div id="line"></div>
            </section>
            <!-- 카테고리 -->
            <section id="category-wrap">
                <a href="#">
                    <div class="category" style="background-color:#ffd370;">
                        <div><p style="color:white;">전체</p></div>
                    </div>
                </a>
                <a href="#">
                    <div class="category" style="background-color:#F2F2F2;">
                        <div><p style="color:black;">주거</p></div>
                    </div>
                </a>
                <a href="#">
                    <div class="category" style="background-color:#F2F2F2;">
                        <div><p style="color:black;">생계</p></div>
                    </div>
                </a>
                <a href="#">
                    <div class="category" style="background-color:#F2F2F2;">
                        <div><p style="color:black;">건강</p></div>
                    </div>
                </a>
                <a href="#">
                    <div class="category" style="background-color:#F2F2F2;">
                        <div><p style="color:black;">개선</p></div>
                    </div>
                </a>
                <!-- 글쓰기 버튼 (관리자만 보임)-->
                <button class="btn-create" onClick="location.href='/support/insert.do'">후원 등록</button>
            </section>
            <!-- 정렬 -->
            <div class="sorting-wrap">
                <div class="sorting" style="">
                    <button name="" id="sorting-label" class="sorting-label">최신순</button>
                    <ul class="optionList">
                        <li class="optionItem">최신순</li>
                        <li class="optionItem">모금액 많은 순</li>
                        <li class="optionItem">모금액 적은 순</li>
                        <li class="optionItem">모금률 높은 순</li>
                        <li class="optionItem">종료임박 순</li>
                    </ul>
                </div>
            </div>
            <!-- 후원 목록 -->
            <section id="content">
            
            	<div class="container" data-aos="fade-up">
	                
	                <div class="row gy-4 portfolio-container">
	                	<div class="col-xl-3 col-md-6 portfolio-item filter-books">
			                <div class="card-today">
			                    <div class="label-today">Today</div><br>
			                    <strong style="font-size: 20px;">오늘 함께한 기부금</strong>
			                    <div class="hr"></div>
			                    <div class="today-text">
			                        900명이 <br>
			                        4,234,500원을<br>
			                        기부하였습니다.
			                    </div>
			                </div>  
		                </div>  
		                <c:forEach var="support" items="${ sList }" varStatus="i">
		                	<div class="col-xl-3 col-md-6 portfolio-item filter-books">
				                <div class="cards" style="border-radius: 20px;">
				                	<div>
					                	<a href="/support/detail.do?sNo=${support.sNo }" >
		                                         <img src="/resources/images/cat.jpg" class="card-img"
					                    	onerror="this.src='https://petrounge.s3.ap-northeast-2.amazonaws.com/noimage.png'"></a>
				                	</div>
				                    <div class="card-content">
				                        <strong class="card-title"><a href="/support/detail.do?sNo=${support.sNo }" title="More Details">${support.sTitle }</a></strong>
				                        <div class="card-group">${support.sGroup }</div>
				                        <div class="card-bar">
				                            <sapn class="card-bar-collection" id="graph-num" style="width: ${(support.sFundAmount / support.sTargetAmount) * 100}%;"></sapn>
				                        </div>
				                        <div>
					                        <fmt:parseNumber var="percent"
													value="${(support.sFundAmount / support.sTargetAmount) * 100 }"
													integerOnly="true" />
					                        <strong class="card-percent" id="per-num">${percent}%</strong>
					                        <strong class="card-money">
					                            ${support.sFundAmount }
					                            <span class="text">원</span>
					                        </strong>
				                        </div>
				                    </div>
				                </div>
			                </div>
		                </c:forEach>
	                </div>
                </div>
                
            </section>
            <section id="page-wrap">
                <div class="mt-5 d-flex justify-content-center">
                        <nav aria-label="Page navigation exampler">
                            <ul class="pagination">
	                        	<c:if test="${pInfo.startNavi ne '1' }">
	                        		<li class="page-item"><a class="page-link" href="/support/list.do?page=${pInfo.startNavi-1 }" class="first">prev</a></li>
			                    </c:if>
			                    
			                    
			                    <c:forEach begin="${pInfo.startNavi }" end="${pInfo.endNavi }" var="p">
									<c:url var="pageUrl" value="/support/list.do">
										<c:param name="page" value="${p }"></c:param>
									</c:url>
									<c:choose>
					                    <c:when test="${p == pInfo.currentPage}">
					                        <li class="page-item active" ><a href="${pageUrl}" class="page-link" style="background-color: #4365BC">${p}</a></li>
					                    </c:when>
					                    <c:otherwise>
					                        <li class="page-item"><a href="${pageUrl}" class="page-link">${p}</a></li>
					                    </c:otherwise>
					                </c:choose>
								</c:forEach>
								
								
								
								<c:if test="${pInfo.endNavi ne pInfo.naviTotalCount }">
									<li class="page-item"><a class="page-link" href="/support/list.do?page=${pInfo.endNavi+1 }" class="last">next</a></li>
								</c:if>
                            </ul>
                        </nav>
                    </div>
            </section>
        </main>

		<jsp:include page="../include/footer.jsp"></jsp:include>
		<script>
            <!-- 정렬바 -->
            const label = document.querySelector('.sorting-label');
            const options = document.querySelectorAll('.optionItem');

            // 클릭한 옵션의 텍스트를 라벨 안에 넣음
            const handleSelect = (item) => {
            label.parentNode.classList.remove('active');
            label.innerHTML = item.textContent;
            }
            // 옵션 클릭시 클릭한 옵션을 넘김
            options.forEach(option => {
                option.addEventListener('click', () => handleSelect(option))
            })

            // 라벨을 클릭시 옵션 목록이 열림/닫힘
            label.addEventListener('click', () => {
            if(label.parentNode.classList.contains('active')) {
                label.parentNode.classList.remove('active');
            } else {
                label.parentNode.classList.add('active');
            }
            })
        </script>
	</body>
</html>