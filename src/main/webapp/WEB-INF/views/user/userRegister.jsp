<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jsp:include page="../include/importSource.jsp"></jsp:include>

<link rel="stylesheet" href="/resources/css/user/userRegister.css">
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

section[id^="content"] {
	display: none;
}

section[id^="content"]:target {
	display: block;
}
</style>
<title>회원가입</title>
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<main>

		<section>
			<article class="find1">
				<h2 class="register_h2">회원가입</h2>
				<p>
					펫 라운지 회원가입을 환영합니다.<br>회원으로 가입하시면 다양한 혜택과 서비스를 이용하실 수 있습니다.
				</p>

				<div>
					<input id="tab1" type="radio" name="tabs" checked>
					<!--디폴트 메뉴-->
					<label for="tab1"><img
						src="/resources/images/user/join.png"><br>STEP 1<br>가입하기</label>
					<input id="tab2" type="radio" name="tabs"> <label
						for="tab2"><img src="/resources/images/user/checked.png"><br>STEP
						2<br>약관동의</label> <input id="tab3" type="radio" name="tabs">
					<label for="tab3"><img
						src="/resources/images/user/infoInput.png"><br>STEP 3<br>정보입력</label>
					<input id="tab4" type="radio" name="tabs"> <label
						for="tab4"><img src="/resources/images/user/done.png"><br>STEP
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
								<img src="/resources/images/user/kakaoBtn.png">
								<p>카카오톡으로 회원가입</p>
							</div>
							<div>
								<img src="/resources/images/user/googleBtn.png">
								<p>구글로 회원가입</p>
							</div>
							<div>
								<img src="/resources/images/user/naverBtn.png">
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
										type="checkbox" required> 회원 이용 약관 (필수) </label>
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
										type="checkbox" required> 개인정보 수집 및 이용 (필수) </label>
								</h2>
								<div id="collapseTwo" class="accordion-collapse collapse"
									data-bs-parent="#accordionExample">
									<div class="accordion-body">
										<strong>This is the second item's accordion body.</strong> It
										is hidden by default, until the collapse plugin adds the
										appropriate classes that we use to style each element. These
										classes control the overall appearance, as well as the showing
										and hiding via CSS transitions. You can modify any of this
										with custom CSS or overriding our default variables. It's also
										worth noting that just about any HTML can go within the
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
										classes control the overall appearance, as well as the showing
										and hiding via CSS transitions. You can modify any of this
										with custom CSS or overriding our default variables. It's also
										worth noting that just about any HTML can go within the
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

					<form action="/user/register.pet" method="post"
						enctype="multipart/form-data" id="registration-form">
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
										<input type="file" class="real-upload" accept="image/*"
											onchange="setThumbnail(event);" name="uploadFile" multiple
											style="display: none;" required>
										<div id="thumbnail" style="width: 100px; height: 100px;">
											<img id="image-preview"
												src="/resources/images/uploadfile.png"
												style="width: 100px; height: 100px; max-width: 100px; max-height: 100px; border-radius: 20px">
										</div>
										<!-- 											<input type="file" name="fileUpload" onchange="readURL(this);" class="form-control" style="width: 26%; padding-top: 35px; border: 1px solid #999;" required>										 -->
									</div>
									<br> <input type="text" name="uId"
										placeholder="아이디를 입력하세요." required>
									<button class="중복확인버튼">중복확인</button>
									<br> <input type="password" name="uPw"
										placeholder="영문, 숫자 조합 6~12자" required><br> <br>
									<input type="password" name="uPwRe"
										placeholder="영문, 숫자 조합 6~12자" required><br> <br>
									<input type="text" name="uName" placeholder="이름을 입력하세요."
										required><br> <br> <input type="text"
										name="uNickName" placeholder="닉네임을 입력하세요." required>
									<button class="중복확인버튼" style="margin-bottom: 17px;">중복확인</button>
									<br> <input type="text" name="uEmailPrefix"
										id="uEmailPrefix" placeholder="이메일을 입력하세요."
										oninput="combineEmail()" style="width: 184px;" required>
									@ <select name="uEmailSuffix" id="uEmailSuffix" size="1"
										style="border-radius: 20px;" onchange="combineEmail()">
										<option>hanmail.net</option>
										<option>naver.com</option>
										<option>gmail.com</option>
										<option>hotmail.com</option>
										<option>nate.com</option>
									</select> <input type="hidden" name="uEmail" id="uEmail" value=""><br>
									<button class="중복확인버튼" style="margin-bottom: 17px;">이메일
										인증</button>
									<br> <input type="tel" name="uPhone"
										placeholder="예) 01012341375" required><br>
								</div>
							</div>
							<div class="join2">
								<h5></h5>
								<div>
									<div>
										<p>주소</p>
									</div>

									<div>
										<input type="address" id="userZipcode" placeholder="우편번호"
											required>
										<button id="addrsearch" onclick="sample4_exeDaumPostcode()">주소검색</button>
										<br> <input type="address" name="uAddr" id="userAddr"
											placeholder="도로명주소" required><br>
									</div>
								</div>
							</div>




							<button type="submit" id="가입하기2">가입하기</button>
						</section>



						<section id="content4">
							<img src="/resources/images/pet.png"">
							<h4>회원가입이 완료되었습니다!</h4>
							<p>
								모든 회원가입 절차가 완료되었습니다.<br>로그인 후 다양한 혜택과 서비스를 이용하실 수 있습니다.
							</p>
							<button type="button" id="showMain"
								onclick="location.href='/home.pet'" style="border-radius: 20px;">메인으로</button>
						</section>
					</form>
				</div>
			</article>


		</section>


	</main>
	<jsp:include page="../include/footer.jsp"></jsp:include>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	
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

		    
		 // "가입하기2" 버튼 클릭 이벤트 처리
		    const 가입하기2 = document.getElementById('가입하기2');
		    가입하기2.addEventListener('click', (event) => {
		      event.preventDefault(); // 기본 폼 제출 동작 방지

		      // 가입하기2 버튼 클릭 시 content4로 전환
		      contents.forEach(content => {
		        content.style.display = 'none';
		      });
		      document.getElementById('content4').style.display = 'block';

		      // 탭 버튼도 변경
		      const tabs = document.querySelectorAll('input[name="tabs"]');
		      tabs.forEach(tab => (tab.checked = false));
		      document.getElementById('tab4').checked = true;
		    });
		
		    
		    // "다음으로" 버튼 클릭 이벤트 처리
		    const 다음으로1 = document.getElementById('다음으로1');
		    다음으로1.addEventListener('click', () => {
		        // 필수 체크박스들을 선택합니다.
		        const 필수체크박스들 = document.querySelectorAll('.accordion-button input[type="checkbox"][required]');
		        let 모두체크됨 = true;

		        // 필수 체크박스들이 모두 체크되었는지 확인합니다.
		        필수체크박스들.forEach(체크박스 => {
		            if (!체크박스.checked) {
		                모두체크됨 = false;
		            }
		        });

		        // 모든 필수 체크박스가 체크되지 않았을 경우, alert 창을 띄우고 다음 탭으로 이동하지 않습니다.
		        if (!모두체크됨) {
		            alert('필수 체크박스를 모두 체크해주세요.');
		        } else {
		            // 필수 체크박스가 모두 체크되었을 경우, 다음 탭으로 이동합니다.
		            contents.forEach(content => {
		                content.style.display = 'none';
		            });
		            document.getElementById('content3').style.display = 'block';

		            // 탭 버튼도 변경
		            document.getElementById('tab3').checked = true;
		        }
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

		document.addEventListener("DOMContentLoaded", function () {
		    const tabs = document.querySelectorAll('input[name="tabs"]');

		    tabs.forEach((tab) => {
		        tab.addEventListener('click', (e) => {
		            e.preventDefault(); // 기본 클릭 이벤트를 막음
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
//                     img.removeAttribute("style");
                }
                reader.readAsDataURL(image);
            }
        }
        
        
        //주소 api
        function sample4_exeDaumPostcode() {
			new daum.Postcode({
				oncomplete: function(data) {
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
        
        
        
        
        
        
        
        
     // 페이지 로딩 시 URL 해시가 변경될 때 탭을 활성화하는 함수
        function activateTab() {
          const hash = window.location.hash;
          if (hash) {
            const tab = document.querySelector(`input[name="tabs"][data-hash="${hash}"]`);
            if (tab) {
              tab.checked = true;
              // 스크롤 위치를 탭으로 이동하도록 설정
              tab.scrollIntoView();
            }
          }
        }

        // 탭 변경 이벤트 처리
        const tabs = document.querySelectorAll('input[name="tabs"]');
        tabs.forEach(tab => {
          tab.addEventListener('change', (event) => {
            const hash = event.target.getAttribute('data-hash');
            if (hash) {
              window.location.hash = hash;
            }
          });
        });

        // 페이지 로딩 시 탭을 활성화
        activateTab();
        
        
        









     // "가입하기2" 버튼 클릭 이벤트 처리
        const 가입하기2 = document.getElementById('가입하기2');
        가입하기2.addEventListener('click', (event) => {
            event.preventDefault(); // 기본 폼 제출 동작 방지

            // 폼 데이터 수집
            const formData = new FormData(document.getElementById('registration-form'));

            // AJAX 요청 생성
            const xhr = new XMLHttpRequest();
            xhr.open("POST", "/user/register.pet", true);
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4) {
                    if (xhr.status === 200) {
                        // 서버 응답이 성공인 경우
                        const response = JSON.parse(xhr.responseText);
                        if (response.success) {
                            // 가입완료 탭으로 변경
                            const tabs = document.querySelectorAll('input[name="tabs"]');
                            tabs.forEach(tab => (tab.checked = false));
                            document.getElementById("tab4").checked = true;

                            // URL에 #tab4를 추가하여 탭이 열리도록 함
                            window.location.hash = "tab4";
                        } else {
                            alert("회원가입에 실패했습니다. 다시 시도해주세요.");
                        }
                    } else {
                        alert("서버 오류로 인해 회원가입에 실패했습니다. 다시 시도해주세요.");
                    }
                }
            };

            // AJAX 요청 전송
            xhr.send(formData);
        });

        
        
     // 주소 API 열기
        function sample4_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function (data) {
                    // 선택한 주소 정보를 사용해 필요한 작업을 수행합니다.
                    // 예를 들어, 주소 필드에 주소 정보를 설정하거나 다른 작업을 수행할 수 있습니다.
                    
                    // 팝업 창을 닫습니다.
                    document.querySelector('#daumPostcodeFrame').style.display = 'none';
                }
            }).open({
                autoClose: true
            });
        }
        
     
     // 주소 검색 버튼 클릭 이벤트 처리
        const 주소검색버튼 = document.getElementById('addrsearch'); // 주소검색버튼의 ID에 실제 ID를 넣어주어야 합니다.

        주소검색버튼.addEventListener('click', function (event) {
            event.preventDefault(); // 폼 제출 동작을 막음
            // 주소 검색 팝업 또는 로직을 실행하도록 추가 코드를 넣으세요
            // 주소 검색 팝업 또는 로직은 이 코드 블록 내에 들어가야 합니다.
        });

	    </script>


</body>
</html>