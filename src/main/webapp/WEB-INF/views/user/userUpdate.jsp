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
										<li><a href="/user/Board.pet">게시글 조회</a></li>
										<li><a href="/user/searchBoardReply.pet">댓글 조회</a></li>
										<li><a href="/user/searchBoardMark.pet">북마크</a></li>
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
									펫 라운지 회원정보를 수정합니다.<br>회원 정보를 최신 상태로 유지하려면 아래의 옵션을 활용해보세요.
								</p>

								<div>

									<section id="content3">
										<h5 style="margin-bottom: 25px;"></h5>

										<div>
											<div>
												<p style="margin-bottom: 91px; margin-top: 8px;"></p>
												<p style="margin-top: 3px;">아이디</p>
												<p style="margin-top: 30px;">비밀번호</p>
												<p style="margin-top: 30px">비밀번호 확인</p>
												<p style="margin-top: 30px; margin-bottom: 34px;">이름</p>
												<p style="margin-bottom: 23px;">닉네임</p>
												<p style="margin-top: 30px;">이메일</p>
												<p style="margin-top: 32px;">인증번호 확인</p>
												<p style="padding-top: 13px;">휴대전화</p>
												<p style="padding-top: 16px;">주소</p>
											</div>

											<div style="width: 357.5px;">
												<div style=" display: flex; justify-content: center; align-items: flex-end;">
													<input type="hidden" name="uFileName" value="${user.uFileName}">
													<input type="hidden" name="uFileReName" value="${user.uFileReName}">
													<input type="hidden" name="uFilePath" value="${user.uFilePath}">
													<input type="hidden" name="uFileLengthStr" value="${user.uFileLength}">
													<input type="file" class="real-upload" accept="image/*"
														onchange="setThumbnail(event);" name="uploadFile" style="display: none;">
													<div id="thumbnail" style="width: 100px; height: 100px; border-radius: 50%; border: 1px solid #999; display: flex; align-items: center; justify-content: center;">
															<img id="image-preview"
																src="${user.uFilePath }"
															style="width: 100%; height: 100%; max-width: 100px; max-height: 100px; border-radius: 50%; CURSOR: POINTER; ">
													</div>
													<a id="deleteImg" style="display: flex; align-content: stretch; align-items: center"><img src="/resources/images/user/delete.png" style="width: 25px; height: 25px;"></a>
												</div><br> 
												
												
												<input type="text" id="uId" value="${user.uId }" style="margin-top: -10px; background-color: rgba(255, 212, 112, 0.14);" readonly><br> 
													<span id="duplResult" style="font-size: 0.8em; width: 100%;"></span><br>
												
												<input type="password" name="uPw" id="uPw" value="${user.uPw }"><br> 
													<span id="duplPwResult" style="font-size: 0.8em; width: 100%;"></span><br>
												
												<input type="password" name="uPwRe" id="uPwRe" value="${user.uPw }"><br> 
													<span id="duplPwReResult" style="font-size: 0.8em; width: 100%;"></span><br>
											
												<input type="text" value="${user.uName }" name="uName" readonly style="background-color: rgba(255, 212, 112, 0.14);"><br><br> 
												
												<input type="text" id="uNickName" name="uNickName" value="${user.uNickName }"><br> 
													<span id="duplNickResult" style="font-size: 0.8em; width: 100%;"></span><br>
												
												<input type="text" name="uEmailPrefix" id="uEmailPrefix" value="${fn:substringBefore(user.uEmail, '@')}"
													oninput="combineEmail()" style="width: 199px;" required>@
												<select name="uEmailSuffix" id="uEmailSuffix" size="1" style="border-radius: 20px;" onchange="combineEmailSuffix()">
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
												</select> 
												<input type="hidden" name="uEmail" id="uEmail" value="${user.uEmail}">
												<button class="중복확인버튼" style="width: 60px; height: 8px; margin-left: 291px;">메일인증</button>
												
												<input type="text" placeholder="인증번호를 입력하세요" style="width: 58.4%;;" required>
												<button type="button" id="mailCheck">확인</button><br><br>
												
												<input type="tel" name="uPhone"  id="uPhone" value="${user.uPhone }"><br> 
													<span id="duplPhoneResult" style="font-size: 0.8em; width: 100%;"></span><br>
												
												<div>
												<input type="address" id="userZipcode" value="${user.uAddrNo }" name="uAddrNo" style="width: 58.4%;;" required>
												<button type="button" id="addrsearch" onclick="sample4_exeDaumPostcode()">주소검색</button>
												</div>
												<input type="address" name="uAddr" id="userAddr" value="${user.uAddr }" required><br><br>
											</div>
										</div>
										
<!-- 										<div class="join2"> -->
<!-- 											<h5></h5> -->
<!-- 											<div style="margin-top: 7px;"> -->
<!-- 												<div> -->
<!-- 													<p>주소</p> -->
<!-- 												</div> -->

