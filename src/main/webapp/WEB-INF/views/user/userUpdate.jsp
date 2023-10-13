<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
								<h1 style="font-size: 1em; font-weight: bold;">회원정보수정</h1>
							</div>
						</div>
						<div class="info_hr">
							<hr>
						</div>
					</div>
					<div>
						<form action="/user/update.pet" method="post" enctype="multipart/form-data" id="registration-form">
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
												<p style="margin-bottom: 69px; margin-top: 8px;">프로필 사진</p>
												<p style="margin-top: 3px;">아이디</p>
												<p style="margin-top: 47px;">비밀번호</p>
												<p style="margin-top: 30px">비밀번호 확인</p>
												<p style="margin-top: 30px; margin-bottom: 30px;">이름</p>
												<p style="margin-bottom: 23px;">닉네임</p>
												<p style="margin-top: 50px;">이메일</p>
												<p style="padding-top: 23px;">휴대전화</p>

											</div>

											<div style="width: 357.5px;">
												<div style=" display: flex; justify-content: center; align-items: flex-end;">
													<input type="file" class="real-upload" accept="image/*"
														onchange="setThumbnail(event);" name="uploadFile" multiple
														style="display: none;" required>
													<div id="thumbnail" style="width: 100px; height: 100px; border-radius: 50%; border: 1px solid #999; display: flex; align-items: center; justify-content: center;">
															<img id="image-preview"
																src="${user.uFilePath }"
															style="width: 100px; height: 100px; max-width: 100px; max-height: 100px; border-radius: 50%; ">
													</div>
													<a id="deleteImg" style="display: flex; align-content: stretch; align-items: center"><img src="/resources/images/user/delete.png" style="width: 25px; height: 25px;"></a>
												</div>
												<br> <input type="text" value="${user.uId }" style="margin-top: -10px;" readonly>
												<button class="중복확인버튼">중복확인</button>
												<br> <input type="password" name="uPw"
													value="${user.uPw }"><br> <br> <input
													type="password" name="uPwRe" value="${user.uPw }"><br>
												<br> <input type="text" value="${user.uName }"
													name="uName" readonly><br> <br> <input
													type="text" name="uNickName" value="${user.uNickName }">
												<button class="중복확인버튼" style="margin-bottom: 17px;">중복확인</button>
												<br> <input type="text" name="uEmailPrefix"
													id="uEmailPrefix"
													value="${fn:substringBefore(user.uEmail, '@')}"
													oninput="combineEmail()" style="width: 199px;" required>@
												<select name="uEmailSuffix" id="uEmailSuffix" size="1"
													style="border-radius: 20px;"
													onchange="combineEmailSuffix()">
													<option value="hanmail.net"
														${fn:contains(user.uEmail, 'hanmail.net') ? 'selected' : ''}>hanmail.net</option>
													<option value="naver.com"
														${fn:contains(user.uEmail, 'naver.com') ? 'selected' : ''}>naver.com</option>
													<option value="gmail.com"
														${fn:contains(user.uEmail, 'gmail.com') ? 'selected' : ''}>gmail.com</option>
													<option value="hotmail.com"
														${fn:contains(user.uEmail, 'hotmail.com') ? 'selected' : ''}>hotmail.com</option>
													<option value="nate.com"
														${fn:contains(user.uEmail, 'nate.com') ? 'selected' : ''}>nate.com</option>
												</select> <input type="hidden" name="uEmail" id="uEmail"
													value="${user.uEmail}"><br>
												<button class="중복확인버튼" style="margin-bottom: 17px;">중복확인</button>
												<br> <input type="tel" name="uPhone"
													value="${user.uPhone }"><br> <br>
											</div>
										</div>
										<div class="join2">
											<h5></h5>
											<div style="margin-top: 7px;">
												<div>
													<p>주소</p>
												</div>

												<div>
													<input type="address" id="userZipcode" value="${user.uAddrNo }" name="uAddrNo"
														required>
													<button id="addrsearch" onclick="sample4_exeDaumPostcode()">주소검색</button>
													<br> <input type="address" name="uAddr" id="userAddr"
														value="${user.uAddr }" required><br>
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
		
		
		//이메일 @ 뒷부분 select value값 설정
		function combineEmailSuffix() {
		    const uEmailPrefix = document.getElementById("uEmailPrefix").value;
		    const uEmailSuffix = document.getElementById("uEmailSuffix").value;
		    const combinedEmail = uEmailPrefix + "@" + uEmailSuffix;
		    document.getElementById("uEmail").value = combinedEmail;
		}
		
		<!-- 이미지 div 선택시 파일 업로드 -->
        const realUpload = document.querySelector('.real-upload');
        const upload = document.querySelector('#thumbnail');
        upload.addEventListener('click', () => realUpload.click());
        <!-- 이미지 업로드 미리보기 -->
        function setThumbnail(event){
            for(const image of event.target.files){
                const reader = new FileReader();
                reader.onload = function(event){
                    const img = document.getElementById("image-preview");
                    img.src = event.target.result;
                }
                reader.readAsDataURL(image);
            }
        }
		

     	// 이미지 삭제 함수
        document.getElementById("deleteImg").addEventListener("click", function() {
            if (confirm("이미지를 삭제하시겠습니까?")) {
                // 이미지 삭제 로직을 추가
                // 예: 이미지 서버에서 삭제하거나, 이미지 정보를 빈 값으로 업데이트
                // user.setuFileName("");
                // user.setuFileReName("");
                // user.setuFilePath("");
                // user.setuFileLength(0L);
                // 이미지 미리보기 업데이트
                document.getElementById("image-preview").src = "/resources/images/user/upload.png";
            }
        });
     
     
		// 페이지가 로드되면 호출하여 우편번호를 설정합니다.
		//setZipcodeFromAddress();
	</script>
</body>
</html>