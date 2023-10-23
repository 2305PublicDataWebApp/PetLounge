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
		<title>아이디 확인</title>
		</head>
	<body>
		<jsp:include page="../include/header.jsp"></jsp:include>
		<main>
	
			<section style="padding-top: 170px;">
				<div id="wrap" class="clearfix" style="border: none; display: flex; justify-content: center;">
					
					<section class="contents">
						<div>
							<div class="title">
								<div class="info_img">
									<img src="/resources/images/pet.png">
								</div>
								<div class="info_h1">
									<h1 style="font-size: 1em; font-weight: bold;  width: 313px;">안녕하세요 펫라운지입니다.</h1>
								</div>
							</div>
							<div class="info_hr">
								<hr>
							</div>
						</div>
						<div>
							<form action="/user/findId.pet" method="get">
								<article class="find1">
									
	
									<div>
	
										<section id="content3">
											<h5 style="margin-bottom: 25px;"></h5>
	
											<div>
												<div>
													<p>이름</p> 
													<!-- <p style="margin-top: 45px;">비밀번호</p> -->
													<!-- <p>비밀번호 확인</p> -->
													<p>아이디</p>
	
	
												</div>
	
												<div style="width: 357px;">
													<input type="text"  value="${uOne.uName }" name="uId"  id="input" readonly><br>
													<br> <input type="text" name="uPw"value="${uOne.uId }" readonly
														id="input"><br> <br>
	
													<!-- <button class="중복확인버튼" style="margin-bottom: 17px;">중복확인</button><br> -->
	
													<!-- <button class="중복확인버튼" style="margin-bottom: 17px;">중복확인</button><br> -->
	
												</div>
											</div>
	
											<button type="button" onclick="showLogin();" style="width: 74%; margin: 0.5rem auto 0 7.4rem;">로그인</button>
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
	
		
			function showLogin() {
				location.href="/user/login.pet"
			}
			
		</script>
	
	</body>
</html>