<!-- 												<div> -->
<%-- 													<input type="address" id="userZipcode" value="${user.uAddrNo }" name="uAddrNo" --%>
<!-- 														required> -->
<!-- 													<button id="addrsearch" onclick="sample4_exeDaumPostcode()">주소검색</button> -->
<!-- 													<br> <input type="address" name="uAddr" id="userAddr" -->
<%-- 														value="${user.uAddr }" required><br> --%>
<!-- 													<br> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 										</div> -->




										<button id="join2" style="cursor: pointer !important;">수정하기</button>
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
     
     
        
        
      //닉네임 중복확인 및 유효성 검사
        $(document).ready(function() {
            $("#uNickName").on("change", function() {
                var uNickName = $("#uNickName").val();

                $.ajax({
                    url: "/user/checkNick.pet",
                    type: "POST",
                    data: {
                        "uNickName": uNickName
                    },
                    success: function(data) {
                        var result = JSON.parse(data);

                        if (result[0] === "Valid" && result[1] === "Unique") {
                            $("#duplNickResult").removeClass("error").addClass("success").css("color", "green");;
                            $("#duplNickResult").text("사용 가능한 닉네임입니다.");
                        } else if (result[0] === "Valid" && result[1] === "NotUnique") {
                            $("#duplNickResult").removeClass("success").addClass("error");
                            $("#duplNickResult").text("중복된 닉네임입니다.");
                        } else if (result[0] === "Invalid" && result[1] === "Unique") {
                            $("#duplNickResult").removeClass("success").addClass("error");
                            $("#duplNickResult").text("닉네임은 한글 문자 5자 이하 또는 영문자 5자 이하여야 합니다.");
                        }  else {
                            $("#duplNickResult").text("ajax 오류 관리자 문의 바람");
                        }
                    },
                    error: function() {
                        alert("ajax 오류, 큰일");
                    }
                });
            });
        });
        
        
        
        //비밀번호 유효성 검사
        $(document).ready(function() {
            $("#uPw").on("change", function() {
                var uPw = $("#uPw").val();

                $.ajax({
                    url: "/user/checkPwVal.pet",
                    type: "POST",
                    data: {
                        "uPw": uPw
                    },
                    success: function(data) {

                        if (data === "Valid") {
                            $("#duplPwResult").removeClass("error").addClass("success").css("color", "green");;
                            $("#duplPwResult").text("사용 가능한 비밀번호입니다.");
                        } else if (data === "Invalid") {
                            $("#duplPwResult").removeClass("success").addClass("error");
                            $("#duplPwResult").text("비밀번호는 영문과 숫자 조합이어야 하며, 1~10자여야 합니다.");
                        }   else {
                            $("#duplPwResult").text("ajax 오류 관리자 문의 바람");
                        }
                    },
                    error: function() {
                        alert("ajax 오류, 큰일");
                    }
                });
            });
        });
        
        
      //비밀번호 일치 확인
        $(document).ready(function() {
            $("#uPwRe").on("change", function() {
                var uPwRe = $("#uPwRe").val();
                var uPw = $("#uPw").val();

                $.ajax({
                    url: "/user/checkRePw.pet",
                    type: "POST",
                    data: {
                        "uPwRe": uPwRe,
                        "uPw": uPw
                    },
                    success: function(data) {

                        if (data === "success") {
                            $("#duplPwReResult").removeClass("error").addClass("success").css("color", "green");;
                            $("#duplPwReResult").text("비밀번호 일치");
                        } else if (data === "error") {
                            $("#duplPwReResult").removeClass("success").addClass("error");
                            $("#duplPwReResult").text("비밀번호가 일치하지 않습니다.");
                        }   else {
                            $("#duplPwReResult").text("ajax 오류 관리자 문의 바람");
                        }
                    },
                    error: function() {
                        alert("ajax 오류, 큰일");
                    }
                });
            });
        });
  
      
      
        // 전화번호 유효성 검사
        $(document).ready(function() {
            $("#uPhone").on("change", function() {
                var uPhone = $("#uPhone").val();

                $.ajax({
                    url: "/user/checkPhone.pet",
                    type: "POST",
                    data: {
                        "uPhone": uPhone
                    },
                    success: function(data) {

                        if (data === "Valid") {
                            $("#duplPhoneResult").removeClass("error").addClass("success").css("color", "green");;
                            $("#duplPhoneResult").text("사용 가능한 전화번호입니다.");
                        } else if (data === "Invalid") {
                            $("#duplPhoneResult").removeClass("success").addClass("error");
                            $("#duplPhoneResult").text("전화번호는 숫자 11자리여야 합니다.");
                        }   else {
                            $("#duplPhoneResult").text("ajax 오류 관리자 문의 바람");
                        }
                    },
                    error: function() {
                        alert("ajax 오류, 큰일");
                    }
                });
            });
        });
        
            
	</script>
</body>
</html>