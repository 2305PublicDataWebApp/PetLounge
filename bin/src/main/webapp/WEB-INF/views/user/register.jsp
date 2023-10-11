<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jsp:include page="../include/importSource.jsp"></jsp:include>

<link rel="stylesheet" href="/resources/css/user/myPage/register.css">
<link rel="stylesheet" href="/resources/css/font.css">
<link rel="stylesheet" href="/resources/css/reset.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
<style>
/* 체크박스 스타일 */
.custom-checkbox .custom-control-input:checked ~ .custom-control-label::before
	{
	background-color: #007bff;
	border-color: #007bff;
}

/* 전체 동의 체크박스 스타일 */
.custom-control-input:checked ~ .custom-control-label::before {
	background-color: #007bff;
	border-color: #007bff;
}

.custom-control-input:checked ~ .accordion-button::before {
	background-color: #007bff;
}
</style>
<title>회원가입</title>
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<main>

		<section>
			<form action="/userRegister/page.do" method="get">
				<article class="find1">
					<h2>회원가입</h2>
					<p>
						펫 라운지 회원가입을 환영합니다.<br>회원으로 가입하시면 다양한 혜택과 서비스를 이용하실 수 있습니다.
					</p>

					<div>
						<input id="tab1" type="radio" name="tabs" checked>
						<!--디폴트 메뉴-->
						<label for="tab1"><img src="/resources/images/user/register/join.png"><br>STEP
							1<br>가입하기</label> <input id="tab2" type="radio" name="tabs">
						<label for="tab2"><img src="/resources/images/user/register/checked.png"><br>STEP
							2<br>약관동의</label> <input id="tab3" type="radio" name="tabs">
						<label for="tab3"><img src="/resources/images/user/register/infoInput.png"><br>STEP
							3<br>정보입력</label> <input id="tab4" type="radio" name="tabs">
						<label for="tab4"><img src="/resources/images/user/register/done.png"><br>STEP
							4<br>가입완료</label>

						<section id="content1">
							<div>
								<h4 style="margin-top: 20px;">펫 라운지 간편 회원가입</h4>
								<p>펫 라운지 회원으로 가입합니다.</p>
								<br>
								<button id="가입하기1" style="border-radius: 20px;">회원가입</button>
							</div>

							<div></div>

							<div>
								<h4>SNS 계정 회원가입</h4>
								<p>SNS 계정을 이용하여 펫 라운지 회원으로 가입합니다.</p>
								<br>
								<div>
									<img src="/resources/images/user/register/kakaoBtn.png">
									<p>카카오톡으로 회원가입</p>
								</div>
								<div>
									<img src="/resources/images/user/register/googleBtn.png">
									<p>구글로 회원가입</p>
								</div>
								<div>
									<img src="/resources/images/user/register/naverBtn.png">
									<p>네이버로 회원가입</p>
								</div>
							</div>
						</section>

						<section id="content2">
							<label style="margin-top: 30px;"><input type="checkbox"
								id="전체동의"> 전체 동의</label>
							<hr>
							<div class="accordion" id="accordionExample">
								<div class="accordion-item">
									<h2 class="accordion-header">
										<label class="accordion-button collapsed" type="button"
											data-bs-toggle="collapse" data-bs-target="#collapseOne"
											aria-expanded="false" aria-controls="collapseOne"><input
											type="checkbox"> 회원 이용 약관 (필수) </label>
									</h2>
									<div id="collapseOne" class="accordion-collapse collapse"
										data-bs-parent="#accordionExample">
										<div class="accordion-body">
											<strong style="color: red">아닙니다</strong> 그렇지 않습니다.
										</div>
									</div>
								</div>

								<div class="accordion-item">
									<h2 class="accordion-header">
										<label class="accordion-button collapsed" type="button"
											data-bs-toggle="collapse" data-bs-target="#collapseTwo"
											aria-expanded="false" aria-controls="collapseTwo"><input
											type="checkbox"> 개인정보 수집 및 이용 (필수) </label>
									</h2>
									<div id="collapseTwo" class="accordion-collapse collapse"
										data-bs-parent="#accordionExample">
										<div class="accordion-body">
											<strong>This is the second item's accordion body.</strong> It
											is hidden by default, until the collapse plugin adds the
											appropriate classes that we use to style each element. These
											classes control the overall appearance, as well as the
											showing and hiding via CSS transitions. You can modify any of
											this with custom CSS or overriding our default variables.
											It's also worth noting that just about any HTML can go within
											the
											<code>.accordion-body</code>
											, though the transition does limit overflow.
										</div>
									</div>
								</div>

								<div class="accordion-item">
									<h2 class="accordion-header">
										<label class="accordion-button collapsed" type="button"
											data-bs-toggle="collapse" data-bs-target="#collapseThree"
											aria-expanded="false" aria-controls="collapseThree"><input
											type="checkbox"> SMS 마케팅 수신 동의 (선택)</label>
									</h2>
									<div id="collapseThree" class="accordion-collapse collapse"
										data-bs-parent="#accordionExample">
										<div class="accordion-body">
											<strong>This is the third item's accordion body.</strong> It
											is hidden by default, until the collapse plugin adds the
											appropriate classes that we use to style each element. These
											classes control the overall appearance, as well as the
											showing and hiding via CSS transitions. You can modify any of
											this with custom CSS or overriding our default variables.
											It's also worth noting that just about any HTML can go within
											the
											<code>.accordion-body</code>
											, though the transition does limit overflow.
										</div>
									</div>
								</div>
							</div>

							<p>정보수신에 동의하지 않아도 정상적인 서비스 이용이 가능합니다. 거래 정보, 결제/교환/환불 등과 관련된
								내용은 거래 안전을 위하여 수신동의 여부와 관계없이 발송됩니다.</p>
							<button id="다음으로1">다음으로</button>
						</section>

						<section id="content3">
							<h5 style="margin-bottom: 25px; margin-top: 70px;">필수 입력 정보</h5>

							<div>
								<div>
									<p style="margin-bottom: 83px;">프로필 사진</p>
									<p style="margin-top: 5px;">아이디</p>
									<p style="margin-top: 45px;">비밀번호</p>
									<p>비밀번호 확인</p>
									<p>이름</p>
									<p style="margin-bottom: 23px;">닉네임</p>
									<p style="margin-top: 44px;">이메일</p>
									<p style="padding-top: 27px;">휴대전화</p>

								</div>

								<div>
									<div style="display: flex; justify-content: space-between;">
										<img id="preview"
											style="width: 70%; height: 100px; border: 1px solid #999; border-radius: 20px;" />
										<input type="file" name="fileUpload" onchange="readURL(this);"
											class="form-control" required=""
											style="width: 26%; padding-top: 35px; border: 1px solid #999;">
									</div>
									<br> <input type="text" placeholder="아이디를 입력하세요.">
									<button class="중복확인버튼">중복확인</button>
									<br> <input type="password" placeholder="영문, 숫자 조합 6~12자"><br>
									<br> <input type="password" placeholder="영문, 숫자 조합 6~12자"><br>
									<br> <input type="text" placeholder="이름을 입력하세요."><br>
									<br> <input type="text" placeholder="닉네임을 입력하세요.">
									<button class="중복확인버튼" style="margin-bottom: 17px;">중복확인</button>
									<br> <input type="email"> @ <select size="1"
										style="border-radius: 20px;">
										<option>hanmail.net</option>
										<option>naver.com</option>
										<option>gmail.com</option>
										<option>hotmail.com</option>
										<option>nate.com</option>
									</select><br>
									<button class="중복확인버튼" style="margin-bottom: 17px;">중복확인</button>
									<br> <input type="tel" placeholder="예) 010-1234-1375"><br>
								</div>
							</div>
							<div class="join2">
								<h5></h5>
								<div>
									<div>
										<p>주소</p>
									</div>

									<div>
										<input type="address" placeholder="우편번호">
										<button>주소검색</button>
										<br> <input type="address" placeholder="도로명주소"><br>
										<input type="address" placeholder="상세주소"><br> <br>
									</div>
								</div>
							</div>




							<button id="가입하기2">가입하기</button>
						</section>

						<section id="content4">
							<img src="/resources/images/pet.png"">
							<h4>회원가입이 완료되었습니다!</h4>
							<p>
								모든 회원가입 절차가 완료되었습니다.<br>로그인 후 다양한 혜택과 서비스를 이용하실 수 있습니다.
							</p>
							<button style="border-radius: 20px;">메인으로</button>
						</section>
					</div>
				</article>
			</form>


		</section>


	</main>
	<jsp:include page="../include/footer.jsp"></jsp:include>

	<script>
        // JavaScript 코드
        document.addEventListener("DOMContentLoaded", function () {
            // 모든 탭을 숨기고 content1만 표시
            const contents = document.querySelectorAll('section[id^="content"]');
            contents.forEach(content => {
                content.style.display = 'none';
            });
            document.getElementById('content1').style.display = 'block';

            // "회원가입" 버튼 클릭 이벤트 처리
            const 가입하기1 = document.getElementById('가입하기1');
            가입하기1.addEventListener('click', () => {
                // 약관동의 탭으로 변경
                contents.forEach(content => {
                    content.style.display = 'none';
                });
                document.getElementById('content2').style.display = 'block';

                // 탭 버튼도 변경
                document.getElementById('tab2').checked = true;
            });

            // "다음으로" 버튼 클릭 이벤트 처리
            const 다음으로1 = document.getElementById('다음으로1');
            다음으로1.addEventListener('click', () => {
                // 정보입력 탭으로 변경
                contents.forEach(content => {
                    content.style.display = 'none';
                });
                document.getElementById('content3').style.display = 'block';

                // 탭 버튼도 변경
                document.getElementById('tab3').checked = true;
            });

            // "가입하기" 버튼 클릭 이벤트 처리
            const 가입하기2 = document.getElementById('가입하기2');
            가입하기2.addEventListener('click', () => {
                // 가입완료 탭으로 변경
                contents.forEach(content => {
                    content.style.display = 'none';
                });
                document.getElementById('content4').style.display = 'block';

                // 탭 버튼도 변경
                document.getElementById('tab4').checked = true;
            });

            // 탭 클릭 이벤트 처리
            const tabs = document.querySelectorAll('input[name="tabs"]');
            tabs.forEach(tab => {
                tab.addEventListener('change', (event) => {
                    const targetContentId = event.target.id.replace('tab', 'content');
                    contents.forEach(content => {
                        content.style.display = 'none';
                    });
                    document.getElementById(targetContentId).style.display = 'block';
                });
            });
        });


        // "전체 동의" 체크박스 클릭 이벤트 처리
        const 전체동의 = document.getElementById('전체동의');
        전체동의.addEventListener('change', () => {
            const isChecked = 전체동의.checked;
            // 약관 체크박스들의 상태 변경
            const 약관체크박스들 = document.querySelectorAll('.accordion-button input[type="checkbox"]');
            약관체크박스들.forEach(약관체크박스 => {
                약관체크박스.checked = isChecked;
            });
        });



        function readURL(input) {
    	  if (input.files && input.files[0]) {
    	    var reader = new FileReader();
    	    reader.onload = function(e) {
    	      document.getElementById('preview').src = e.target.result;
    	    };
    	    reader.readAsDataURL(input.files[0]);
    	  } else {
    	    document.getElementById('preview').src = "";
    	  }
    	}


    </script>


</body>
</html>