<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<jsp:include page="../include/importSource.jsp"></jsp:include>
		
		<link rel="stylesheet" href="/resources/css/user/userFind.css">
		<link rel="stylesheet" href="/resources/css/font.css">
		<link rel="stylesheet" href="/resources/css/reset.css">
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
		<link href='https://fonts.googleapis.com/css?family=Roboto:400,300,100'
			rel='stylesheet' type='text/css'>
		
		
		<title>아이디/패스워드 찾기</title>
	</head>
	<body>
			<jsp:include page="../include/header.jsp"></jsp:include>
		<main>
			<section id="find-section">
			
				<div class="find-container">
					<div class="backbox">
						<div class="loginMsg">
							<div class="textcontent">
								<div
									style="float: left; display: flex; width: 300px; margin-bottom: 10px;">
									<img src="/resources/images/pet.png"
										style="width: 30px; height: 30px;">
									<p class="title" style="margin-left: 10px;">펫 라운지</p>
								</div>
								<p>비밀번호를 잊어버리셨나요?</p>
								<button id="switch1">비밀번호 찾기</button>
							</div>
						</div>
						<div class="signupMsg visibility">
							<div class="textcontent">
								<div
									style="float: left; display: flex; width: 300px; margin-bottom: 10px;">
									<img src="/resources/images/pet.png"
										style="width: 30px; height: 30px;">
									<p class="title" style="margin-left: 10px;">펫 라운지</p>
								</div>
								<p>아이디를 잊어버리셨나요?</p>
								<button id="switch2">아이디 찾기</button>
							</div>
						</div>
					</div>
					<!-- backbox -->
		
					<div class="frontbox">
						<div class="login">
							<h2>아이디 찾기</h2>
							<form action="/user/findId.pet" method="get">
							<div class="inputbox">
								<input type="text" name="uName" placeholder="  FULLNAME">
								<input type="text" name="uEmail" placeholder="  EMAIL">
							</div>
							<!-- <p>FORGET PASSWORD?</p> -->
							<button type="submit" data-bs-toggle="modal" data-bs-target="#findIdModal">확인</button>
							</form>
						</div>
		
						<div class="signup hide">
							<h2>비밀번호 찾기</h2>
							<form action="/user/findPw.pet" method="get">
							<div class="inputbox">
								<input type="text" name="uName" placeholder="  FULLNAME">
								<input type="text" name="uId" placeholder="  ID">		
							</div>
							<button type="submit">확인</button>
							</form>	
						</div>
		
					</div>
					<!-- frontbox -->
				</div>
		
			</section>
			
			
			<!-- 아이디찾기 Modal -->
<!--             <div class="modal fade" id="findIdModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true"> -->
<!--                 <div class="modal-dialog"> -->
<!--                 <div class="modal-content"> -->
<!--                     <div class="modal-body" style="margin-top: 20px;"> -->
<!--                     <div style="display: flex; justify-content: center; align-items: center;"> -->
<!--                     <img class="mb-4" src="../resources/images/pet.png" alt="" width="60px"> -->
<!--                         <h3 style="padding-left: 10px;">아이디 찾기</h3> -->
<!--                     </div> -->
<%--                     <h2>${ uOne.uId }?? ${user.uName}</h2> --%>
<!--                     </div> -->
<!--                     <div class="modal-footer" style="justify-content: center; padding: 20px; border: 0;"> -->
<!--                         <button type="button" id="findId" class="btn" onclick="findId()">로그인</button> -->
<!--                         <button type="button" class="btn" data-bs-dismiss="modal">창닫기</button> -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 </div> -->
<!--             </div> -->
            
            
		</main>
			<jsp:include page="../include/footer.jsp"></jsp:include>
	
		<script>
			var $loginMsg = $('.loginMsg'), $login = $('.login'), $signupMsg = $('.signupMsg'), $signup = $('.signup'), $frontbox = $('.frontbox');
	
			$('#switch1').on('click', function() {
				$loginMsg.toggleClass("visibility");
				$frontbox.addClass("moving");
				$signupMsg.toggleClass("visibility");
	
				$signup.toggleClass('hide');
				$login.toggleClass('hide');
			})
	
			$('#switch2').on('click', function() {
				$loginMsg.toggleClass("visibility");
				$frontbox.removeClass("moving");
				$signupMsg.toggleClass("visibility");
	
				$signup.toggleClass('hide');
				$login.toggleClass('hide');
			})
	
			setTimeout(function() {
				$('#switch1').click()
			}, 1000)
	
			setTimeout(function() {
				$('#switch2').click()
			}, 3000)
			
		</script>
	
	
	</body>
</html>