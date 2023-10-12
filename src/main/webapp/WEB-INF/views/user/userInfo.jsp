<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<jsp:include page="../include/importSource.jsp"></jsp:include>
		
		
		<link rel="stylesheet" href="/resources/css/user/userInfo.css">
		<link rel="stylesheet" href="/resources/css/user/userMyPage.css">
		<link rel="stylesheet" href="/resources/css/font.css">
		<link rel="stylesheet" href="/resources/css/reset.css">
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		
		<title>회원정보조회</title>
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
										<li><a href="/user/userInfo.do?uId=${uId}">회원정보조회</a></li>
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
									<h1 style="font-size: 1em; font-weight: bold;">회원정보조회</h1>
								</div>
							</div>
							<div class="info_hr">
								<hr>
							</div>
						</div>
						<div>
							<form action="/user/userInfo.do" method="get">
							  <input type="hidden" name="uId" value="${uId}">
								<article class="find1">
									<!-- <h2>회원가입</h2> -->
									<p>
										펫 라운지 회원정보조회<br>여기에 뭔가 메세지가 쓰고싶다. 서비스를 이용하실 수 있습니다.
									</p>
	
									<div>
	
										<section id="content3">
											<h5 style="margin-bottom: 25px;"></h5>
	
											<div>
												<div>
													<p>아이디</p>
													<!-- <p style="margin-top: 45px;">비밀번호</p> -->
													<!-- <p>비밀번호 확인</p> -->
													<p>이름</p>
													<p>닉네임</p>
													<p>이메일</p>
													<p>휴대전화</p>
	
												</div>
	
												<div style="width: 357.5px;">
													<input type="text" value="${ user.uId }" readonly><br>
													<br>
													<!-- <button class="중복확인버튼">중복확인</button><br> -->
													<!-- <input type="password" placeholder="영문, 숫자 조합 6~12자"><br><br> -->
													<!-- <input type="password" placeholder="영문, 숫자 조합 6~12자"><br><br> -->
													<input type="text" value="${ user.uName }" readonly><br>
													<br> <input type="text" value="${ user.uNickName }" readonly><br>
													<br>
													<!-- <button class="중복확인버튼" style="margin-bottom: 17px;">중복확인</button><br> -->
													<input type="email" value="${ user.uEmail }" readonly style="width: 357.5px;"><br><br>
													<!-- <button class="중복확인버튼" style="margin-bottom: 17px;">중복확인</button><br> -->
													<input type="tel" value="${ user.uPhone }" readonly><br>
													<br>
												</div>
											</div>
											<div class="join2">
												<h5></h5>
												<div>
													<div>
														<p>주소</p>
													</div>
	
													<div>
<!-- 														<input type="address" placeholder="우편번호"> -->
														<!-- <button>주소검색</button><br> -->
														<input type="address" value="${ user.uAddr }" readonly style="width: 357.5px;"><br>
														<br>
													</div>
												</div>
											</div>
	
										<button type="submit" onclick="showCheckPwPage()">수정하기</button>
										</section>
	
									</div>
								</article>
							</form>
	
						</div>
					</section>
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
	
			function showCheckPwPage() {
				location.href="/user/checkPw.do"
			}
			
		</script>
	</body>
</html>