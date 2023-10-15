<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="/resources/css/reset.css">
        <link rel="stylesheet" href="/resources/css/font.css">
        <link rel="stylesheet" href="/resources/css/main.css">
        <link rel="stylesheet" href="/resources/css/mainNav.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/3.0.3/normalize.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.2.3/animate.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <title>Pet Lounge</title>
    </head>
    <body>
        <header id="header">
            <!-- 메뉴 토글 -->
            <nav class="nav">
                <!-- <img src="/resources/images/pet.png" alt="" width="50px" height="50px"> -->
                <button class="toggle-menu">
                    <span></span>
                </button>
            </nav>

            <!-- 메뉴 내용 -->
            <section id="menu">
                <nav class="main-nav">
                    <ul>
                        <li>
                            <a href="/hospital/page.pet">
                                동물병원 안내
                            </a>
                        </li>
                        <li>
                            <a href="/weather/weather.pet">
                                산책 날씨 예보
                            </a>
                        </li>
                        <li>
                            <a href="/support/list.pet">
                                펫 라운지 모금함
                            </a>
                        </li>
                        <li class="dropdown">
                            <a href="#">
                                휴게실
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="/notice/notice_list.pet">공지사항</a></li>
                                <li><a href="/faq/list.pet">FAQ</a></li>
                                <li><a href="board/free_list.pet">자유게시판</a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
    
                <!-- 회원관리 -->
                <div class="menu-footer">
                    <nav class="footer-nav">
                    	<c:if test="${ sessionScope.uId eq null }">
	                        <ul>
	                            <li>
	                                <a href="/user/login.pet">
	                                    <i class="fa fa-sign-in user-icon"></i>
	                                    login
	                                </a>
	                            </li>
	                            <li>
	                                <a href="/user/register.pet">
	                                    <i class="fa fa-solid fa-plus user-icon"></i>
	                                    register
	                                </a>
	                            </li>
	                        </ul>
                        </c:if>
                    	<c:if test="${ sessionScope.uId ne null }">
	                        <ul>
	                            <li>
	                                <a href="/user/logout.pet">
	                                    <i class="fa fa-sign-out user-icon"></i>
	                                    logout
	                                </a>
	                            </li>
   	                            <c:if test="${ sessionScope.uId eq 'admin' }">
	                            	<li>
		                                <a href="/admin/main_board.pet">
		                                    <i class="fa fa-regular fa-user user-icon"></i>
		                                    admin page
		                                </a>
		                            </li>
	                            </c:if>
	                            <c:if test="${ sessionScope.uId ne 'admin' }">
		                            <li>
		                                <a href="/user/userInfo.pet">
		                                    <i class="fa fa-regular fa-user user-icon"></i>
		                                    my page
		                                </a>
		                            </li>
	                            </c:if>
	                        </ul>
                        </c:if>
                    </nav>
                </div>
            </section>
        </header>

        <main>
            <!-- 페이지 네비게이션 -->
            <nav class="page-navigation">
                <ul>
                    <li><a href="#section1" class="active"></a></li>
                    <li><a href="#section2"></a></li>
                    <li><a href="#section3"></a></li>
                    <li><a href="#section4"></a></li>
                </ul>
            </nav>

            <!-- 펫 라운지 -->
            <section class="container" id="section1">
                <div class="container-box">
                    <h1 class="main-title">Pet Lounge</h1>
                    <p class="info">펫 라운지(Pet Lounge)는 반려동물을 사랑하는 모두에게 유용한 정보와 커뮤니티를 제공하여, <br>반려동물과의 특별한 순간을 더욱 즐겁게 만들어줍니다</p>
                    <p class="scroll-down-arrow">
                        <span class="material-symbols-outlined" class="arrow-down-icon" style="font-size: 5em; padding-top: 50px; color: white;">
                            keyboard_double_arrow_down
                        </span>
                    </p>
                </div>
            </section>
    
            <!-- 동물병원 안내 -->
            <section class="container second" id="section2">
                <div class="container-box">
                    <div>
                        <h1 class="title">동물병원 안내</h1>
                        <p class="info">펫 라운지를 통해 주변 동물병원을 간편하게 찾아보세요<br>반려동물의 건강은 행복의 첫걸음입니다</p>
                    </div>
                    <form action="/hospital/page.pet" method="get" id="search-hospital-form">
                        <div>
                            <input type="search" name="hSearchKeyword" id="h-search-keyword" class="search-input" placeholder="찾고자 하는 주소 또는 동물 병원의 이름을 입력하세요"> 
                            <span class="material-symbols-outlined search-icon" onclick="searchHospital();" style="font-size: 3.5em; color: #FFD370; cursor: pointer; margin-left: 10px;">
                                search
                            </span>
                        </div>
                    </form>
                    <!-- <a href="#">Learn more</a> -->
                </div>
            </section>

            <!-- 산책 날씨 예보 -->
            <section class="container third" id="section3">
                <div class="container-box">
                    <h1 class="title">산책 날씨 예보</h1>
                    <p class="info">펫 라운지는 반려동물과 함께 안전하고 즐거운 산책을 즐기는 데 도움을 드립니다</p>
                    <div>
                        <button class="link-btn" onclick="location.href='/weather/weather.pet'">오늘의 날씨 확인하기</button>
                    </div>
                </div>
            </section>

            <!-- 후원하기 -->
            <section class="container fourth" id="section4">
                <div class="container-box">
                    <div>
                        <h1 class="title">펫 라운지 모금함</h1>
                        <p class="info">펫 라운지에서 동물들에게 더 나은 삶을 선물하세요</p>
                    </div>
                    <div>
                        <div class="item">
                            <div class="img img-first"></div>
                            <div class="card">
                                <h3>Rock climbing</h3>
                                <p>The goal is to reach the summit of a formation or the endpoint of a usually pre-defined route without falling</p>
                                <a href="#">Learn more</a>
                            </div>
                        </div>
                        <div class="item">
                            <div class="img img-second"></div>
                                <div class="card">
                                    <h3>Caving</h3>
                                    <p>Exploring underground through networks of tunnels and passageways, which can be natural or artificial.</p>
                                    <a href="#">Learn more</a>
                                </div>
                            </div>
                        <div class="item">
                            <div class="img img-third"></div>
                            <div class="card">
                                <h3>Parachuting</h3>
                                <p>Jumping from an aeroplane and falling through the air before opening your parachute.</p>
                                <a href="#">Learn more</a>
                            </div>
                        </div>
                        
