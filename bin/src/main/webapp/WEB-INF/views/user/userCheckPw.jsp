<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	
			<section style="padding-top: 120px;">
				<div id="wrap" class="clearfix">
					<aside class="aside">
						<h1 class="logo">
							<a href="#">프로필 사진</a>
						</h1>
						<nav class="nav" style="display: block;">
							<ul>
								<li><a href="#">회원관리</a>
									<ul class="subMenu">
										<li><a href="/user/userInfo.do">회원정보조회</a></li>
										<li><a href="/user/checkPw.do">회원정보수정</a></li>
										<li><a href="/user/delete.do">회원탈퇴</a></li>
									</ul></li>
								<li><a href="#">게시글관리</a>
									<ul class="subMenu">
										<li><a href="/user/searchBoard.do">게시글 조회</a></li>
										<li><a href="/user/searchBoardReply.do">댓글 조회</a></li>
										<li><a href="/user/searchBoardMark.do">북마크</a></li>
									</ul></li>
								<li><a href="#">후원관리</a>
									<ul class="subMenu">
										<li><a href="/user/searchSponsor.do">후원목록</a></li>
										<li><a href="/user/searchSponsorReply.do">후원댓글</a></li>
									</ul></li>
								<li><a href="#">병원관리</a>
									<ul class="subMenu">
										<li><a href="/user/searchHospital.do">즐겨찾는 병원</a></li>
										<li><a href="/user/searchHospitalReview.do">병원리뷰</a></li>
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
							<form action="/user/checkPw.do" method="post">
								<article class="find1">
									<p>
										펫 라운지 회원정보수정<br>회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인해주세요.
									</p>
	
									<div>
	
										<section id="content3">
											<h5 style="margin-bottom: 25px;"></h5>
	
											<div>
												<div>
													<p>아이디</p>
													<!-- <p style="margin-top: 45px;">비밀번호</p> -->
													<!-- <p>비밀번호 확인</p> -->
													<p>비밀번호</p>
	
	
												</div>
	
												<div style="width: 357px;">
													<input type="text"  value="${uId }" name="uId"  id="input" readonly><br>
													<br> <input type="password" name="uPw" placeholder="비밀번호를 입력하세요."
														id="input"><br> <br>
	
													<!-- <button class="중복확인버튼" style="margin-bottom: 17px;">중복확인</button><br> -->
	
													<!-- <button class="중복확인버튼" style="margin-bottom: 17px;">중복확인</button><br> -->
	
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