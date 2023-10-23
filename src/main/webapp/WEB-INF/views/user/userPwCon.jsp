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
		<style>
			.modal {
			  display: none;
			  position: fixed;
			  z-index: 1;
			  left: 0;
			  top: 0;
			  width: 100%;
			  height: 100%;
			  background-color: rgba(0, 0, 0, 0.7);
			}
			
			.modal-content {
			  position: relative;
			  background-color: #fefefe;
			  margin: 15% auto;
			  padding: 20px;
			  width: 70%;
			  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
			  text-align: center;
			}
			
			.close {
			  position: absolute;
			  right: 10px;
			  top: 10px;
			  color: #aaa;
			  font-size: 20px;
			  cursor: pointer;
			}			
		</style>
		<title>비밀번호 확인</title>
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
													<p>이메일</p> 
													<!-- <p style="margin-top: 45px;">비밀번호</p> -->
													<!-- <p>비밀번호 확인</p> -->
													<p>인증번호</p>
	
	
												</div>

											<div style="width: 357px;">
												<input type="text" name="uEmailPrefix" id="uEmailPrefix"
													placeholder="이메일을 입력하세요." oninput="combineEmail()"
													style="width: 194px;;" required> @ <select
													name="uEmailSuffix" id="uEmailSuffix" size="1"
													style="border-radius: 20px;" onchange="combineEmail()">
													<option>hanmail.net</option>
													<option>naver.com</option>
													<option>gmail.com</option>
													<option>hotmail.com</option>
													<option>nate.com</option>
												</select> <input type="hidden" name="uEmail" id="uEmail" value="">
												<div id="mailCheckBox" style="display: flex; padding-top: 7px;">
													<span id="duplEmailResult"
														style="font-size: 0.8em; width: 200px; padding-left: 3px;"></span>
													<button id="sendMailBtn" class="dupl" style="margin: 0; color: red; border:none; padding-right: 8px;">메일인증</button>
												</div>
												<!-- 컨트롤러에서 인증번호 받아온 값 저장 -> 입력된 인증번호와 비교 -->
												<input type="hidden" id="send-certification-num">
												<input type="text" id="user-email-check" placeholder="인증번호를 입력하세요" style="width: 58.4%;;" required>
												<button type="button" id="mailCheck" onclick="confirmNumber();" 
												style="color: black; width: 39.9% !important; background: #666 !important; border: 1px solid #666 !important; 
												color: white !important; padding: 11px !important; margin-left: 0 !important; margin-bottom: 0 !important; text-align: center !important; 
												text-decoration: none !important;">확인</button><br><br>
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


			<div id="myModal" class="modal">
				<div class="modal-content">
					<span class="close" onclick="closeModal()">&times;</span>
					<p>
						인증이 완료되었습니다. 비밀번호: <span id="password"></span>
					</p>
				</div>
			</div>

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
			
			
			//이메일 합치기
	        function combineEmail() {
		    // 앞부분과 뒷부분의 값을 가져와서 합칩니다.
		    const uEmailPrefix = document.getElementById("uEmailPrefix").value;
		    const uEmailSuffix = document.getElementById("uEmailSuffix").value;
		    const combinedEmail = uEmailPrefix + "@" + uEmailSuffix;
		
		    // 합친 이메일 주소를 숨겨진 input 요소에 설정합니다.
		    document.getElementById("uEmail").value = combinedEmail;
			}
			
			
			
	     // 이메일 인증 ajax
	        $(document).ready(function() {
	         $("#sendMailBtn").on("click",function(){
	            var emailVal = $("#uEmail").val();
	            if(emailVal == null || emailVal == ""){
	               alert("이메일을 먼저 입력해주세요.");
	               return;
	            } else {
	            	alert("인증번호가 발송되었습니다.");
	            }
	            	 
	            
//	             if($("#user-ck-email").val() === "false"){
//	                alert("사용할 수 없는 이메일입니다.")
//	             } else {
	              
	               
	               $.ajax({
	                  url : "/user/sendMail.pet",
	                  type : "POST",
	                  data : { mail : emailVal },
	                  success : function(data) {
	                     $("#send-certification-num").attr("value", data);
	                  },
	                  error : function() {
	                     alert:("ajax 오류, 관리자에게 문의 바랍니다.");
	                  }
	               });
//	             }
	         });
	      });
	        
// 	        function confirmNumber(){
// 	           var num1 = $("#user-email-check").val();
// 	           var num2 = $("#send-certification-num").val();
// 	           if(num1 == "" || num2 == "") {
// 	        	   alert("인증번호 전송 버튼을 눌러주세요.");
// 	           } else {
// 	        	   if(num1 == num2) {
// 	                   alert("인증이 완료되었습니다.");
// 	                   //일치할 때 유효성 체크 여부 확인을 위해서 값을 true로 넣어줌
// 	                   $("#check-certification-num").attr("value", "true");
// 	                   $("#user-email-check").attr("readonly", "true");
// 	                   $("#duplEmailResult").text("인증완료").removeClass("error").addClass("success").css("color", "green");
// 	                   conNumMsg = "success";
// 	                } else {
// 	                   alert("작성한 인증번호가 다릅니다.");
// 	                   $("#check-certification-num").attr("value", "false");
// 	                   $("#duplEmailResult").text("인증실패").removeClass("success").addClass("error").css("color", "red");
// 	                }
// 	           }
	           
// 	        }
	        
	        
	        
	        function openModal(password) {
	        	  var modal = document.getElementById("myModal");
	        	  var passwordSpan = document.getElementById("password");
	        	  passwordSpan.innerText = password;
	        	  modal.style.display = "block";
	        	}

	        	function closeModal() {
	        	  var modal = document.getElementById("myModal");
	        	  modal.style.display = "none";
	        	}
	        
	        	
	        	function confirmNumber(){
	        		  var num1 = $("#user-email-check").val();
	        		  var num2 = $("#send-certification-num").val();
	        		  if(num1 == "" || num2 == "") {
	        		    alert("인증번호 전송 버튼을 눌러주세요.");
	        		  } else {
	        		    if(num1 == num2) {
	        		      // 인증이 완료되었을 때 모달 창 열기
	        		      openModal("${uOne.uPw }");
	        		    } else {
	        		      alert("작성한 인증번호가 다릅니다.");
	        		      $("#check-certification-num").attr("value", "false");
	        		      $("#duplEmailResult").text("인증실패").removeClass("success").addClass("error").css("color", "red");
	        		    }
	        		  }
	        		}
	        
		</script>
	
	</body>
</html>