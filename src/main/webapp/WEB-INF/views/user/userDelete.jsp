<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<jsp:include page="../include/importSource.jsp"></jsp:include>
		
		
		<link rel="stylesheet" href="/resources/css/user/userDelete.css">
		<link rel="stylesheet" href="/resources/css/user/userDeleteForm.css">
		<link rel="stylesheet" href="/resources/css/font.css">
		<link rel="stylesheet" href="/resources/css/reset.css">
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<title>Insert title here</title>
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
										<li><a href="/user/searchHospital.pet">즐겨찾는 병원</a></li>
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
									<h1 style="font-size: 1em; font-weight: bold;">회원탈퇴안내</h1>
								</div>
							</div>
							<div class="info_hr">
								<hr>
							</div>
						</div>
						<div>
							<form action="/user/delete.pet" method="post">
								<article class="find1">
									<!-- <h2>회원가입</h2> -->
									<!-- <p>펫 라운지 회원정보수정<br>회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인해주세요.</p> -->
	
									<div>
	
										<section id="content3">
											<h5 style="margin-bottom: 25px;"></h5>
	
											<div>
												<div>
													<p>탈퇴안내</p>
													<!-- <p style="margin-top: 45px;">비밀번호</p> -->
													<!-- <p>비밀번호 확인</p> -->
													<p style="margin-top: 334px;">비밀번호</p>
													<p style="margin-top: 66px;">탈퇴사유</p>
												</div>
	
												<div style="width: 357px;">
													<p style="width: 357px;">고객님께서 회원 탈퇴를 원하신다니 저희 펫라운지의
														서비스가 많이 부족하고 미흡했나 봅니다. 불편하셨던 점이나 불만사항을 알려주시면 적극 반영해서 고객님의
														불편함을 해결해 드리도록 노력하겠습니다.</p>
													<p style="width: 357px;">
														<strong style="color: red;">아울러 회원 탈퇴시의 아래 사항을
															숙지하시기 바랍니다.</strong>
													</p>
													<br>
													<ul style="width: 357px;">
														<li style="margin-bottom: 10px;">1. 회원 탈퇴 시 고객님의 정보는
															상품 반품 및 A/S를 위해 전자상거래 등에서의 소비자 보호에 관한 법률에 의거한 고객정보 보호정책에따라
															관리 됩니다.</li>
														<li style="margin-bottom: 10px;">2. 탈퇴 시 고객님께서 보유하셨던
															적립금은 모두 삭제 됩니다.</li>
														<li style="margin-bottom: 10px;">3. 회원 탈퇴 후 3개월간 재가입이
															불가능합니다.</li>
														<li style="margin-bottom: 10px;">4. 회원 탈퇴 시 컬리패스 해지는
															별도로 고객행복센터(1644-1107)를 통해서 가능합니다. 직접 해지를 요청하지 않으면 해지 처리가
															되지 않습니다.</li>
													</ul>
													<br> <br> <input type="text" name="uPw"
														placeholder="비밀번호를 입력하세요."><br> <br> <br>
													<br>
													<div>
														<label
															style="display: flex; flex-wrap: wrap; flex-direction: row; align-items: center; margin-bottom: 10px;">
															<input style="width: 14px; height: 14px;" type="checkbox">
															<span>고객서비스(병원, 날씨정보 등) 불만</span>
														</label> <label
															style="display: flex; flex-wrap: wrap; flex-direction: row; align-items: center; margin-bottom: 10px;">
															<input style="width: 14px; height: 14px;" type="checkbox">
															<span>사이트의 신뢰도 불만</span>
														</label> <label
															style="display: flex; flex-wrap: wrap; flex-direction: row; align-items: center; margin-bottom: 10px;">
															<input style="width: 14px; height: 14px;" type="checkbox">
															<span>방문 빈도가 낮음</span>
														</label> <label
															style="display: flex; flex-wrap: wrap; flex-direction: row; align-items: center; margin-bottom: 10px;">
															<input style="width: 14px; height: 14px;" type="checkbox">
															<span>개인 정보유출 우려</span>
														</label>
													</div>
												</div>
											</div>
											<br> <br>
	
											<button type="submit"  id="가입하기2" style="width: 357px;">탈퇴하기</button>
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
	
			//클릭했을 때
			// $(".nav > ul > li").click(function (e) {
			//     e.preventDefault();
			//     $(".nav > ul > li").removeClass("active");
			//     $(this).addClass("active");
			// });
	
			//마우스 오버 효과
			// $(".nav > ul > li > a").hover(function(){
			//     $(this).next('.subMenu').not(':animated').slideDown();
			//     }, function(){
			//     $(this).next('.subMenu').not(':animated').slideUp();
			// });
		</script>
	
	
	</body>
</html>