<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jsp:include page="../include/importSource.jsp"></jsp:include>

<link rel="stylesheet" href="/resources/css/user/userUpdate.css">
<link rel="stylesheet" href="/resources/css/user/userUpdateForm.css">
<link rel="stylesheet" href="/resources/css/font.css">
<link rel="stylesheet" href="/resources/css/reset.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>회원정보수정</title>
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<main>

		<section style="padding-top: 120px;">
			<div id="wrap" class="clearfix">
				<aside class="aside">
					<div class="logo">
						<!-- 프로필 사진 등록 전 -->
						<c:if test="${ user.uFileReName eq null }">
							<img class="logoImgNo" src="/resources/images/user/cat.png"
								alt="로고">
						</c:if>

						<!-- 프로필 사진 -->
						<c:if test="${ user.uFileReName ne null }">
							<img class="logoImg"
								src="../resources/userUploadFiles/${user.uFileReName }"
								alt="프로필">
						</c:if>
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
								<h1 style="font-size: 1em; font-weight: bold;">회원정보수정</h1>
							</div>
						</div>
						<div class="info_hr">
							<hr>
						</div>
					</div>
					<div>
						<form action="/user/update.pet" method="post">
							<input type="hidden" name="uId" value="${uId}">
							<article class="find1">
								<!-- <h2>회원가입</h2> -->
								<p>
									펫 라운지 회원정보를 수정수정수정.<br>여기에도 뭔가 쓰고싶당 서비스를 이용하실 수 있습니다.
								</p>

								<div>

									<section id="content3">
										<h5 style="margin-bottom: 25px;"></h5>

										<div>
											<div>
												<p style="margin-top: 3px;">아이디</p>
												<p style="margin-top: 47px;">비밀번호</p>
												<p style="margin-top: 30px">비밀번호 확인</p>
												<p style="margin-top: 30px; margin-bottom: 30px;">이름</p>
												<p style="margin-bottom: 23px;">닉네임</p>
												<p style="margin-top: 50px;">이메일</p>
												<p style="padding-top: 23px;">휴대전화</p>

											</div>

											<div style="width: 357.5px;">
												<input type="text" value="${user.uId }" readonly>
												<button class="중복확인버튼">중복확인</button>
												<br> <input type="password" name="uPw"
													placeholder="영문, 숫자 조합 6~12자"><br>
												<br> <input type="password" name="uPwRe"
													placeholder="영문, 숫자 조합 6~12자"><br>
												<br> <input type="text" value="${user.uName }"
													name="uName" readonly><br>
												<br> <input type="text" name="uNickName"
													placeholder="닉네임을 입력하세요.">
												<button class="중복확인버튼" style="margin-bottom: 17px;">중복확인</button>
												<br> <input type="text" name="uEmailPrefix"
													id="uEmailPrefix" placeholder="이메일을 입력하세요."
													oninput="combineEmail()" style="width: 184px;" required>@
												<select name="uEmailSuffix" id="uEmailSuffix" size="1"
													style="border-radius: 20px;" onchange="combineEmail()">
													<option>hanmail.net</option>
													<option>naver.com</option>
													<option>gmail.com</option>
													<option>hotmail.com</option>
													<option>nate.com</option>
												</select> <input type="hidden" name="uEmail" id="uEmail" value=""><br>
												<button class="중복확인버튼" style="margin-bottom: 17px;">중복확인</button>
												<br> <input type="tel" name="uPhone"
													placeholder="예) 010-1234-1375"><br>
												<br>
											</div>
										</div>
										<div class="join2">
											<h5></h5>
											<div style="margin-top: 7px;">
												<div>
													<p>주소</p>
												</div>

												<div>
													<input type="address" id="userZipcode" placeholder="우편번호"
														required>
													<button id="addrsearch" onclick="sample4_exeDaumPostcode()">주소검색</button>
													<br> <input type="address" name="uAddr" id="userAddr"
														placeholder="도로명주소" required><br>
													<br>
												</div>
											</div>
										</div>




										<button id="가입하기2">수정하기</button>
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

	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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

		//주소 api
		function sample4_exeDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							document.querySelector("#userZipcode").value = data.zonecode;
							document.querySelector("#userAddr").value = data.roadAddress;
						}
					}).open();
		}

		//이메일 합치기
		function combineEmail() {
			// 앞부분과 뒷부분의 값을 가져와서 합칩니다.
			const uEmailPrefix = document.getElementById("uEmailPrefix").value;
			const uEmailSuffix = document.getElementById("uEmailSuffix").value;
			const combinedEmail = uEmailPrefix + "@" + uEmailSuffix;

			// 합친 이메일 주소를 숨겨진 input 요소에 설정합니다.
			document.getElementById("uEmail").value = combinedEmail;
		}

		// 주소 API 열기
		function sample4_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 선택한 주소 정보를 사용해 필요한 작업을 수행합니다.
							// 예를 들어, 주소 필드에 주소 정보를 설정하거나 다른 작업을 수행할 수 있습니다.

							// 팝업 창을 닫습니다.
							document.querySelector('#daumPostcodeFrame').style.display = 'none';
						}
					}).open({
				autoClose : true
			});
		}

		// 주소 검색 버튼 클릭 이벤트 처리
		const 주소검색버튼 = document.getElementById('addrsearch'); // 주소검색버튼의 ID에 실제 ID를 넣어주어야 합니다.

		주소검색버튼.addEventListener('click', function(event) {
			event.preventDefault(); // 폼 제출 동작을 막음
			// 주소 검색 팝업 또는 로직을 실행하도록 추가 코드를 넣으세요
			// 주소 검색 팝업 또는 로직은 이 코드 블록 내에 들어가야 합니다.
		});
	</script>
</body>
</html>