<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<jsp:include page="../include/importSource.jsp"></jsp:include>
		
		<link rel="stylesheet" href="/resources/css/user/userInfo.css">
		<link rel="stylesheet" href="/resources/css/user/userCheckPw.css">
		<link rel="stylesheet" href="/resources/css/font.css">
		<link rel="stylesheet" href="/resources/css/reset.css">
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<title>비밀번호 재확인</title>
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
									<h1 style="font-size: 1em; font-weight: bold;">비밀번호 확인</h1>
								</div>
							</div>
							<div class="info_hr">
								<hr>
							</div>
						</div>
						<div>
							<form action="/user/checkPw.pet" method="post">
								<article class="find1">
									<p>
										회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인해주세요.
									</p>
	
									<div>
	
										<section id="content3">
											<h5 style="margin-bottom: 25px;"></h5>
	
											<div>
												<div>
													<p>아이디</p>
													<p>비밀번호</p>
	
	
												</div>
	
												<div style="width: 357px;">
													<input type="text"  value="${uId }" name="uId"  id="input" readonly><br>
													<br> <input type="password" name="uPw" placeholder="비밀번호를 입력하세요."
														id="input"><br> <br>
	
												</div>
											</div>
	
											<button type="submit">확인</button>
										</section>
	
									</div>
								</article>
							</form>
	
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