<!--                         <div class="item"> -->
<%-- 	                        <c:forEach var="support" items="${ sList }" varStatus="i" end="3"> --%>
<!-- 			                	<div class="col-xl-3 col-md-6 portfolio-item filter-books"> -->
<!-- 					                <div class="cards" style="border-radius: 20px;"> -->
<!-- 					                	<div> -->
<%-- 						                	<a href="/support/detail.pet?sNo=${support.sNo }" > --%>
<!-- 			                                         <img src="/resources/images/cat.jpg" class="card-img" -->
<!-- 						                    	onerror="this.src='https://petrounge.s3.ap-northeast-2.amazonaws.com/noimage.png'"></a> -->
<!-- 					                	</div> -->
<!-- 					                    <div class="card-content"> -->
<%-- 					                        <strong class="card-title"><a href="/support/detail.pet?sNo=${support.sNo }" title="More Details">${support.sTitle }</a></strong> --%>
<%-- 					                        <div class="card-group">${support.sGroup }</div> --%>
<!-- 					                        <div class="card-bar"> -->
<%-- 					                            <span class="card-bar-collection" id="graph-num" style="width: ${(support.sFundAmount / support.sTargetAmount) * 100}%;"></span> --%>
<!-- 					                        </div> -->
<!-- 					                        <div> -->
<%-- 						                        <fmt:parseNumber var="percent" --%>
<%-- 														value="${(support.sFundAmount / support.sTargetAmount) * 100 }" --%>
<%-- 														integerOnly="true" /> --%>
<%-- 						                        <strong class="card-percent" id="per-num">${percent}%</strong> --%>
<!-- 						                        <strong class="card-money"> -->
<%-- 						                            ${support.sFundAmount } --%>
<!-- 						                            <span class="text">원</span> -->
<!-- 						                        </strong> -->
<!-- 					                        </div> -->
<!-- 					                    </div> -->
<!-- 					                </div> -->
<!-- 				                </div> -->
<%-- 			                </c:forEach> --%>
<!--                         </div> -->
                    </div>
                    <div>
                        <button class="link-btn" onclick="location.href='/support/list.pet'">더 많은 후원 보기</button>
                    </div>
                </div>
            </section>
        </main>

        <footer></footer>

        <!-- 동물병원 검색 -->
        <script>
            function searchHospital() {
                var form = document.getElementById('search-hospital-form');
                form.submit();
            }
        </script>

        <!-- nav 메뉴 -->
        <script>
            $('.toggle-menu').click(function () {
                $(this).toggleClass('active');
                $('#menu').toggleClass('open');

                // 메뉴를 열 때 opacity를 0으로 설정하여 숨김
                if ($('#menu').hasClass('open')) {
                    $('.container-box, .page-navigation').css({
                        'opacity': '0',
                        'transition': 'opacity 0.8s ease' 
                    });
                } else {
                    // 메뉴를 닫을 때 opacity를 1로 설정하여 나타냄
                    $('.container-box, .page-navigation').css({
                        'opacity': '1',
                        'transition': 'opacity 0.8s ease'
                    });
                }
            });
        </script>

        <!-- 스크롤 이벤트 -->
        <script>
            window.addEventListener("wheel", function(e){
                e.preventDefault();
            },{passive : false});

            var mHtml = $("html");
            var page = 1;


            mHtml.animate({scrollTop : 0},10);

            $(window).on("wheel", function(e) {
                if(mHtml.is(":animated")) return;
                if(e.originalEvent.deltaY > 0) {
                    if(page == 4) return;
                    page++;
                } else if(e.originalEvent.deltaY < 0) {
                    if(page == 1) return;
                    page--;
                }
                var posTop =(page-1) * $(window).height();
                mHtml.animate({scrollTop : posTop});
            })

            // JavaScript로 현재 페이지 감지 및 활성화 클래스 관리
            $(document).ready(function() {
                var sections = $('.container'); // 각 섹션을 선택
                var navigationLinks = $('.page-navigation a'); // 네비게이션 링크 선택

                $(window).scroll(function() {
                    // 스크롤 이벤트를 사용하여 현재 페이지 감지
                    var currentPosition = $(this).scrollTop();

                    sections.each(function() {
                        var top = $(this).offset().top - 100;
                        var bottom = top + $(this).outerHeight();
                        
                        if (currentPosition >= top && currentPosition <= bottom) {
                            // 현재 페이지에 해당하는 섹션을 찾음
                            var currentSection = $(this);
                            var id = currentSection.attr('id');
                            page = id.match(/\d+/); // 네비게이션으로 페이지 이동 시, 현재 페이지 재정의

                            // 해당 섹션에 활성화 클래스 추가 및 다른 링크에서 제거
                            navigationLinks.removeClass('active');
                            $('a[href="#' + id + '"]').addClass('active');
                        }
                        
                    });
                });
            });

            // 네비게이션 링크 클릭 시 스크롤 이벤트 무시하고 스크롤 위치 조절
            $('.page-navigation a').click(function(e) {
                e.preventDefault(); // 기본 링크 동작을 막음
                var targetId = $(this).attr('href'); // 클릭한 링크의 href 속성값 (섹션의 ID)

                // 해당 섹션의 상단 위치를 계산하여 스크롤
                $('html, body').animate({
                    scrollTop: $(targetId).offset().top
                }, 700); // 700ms(0.7초) 동안 부드럽게 스크롤
            });
        </script>
    </body>
</html>