<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<jsp:include page="../include/importSource.jsp"></jsp:include>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
		<link rel="stylesheet" href="/resources/css/support/supportList.css">
		<title>펫 라운지 모금함</title>
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
				<input type="hidden">
				<a href="javascript:void(0)" class="category-links"
					data-category="all">
					<div class="category" 
						<c:if test="${sMap.category == 'all' }">style="background-color: #ffd370;"</c:if>
						<c:if test="${sMap.category != 'all' }">style="background-color: #F2F2F2;"</c:if>>
						<div>
							<p class="category-p" 
							<c:if test="${sMap.category != 'all' }">style="color: black;"</c:if>
							<c:if test="${sMap.category == 'all' }">style="color: white;"</c:if>>전체</p>
						</div>
					</div>
				</a> <a href="javascript:void(0)" class="category-links"
					data-category="residence">
					<div class="category"
						<c:if test="${sMap.category == 'residence' }">style="background-color: #ffd370;"</c:if>
						<c:if test="${sMap.category != 'residence' }">style="background-color: #F2F2F2;"</c:if>>
						<div>
							<p class="category-p" 
							<c:if test="${sMap.category != 'residence' }">style="color: black;"</c:if>
							<c:if test="${sMap.category == 'residence' }">style="color: white;"</c:if>>주거</p>
						</div>
					</div>
				</a> <a href="javascript:void(0)" class="category-links"
					data-category="living">
					<div class="category"
						<c:if test="${sMap.category == 'living' }">style="background-color: #ffd370;"</c:if>
						<c:if test="${sMap.category != 'living' }">style="background-color: #F2F2F2;"</c:if>>
						<div>
							<p class="category-p"
							<c:if test="${sMap.category != 'living' }">style="color: black;"</c:if>
							<c:if test="${sMap.category == 'living' }">style="color: white;"</c:if>>생계</p>
						</div>
					</div>
				</a> <a href="javascript:void(0)" class="category-links"
					data-category="health">
					<div class="category" s
						<c:if test="${sMap.category == 'health' }">style="background-color: #ffd370;"</c:if>
						<c:if test="${sMap.category != 'health' }">style="background-color: #F2F2F2;"</c:if>>
						<div>
							<p class="category-p"
							<c:if test="${sMap.category != 'health' }">style="color: black;"</c:if>
							<c:if test="${sMap.category == 'health' }">style="color: white;"</c:if>>건강</p>
						</div>
					</div>
				</a> <a href="javascript:void(0)" class="category-links"
					data-category="improvement">
					<div class="category"
						<c:if test="${sMap.category == 'improvement' }">style="background-color: #ffd370;"</c:if>
						<c:if test="${sMap.category != 'improvement' }">style="background-color: #F2F2F2;"</c:if>>
						<div>
							<p class="category-p"
							<c:if test="${sMap.category != 'improvement' }">style="color: black;"</c:if>
							<c:if test="${sMap.category == 'improvement' }">style="color: white;"</c:if>>개선</p>
						</div>
					</div>
				</a>
				<!-- 글쓰기 버튼 (관리자만 보임)-->
				<c:if test="${sessionScope.uId == 'admin' }">
					<button class="btn-create"
						onClick="location.href='/support/insert.pet'">후원 등록</button>
				</c:if>
			</section>
			<!-- 정렬 -->
			<div class="sorting-wrap">
				<div class="sorting" style="">
					<button name="" id="sorting-label" class="sorting-label">
						<c:if test="${sMap.sort == 'latest' }">최신순</c:if>
						<c:if test="${sMap.sort == 'mostFunded' }">모금액 많은 순</c:if>
						<c:if test="${sMap.sort == 'leastFunded' }">모금액 적은 순</c:if>
						<c:if test="${sMap.sort == 'highestFunded' }">모금률 높은 순</c:if>
						<c:if test="${sMap.sort == 'endingSoonest' }">종료임박 순</c:if>
					</button>
					<ul class="optionList">
						<li class="optionItem" data-sort="latest">최신순</li>
						<li class="optionItem" data-sort="mostFunded">모금액 많은 순</li>
						<li class="optionItem" data-sort="leastFunded">모금액 적은 순</li>
						<li class="optionItem" data-sort="highestFunded">모금률 높은 순</li>
						<li class="optionItem" data-sort="endingSoonest">종료임박 순</li>
					</ul>
				</div>
			</div>
			<!-- 후원 목록 -->
			<section id="content">
	
				<div class="container" data-aos="fade-up">
					<div class="row gy-4 portfolio-container" id="portfolio">
						<div class="col-xl-3 col-md-6 portfolio-item">
							<div class="card-today">
								<div class="label-today">Today</div>
								<br> <strong style="font-size: 20px;">오늘 함께한 기부금</strong>
								<div class="hr"></div>
								<div class="today-text">
									<fmt:formatNumber var="todayCount" value="${sHistory.todayCount }" pattern="#,###"></fmt:formatNumber>
									<fmt:formatNumber var="todayAmount" value="${sHistory.todayAmount }" pattern="#,###"></fmt:formatNumber>
									<strong>${todayCount }명</strong>이 <br> <strong>${todayAmount }원</strong>을<br>
									기부하였습니다.
								</div>
							</div>
						</div>
						<!-- 후원 목록 -->
						<c:forEach var="support" items="${ sList }" varStatus="i">
							<div class="col-xl-3 col-md-6 portfolio-item">
								<div class="cards" style="border-radius: 20px;">
									<div>
										<a href="/support/detail.pet?sNo=${support.sNo }"
											class="a-detail"> <img src="${support.sImageUrl }"
											class="card-img"
											onerror="this.src='https://petlounge.s3.ap-northeast-2.amazonaws.com/noimage.jpg'">
										</a>
									</div>
									<div class="card-content">
										<script>
											$(document).ready(function() {
												const title = "${support.sTitle}";
												const truncatedTitle = title.length > 27 ? title.substring(0, 26) + '...' : title;
												$(".s-title").eq(${i.index}).text(truncatedTitle);
											});
										</script>
										<div style="height: 45px;">
											<strong class="card-title"> <a
												href="/support/detail.pet?sNo=${support.sNo }"
												class="a-detail s-title" title="More Details"></a>
											</strong>
										</div>
										<div class="card-group">${support.sGroup }</div>
										<!-- 퍼센트 계산 -->
										<div class="card-bar">
											<span class="card-bar-collection" id="graph-num"
												style="width: ${(support.sFundAmount / support.sTargetAmount) * 100}%;"></span>
										</div>
										<div>
											<fmt:parseNumber var="percent"
												value="${(support.sFundAmount / support.sTargetAmount) * 100 }"
												integerOnly="true" />
											<strong class="card-percent" id="per-num">${percent}%</strong>
											<strong class="card-money"> <fmt:formatNumber
													var="formattedAmount" pattern="#,###"
													value="${support.sFundAmount}" /> ${formattedAmount } <span
												class="text">원</span>
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
						<ul id="pagination" class="pagination">
							<!-- 페이징 -->
							<c:if test="${sPInfo.startNavi ne '1' }">
								<c:url var="prevUrl" value="/support/sList.pet">
									<c:param name="page" value="${sPInfo.startNavi-1 }"></c:param>
									<c:param name="category" value="${sMap.category }"></c:param>
									<c:param name="sort" value="${sMap.sort }"></c:param>
								</c:url>
								<li class="page-item">
									<a class="page-link" href="${prevUrl }" class="first">
										<i class="bi bi-caret-left-fill"></i>
									</a>
								</li>
							</c:if>
	
							<c:forEach begin="${sPInfo.startNavi }" end="${sPInfo.endNavi }" var="p">
								<c:url var="pageUrl" value="/support/sList.pet">
									<c:param name="page" value="${p }"></c:param>
									<c:param name="category" value="${sMap.category }"></c:param>
									<c:param name="sort" value="${sMap.sort }"></c:param>
								</c:url>
								<c:choose>
									<c:when test="${p == sPInfo.currentPage}">
										<li class="page-item active"><a href="${pageUrl}" class="page-link">${p}</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a href="${pageUrl}" class="page-link">${p}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
	
							<c:if test="${sPInfo.endNavi ne sPInfo.naviTotalCount }">
								<c:url var="nextUrl" value="/support/sList.pet">
									<c:param name="page" value="${sPInfo.endNavi+1 }"></c:param>
									<c:param name="category" value="${sMap.category }"></c:param>
									<c:param name="sort" value="${sMap.sort }"></c:param>
								</c:url>
								<li class="page-item">
									<a class="page-link" href="${nextUrl }" class="last">
										<i class="bi bi-caret-right-fill"></i>
									</a>
								</li>
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
	        const sort = item.getAttribute('data-sort');
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
	        
	        <!-- 카테고리, 정렬 선택 시 이동  -->
			$(".category-links, .optionItem").click(function() {
				// 선택한 category와 sort 값을 가져오기
			    var selectedCategory = $(this).data("category");
			    var selectedSort = $(this).data("sort");
			    
			    // 현재 URL 가져오기
			    var currentURL = window.location.href;
			    
			    // 현재 URL에서 기존의 "category" 및 "sort" 매개변수 값을 추출
			    var url = new URL(currentURL);
			    var existingCategory = url.searchParams.get("category");
			    var existingSort = url.searchParams.get("sort");
			    
			    // category 또는 sort 값이 변경되었는지 확인
			    var categoryChanged = existingCategory !== selectedCategory;
			    var sortChanged = existingSort !== selectedSort;
				
			    if(!selectedCategory) {
			    	selectedCategory = existingCategory;
			    }
			    if(!selectedSort) {
			    	selectedSort = existingSort;
			    }
			    
			    
				// 새로운 URL을 구성
				if (categoryChanged || sortChanged) {
				     var newURL = "/support/sList.pet?page=1&";
				     if (categoryChanged) {
				         newURL += "category=" + selectedCategory + "&";
				     } else {
				    	 newURL += "category=" + existingCategory + "&";
				     }
				     if (sortChanged) {
				         newURL += "sort=" + selectedSort;
				     } else {
				    	 newURL += "sort=" + existingSort;
				     }
				     // 새로운 URL로 이동
				     window.location.href = newURL;
				}
			});
        </script>
	</body>
</html>