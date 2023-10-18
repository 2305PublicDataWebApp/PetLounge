<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<header>
    <nav class="navbar navbar-expand-custom navbar-mainbg">
        <a class="navbar-brand navbar-logo" href="/home.pet">
            <div id="nav-logo-div">
                <img src="/resources/images/pet-white.png" alt="로고" width="25px" height="25px" id="logo-img">
                <span id="nav-pet-lounge">펫 라운지</span>
            </div>    
        </a>
        <button class="navbar-toggler" type="button" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <i class="fas fa-bars text-white"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <div class="hori-selector"><div class="left"></div><div class="right"></div></div>
            <ul class="navbar-nav">
                <li class="nav-item" id="hospitalLink">
                    <a class="nav-link" href="/hospital/page.pet">동물병원 안내</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/weather/weather.pet">산책 날씨 예보</a>
                </li>
                <li class="nav-item" id="supportLink">
                    <a class="nav-link" href="/support/list.pet">펫 라운지 모금함</a>
                </li>
                <li class="nav-item" id="noticeLink">
                    <a class="nav-link" href="/notice/notice_list.pet">공지사항</a>
                </li>
                <li class="nav-item" id="faqLink">
                    <a class="nav-link" href="/faq/list.pet">FAQ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/board/free_list.pet">자유게시판</a>
                </li>
            </ul>
            <c:if test="${ sessionScope.uId eq null }">
	            <ul class="navbar-nav ml-auto">
	                <li class="nav-item">
	                    <a class="nav-link" href="/user/login.pet">로그인</a>
	                </li>
	                <li class="nav-item">
	                    <a class="nav-link" href="/user/register.pet">회원가입</a>
	                </li>
	            </ul>            
            </c:if>
            <c:if test="${ sessionScope.uId ne null }">
	            <ul class="navbar-nav ml-auto">
	                <li class="nav-item">
	                    <a class="nav-link" href="/user/logout.pet">로그아웃</a>
	                </li>
	                <c:if test="${ sessionScope.uId eq 'admin' }">
		                <li class="nav-item">
		                    <a class="nav-link" href="/admin/main_board.pet">관리자페이지</a>
		                </li>
	                </c:if>
	                <c:if test="${ sessionScope.uId ne 'admin' }">
		                <li class="nav-item">
		                    <a class="nav-link" href="/user/userInfo.pet">마이페이지</a>
		                </li>
	                </c:if>
	            </ul>            
            </c:if>
        </div>
    </nav>
</header>

 <script>
     // var currentURL = window.location.pathname;
 
     // // 각 메뉴 항목의 URL과 비교하여 활성 클래스를 추가
     // $('.navbar-nav a').each(function () {
     //     var linkURL = $(this).attr('href');
     //     if (currentURL === linkURL) {
     //         $(this).addClass('active');
     //     }
     // });
 </script>
 <script>
     // ---------Responsive-navbar-active-animation-----------
     function test(){
         var tabsNewAnim = $('#navbarSupportedContent');
         var selectorNewAnim = $('#navbarSupportedContent').find('li').length;
         var activeItemNewAnim = tabsNewAnim.find('.active');
         var activeWidthNewAnimHeight = activeItemNewAnim.innerHeight();
         var activeWidthNewAnimWidth = activeItemNewAnim.innerWidth();
         var itemPosNewAnimTop = activeItemNewAnim.position();
         var itemPosNewAnimLeft = activeItemNewAnim.position();
         $(".hori-selector").css({
             "top":itemPosNewAnimTop.top + "px", 
             "left":itemPosNewAnimLeft.left + "px",
             "height": activeWidthNewAnimHeight + "px",
             "width": activeWidthNewAnimWidth + "px"
         });
         $("#navbarSupportedContent").on("click","li",function(e){
             $('#navbarSupportedContent ul li').removeClass("active");
             $(this).addClass('active');
             var activeWidthNewAnimHeight = $(this).innerHeight();
             var activeWidthNewAnimWidth = $(this).innerWidth();
             var itemPosNewAnimTop = $(this).position();
             var itemPosNewAnimLeft = $(this).position();
             $(".hori-selector").css({
                 "top":itemPosNewAnimTop.top + "px", 
                 "left":itemPosNewAnimLeft.left + "px",
                 "height": activeWidthNewAnimHeight + "px",
                 "width": activeWidthNewAnimWidth + "px"
             });
         });
     }
     $(document).ready(function(){
         setTimeout(function(){ test(); });
     });
     $(window).on('resize', function(){
         setTimeout(function(){ test(); }, 500);
     });
     $(".navbar-toggler").click(function(){
         $(".navbar-collapse").slideToggle(300);
         setTimeout(function(){ test(); });
     });
 
 
 
     // --------------add active class-on another-page move----------
     jQuery(document).ready(function($){
         // Get current path and find target link
         var path = window.location.pathname;
 
         // Account for home page with empty path
         if ( path == '' ) {
             path = 'home.html';
         }
 
         var target = $('#navbarSupportedContent ul li a[href="'+path+'"]');
         // Add active class to target link
         target.parent().addClass('active');
     });
 
 
 
     // Add active class on another page linked
     // ==========================================
     // $(window).on('load',function () {
     //     var current = location.pathname;
     //     console.log(current);
     //     $('#navbarSupportedContent ul li a').each(function(){
     //         var $this = $(this);
     //         // if the current path is like this link, make it active
     //         if($this.attr('href').indexOf(current) !== -1){
     //             $this.parent().addClass('active');
     //             $this.parents('.menu-submenu').addClass('show-dropdown');
     //             $this.parents('.menu-submenu').parent().addClass('active');
     //         }else{
     //             $this.parent().removeClass('active');
     //         }
     //     })
     // });
</script>
<script>
    // 현재 페이지 경로 가져오기
    var currentPath = window.location.pathname;

    // 조건 확인 후 메뉴 업데이트
    if (currentPath === '/hospital/detail.pet' || currentPath === '/hospital/search.pet') {
        // '/hospital/detail.pet' 경로에 해당하는 경우
        document.getElementById('hospitalLink').classList.add('active');
    } else {
        // 다른 경우
        document.getElementById('hospitalLink').classList.remove('active');
    }
    
    if (currentPath === '/support/list.pet' || currentPath === '/support/detail.pet' 
    		|| currentPath === '/support/insert.pet' || currentPath === '/support/update.pet' 
    		|| currentPath === '/support/payment.pet' || currentPath === '/support/complete.pet') {
        document.getElementById('supportLink').classList.add('active');
    } else {
        document.getElementById('supportLink').classList.remove('active');
    }
    
    if (currentPath === '/notice/notice_list.pet' || currentPath === '/notice/notice_submit.pet' 
		|| currentPath === '/notice/notice_detail.pet' || currentPath === '/notice/notice_search.pet' 
		|| currentPath === '/notice/notice_update.pet' || currentPath === '/notice/delete.pet') {
    document.getElementById('noticeLink').classList.add('active');
	} else {
	    document.getElementById('noticeLink').classList.remove('active');
	}
    
    if (currentPath === '/faq/list.pet' || currentPath === '/faq/insert.pet'
    		|| currentPath === '/faq/modify.pet') {
    document.getElementById('faqLink').classList.add('active');
	} else {
	    document.getElementById('faqLink').classList.remove('active');
	}
</script>
