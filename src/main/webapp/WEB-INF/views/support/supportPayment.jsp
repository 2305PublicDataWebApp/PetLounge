<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<jsp:include page="../include/importSource.jsp"></jsp:include>
		<link rel="stylesheet" href="/resources/css/support/supportPayment.css">
		<!-- jQuery -->
    	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
        <!-- iamport.payment.js -->
    	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
		<title>후원 함께 하기</title>
	</head>
	<body>
		<jsp:include page="../include/header.jsp"></jsp:include>
		
		<main id="main">
            <section id="title">
                <h1>후원 함께 하기</h1>
                <div id="line"></div>
			</section>
            <section id="contents">
                <h2 class="h-tag h2" id="s-title">${support.sTitle }</h2>
                <h4 class="h-tag h4" id="s-group">${support.sGroup }</h4>
                <div class="content-hr"></div>
                <h2 class="h-tag h2">"기부자님의 소중한 마음으로 놀라운 변화가 일어납니다."</h2>
                <h3 class="space h3">투명한 기부 후기로 그 변화를 소개하고 보답하겠습니다!</h3>
                <h3 class="h-tag h3">결제 정보</h3>
                <div class="content">
                    <ul>
                        <li>
                            <label for="s-h-amount-input" class="li-label"><b>후원 금액</b></label>
                            <input type="text" name="sHAmountinput" id="s-h-amount-input" 
                            onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');" maxlength="15">
                            원&nbsp;&nbsp;&nbsp;
                            <input type="hidden" name="sHAmount" id="s-h-amount" value="0">
                            <input type="button" value="+1만원" onclick="addAmount(10000)">
                            <input type="button" value="+5만원" onclick="addAmount(50000)">
                            <input type="button" value="+10만원" onclick="addAmount(100000)">
                        </li>
                        <li>
                            <label class="li-label"><b>결제 방법</b></label>
                            <input type="radio" name="sHPaytype" id="kakaopay" value="kakaopay">
                            <label for="kakaopay">카카오페이</label>&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="sHPaytype" id="creditcard" value="creditcard">
                            <label for="creditcard">신용카드</label>
                        </li>
                    </ul>
                </div>
                <br><br>
                <h3 class="h-tag h3">후원자 정보</h3>
                <div class="content">
                    <ul>
                        <li>
                            <label class="li-label"><b>후원자 이름</b></label>
                            <span id="s-h-name">${user.uNickName }</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
                            <input type="radio" name="sHType" id="nickname" value="nickname">
                            <label for="nickname">닉네임</label>&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="sHType" id="anonymous" value="anonymous">
                            <label for="anonymous">숨은천사(익명)</label>
                        </li>
                        <li>
                            <label class="li-label"><b>후원자 연락처</b></label>
                            <span id="u-phone">${user.uPhone }</span>
                            <input type="hidden" name="uEmail" id="u-email" value="${user.uEmail }">
                            <input type="hidden" name="uName" id="u-name" value="${user.uName }">
                        </li>
                    </ul>
                </div>
                <br><br>
                <!-- 이용 약관 동의-->
                <div class="agree-area">
                    <h3 class="h-tag h3">펫라운지 후원 이용약관 </h3><br>
                    <div class="content">
                        <p class="agree-preview">
펫라운지 후원 이용약관

제 1 조 (목적)
이 약관은 펫라운지(이하 “회사”)과 회원 사이의 권리, 의무 및 책임, 기타 필요한 사항을 규정함을 목적으로 합니다.

제 2 조 (용어의 정의)
① 이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
1. “후원 서비스”라 함은 기부 서비스를 말합니다.
2. “회원”이라 함은 펫라운지 회원 중 본 약관에 동의하고 펫라운지 후원 서비스를 이용하는 자를 말합니다.
3. “기부 서비스”라 함은 회사가 회원의 기부금을 모금단체에 전달하는 서비스를 말합니다.
4. “기부금”이라 함은 회원이 무상으로 제공한 금전이나 물품으로 반대급부 없이 모금단체에 전달되는 것을 말합니다.
5. “모금단체”라 함은 회사의 심사를 받은 펫라운지 웹사이트에서 노출되는 비영리 단체로 기부금을 전달받아 공익사업 등에 사용하는 단체를 말합니다.

② 이 약관에서 사용하는 용어 중 본 조에서 정하지 아니한 것은 관계법령 및 각 서비스별 개별 약관에서 정하는 바에 의합니다.

제 3 조 (약관의 명시 및 개정)
① 회사는 이 약관을 펫라운지 서비스 초기화면에 게시하거나 회원이 연결화면을 통하여 볼 수 있도록 합니다.
② 회사가 이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 그 적용일자 7일 이전부터 적용일자 전일까지 서비스 내에 공지합니다. 다만, 회원에게 불리하게 약관내용을 변경하는 경우에는 적용일자 30일 전까지 공지하며, 추가로 적용일자 전일까지 전자우편, 문자메시지, 로그인시 동의창 등을 이용해 통지를 합니다.
③ 회사가 전항에 따라 개정약관을 공지 또는 통지하면서 회원에게 일정 기간 내에 의사표시를 하지 않으면 약관 동의의 의사표시가 표명된 것으로 본다는 뜻을 명확하게 공지하였음에도 회원이 명시적으로 거부의 의사표시를 하지 아니한 경우 회원이 개정약관에 동의한 것으로 봅니다.
④ 회원이 개정약관의 적용에 동의하지 않는 경우 회사는 개정 약관의 내용을 적용할 수 없으며, 이 경우 회원은 이용계약을 해지할 수 있습니다. 다만, 기존 약관을 적용할 수 없는 특별한 사정이 있는 경우에는 회사가 이용계약을 해지할 수 있습니다.

제 4 조 (회원에 대한 통지)
회사는 불특정다수 회원에 대한 통지의 경우 1주일 이상 펫라운지의 게시판에 게시함으로서 개별 통지에 갈음할 수 있습니다. 다만, 회원의 권리·의무에 중대한 영향을 미치는 사항에 대하여는 전자우편 등을 통해 개별통지를 합니다.

제 5 조 (기부 서비스의 이용)
① 회원은 기부 서비스를 이용하기 위해 실명인증된 펫라운지 ID로 로그인해야 합니다.
② 회원은 기부금 영수증을 발급받기 원하는 경우, 회원의 개인정보인 이름, 주민등록번호, 주소를 회사에 제공하는데 동의해야 합니다.
③ 회사가 기부금을 모금단체에 전달한 경우, 원칙적으로 회원은 기부금을 반환받을 수 없습니다. 단, 다음 각 호의 사유가 있는 경우 회원은 기부금 반환을 요청할 수 있습니다.
1. 법적으로 기부금 반환요건이 있는 경우
2. 기술적 오류로 기부금 전달이 잘못된 경우

제 6 조 (기부 서비스의 제한)
회사는 아래 각 호에 해당하는 경우 기부를 승낙하지 않을 수 있습니다.
1. 실명이 아니거나 타인의 명의, 아이디를 도용하여 기부를 신청한 경우
2. 기부신청 내용을 허위로 기재한 경우
3. 회사의 명예에 부정적인 영향을 줄 수 있는 경우
4. 부정한 행위나 과정을 통해 조성된 기부금으로 기부를 신청한 경우
5. 영리를 추구할 목적으로 해피빈 서비스를 이용하고자 하는 경우
6. 회사의 목적사업을 위반하며 기부를 신청한 경우
7. 기타 이 약관 등을 위반하며 기부를 신청한 경우

제 7 조 (결제금액의 취소, 환불)
회원이 기부를 위해 결제한 금액은 환불이 불가능합니다. 단, 5조에 명시된 기부금 반환 사유가 있는 경우 반환 요청이 가능합니다.

제 8 조 (기부내역의 확인)
① 회사를 통해 기부한 내역은 언제든지 펫라운지 웹사이트에서 확인할 수 있습니다.
② 일부 모금단체의 경우 기부금 관련 영수증이 발급되지 않을 수 있으므로 회원은 기부하기 전 게시글 안내를 통해 기부금 관련 영수증 발급대상 단체인지를 확인해야 합니다.
③ 회원이 전항에 따라 기부금 관련 영수증 발급대상 단체인지를 확인하지 않고 기부한 경우, 회사는 기부금 관련 영수증이 발급되지 않는 점에 대해 책임을 지지 않습니다.

제 9 조 (회원의 의무)
① 회원은 기부 신청 또는 기부내용 변경 시 실명으로 모든 사항을 사실에 근거하여 작성하여야 하며, 허위 또는 타인의 정보를 등록할 경우 일체의 권리를 주장할 수 없습니다.
② 회원은 주소, 연락처, 전자우편 주소 등이 변경된 경우에 회원정보를 변경해야 하며, 회원정보 변경을 하지 않아 발생하는 손해는 회원이 책임을 집니다.
③ 회원은 기부내역 및 기부금 영수증의 관리의무가 있으며, 관리소홀, 부정사용 등에 의하여 발생한 손해는 회원이 책임을 집니다.
④ 회원은 회사의 명시적 동의가 없는 한 서비스의 이용권한, 기타 이용계약상의 지위를 타인에게 양도, 증여할 수 없으며 이를 담보로 제공할 수 없습니다.

제 10 조 (회원의 금지행위)
① 회원은 다음 각 호에 해당하는 행위를 하여서는 안됩니다.
1. 회원가입 신청 또는 회원정보 변경 시 허위내용을 등록하는 행위
2. 다른 이용자의 ID, 비밀번호, 주민등록번호를 도용하는 행위
3. 이용자 ID를 타인과 거래하는 행위
4. 회사의 운영진, 직원 또는 관계자를 사칭하는 행위
5. 무단으로 회사의 클라이언트 프로그램을 변경하거나, 회사의 서버를 해킹하거나, 웹사이트 또는 게시된 정보의 일부분 또는 전체를 임의로 변경하는 행위
6. 후원 서비스에 위해를 가하거나 고의로 방해하는 행위
7. 후원 서비스를 통해 얻은 정보를 회사의 사전 승낙 없이 서비스 이용 외의 목적으로 복제하거나, 이를 출판 및 방송 등에 사용하거나, 제3자에게 제공하는 행위
8. 공공질서 및 미풍양속에 위반되는 저속, 음란한 내용의 정보, 문장, 도형, 음향, 동영상을 전송, 게시, 전자우편 또는 기타의 방법으로 타인에게 유포하는 행위
9. 모욕적이거나 개인신상에 대한 내용이어서 타인의 명예나 프라이버시를 침해할 수 있는 내용을 전송, 게시, 댓글 작성, 전자우편 발송 및 기타의 방법으로 타인에게 유포하는 행위
10. 다른 이용자를 희롱 또는 위협하거나, 특정 이용자에게 지속적으로 고통 또는 불편을 주는 행위
11. 동의 없이 다른 사용자의 개인정보를 수집 또는 저장하는 행위
12. 범죄와 결부된다고 객관적으로 판단되는 행위
13. 회사 및 제3자의 지식재산권을 침해하는 행위
14. 이 약관 및 개별 서비스 약관을 포함하여 회사가 정한 제반 규정 또는 이용 조건을 위반하는 행위
15. 기타 관계법령에 위배되는 행위
② 회원이 본 조에서 금지하는 행위를 한 경우, 회사는 회원의 서비스 이용을 제한하거나, 서비스 이용 계약을 해지할 수 있습니다.

제 11 조 (게시물의 관리)
회사는 다음 각 호에 해당하는 게시물이나 댓글, 자료 등을 사전통지 없이 삭제하거나 이동 또는 등록 거부를 할 수 있습니다.
1. 다른 회원 또는 제3자에게 심한 모욕을 주거나 명예를 손상시키는 내용인 경우
2. 공공질서 및 미풍양속에 위반되는 내용을 유포하거나 링크시키는 경우
3. 불법복제 또는 해킹을 조장하는 내용인 경우
4. 영리를 목적으로 하는 광고일 경우
5. 범죄와 결부된다고 객관적으로 인정되는 내용일 경우
6. 다른 회원 또는 제3자의 저작권 등 기타 권리를 침해하는 내용인 경우
7. 회사가 규정한 게시물 원칙에 어긋나거나, 게시판 성격에 부합하지 않는 경우
8. 기타 관계법령에 위배된다고 판단되는 경우

제 12 조 (게시물에 대한 저작권)
① 회사가 작성한 저작물에 대한 저작권 기타 지식재산권은 회사에 귀속됩니다.
② 회원이 후원 서비스 내에 게시하는 게시글 및 댓글은 검색결과 내지 서비스 관련 프로모션 등에 노출될 수 있으며, 해당 노출을 위해 필요한 범위 내에서는 일부 수정, 복제, 편집되어 게시될 수 있습니다. 이 경우, 회사는 저작권법을 준수하며, 회원은 언제든지 고객센터 또는 후원 서비스 내 관리기능을 통해 해당 게시물에 대해 삭제, 검색결과 제외, 비공개 등의 조치를 취할 수 있습니다.
③ 회사는 제1항 이외의 방법으로 회원의 게시물을 이용하고자 하는 경우에는 전자우편 등을 통해 사전에 회원의 동의를 얻어야 합니다.

제 13 조 (광고게재 및 광고주와의 거래)
① 회원은 후원 서비스 이용시 노출되는 광고게재에 대해 동의합니다.
② 회사는 후원 서비스상에 게재되어 있거나 후원 서비스를 통한 광고주의 판촉활동에 회원이 참여하거나 교신 또는 거래를 함으로써 발생하는 손실과 손해에 대해 책임을 지지 않습니다

제 14 조 (개인정보의 보호)
① 회사는 이용자의 개인정보 수집시 후원 서비스 제공을 위하여 필요한 범위에서 최소한의 개인정보를 수집합니다.
② 회사는 개인정보를 목적외의 용도로 이용하지 않으며, 새로운 이용목적이 발생한 경우 또는 제3자에게 제공하는 경우에는 회원의 동의를 받습니다. 단, 관련 법령에 달리 정함이 있는 경우는 예외로 합니다.
③ 회사는 회원의 개인정보 보호를 위한 보안시스템을 마련합니다.

제 15 조 (면책조항)
① 회사는 다음 각 호의 경우 책임을 지지 않습니다.
1. 천재지변, 전쟁 및 기타 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우
2. 기간통신 사업자가 전기통신 서비스를 중지하거나 정상적으로 제공하지 아니하여 손해가 발생한 경우
3. 서비스용 설비의 보수, 교체, 정기점검, 공사 등 부득이한 사유로 손해가 발생한 경우
4. 회원의 귀책사유로 인한 서비스 이용의 장애 또는 손해가 발생한 경우
5. 회원의 컴퓨터 오류에 의해 손해가 발생한 경우 또는 회원이 신상정보 및 전자우편 주소를 부실하게 기재하여 손해가 발생한 경우.
6. 회원이 후원 서비스를 이용하면서 얻은 자료를 활용하여 손해가 발생한 경우
7. 회원이 후원 서비스를 이용하면서 타 회원으로 인해 정신적 피해를 입은 경우
② 회사는 회원이 서비스에 게재한 각종 정보, 자료, 사실의 신뢰도, 정확성 등 내용에 대하여 책임을 지지 않습니다.
③ 회사는 회원 상호간 및 회원과 제3자 사이에 후원 서비스를 매개로 발생한 분쟁에 대해 개입할 의무가 없으며, 이로 인한 손해를 배상할 책임도 없습니다.

제 16 조 (서비스의 중단)
① 회사는 컴퓨터 등 정보통신설비의 보수점검, 교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.
② 회사는 고의 또는 중과실이 없는 한 서비스의 제공이 일시적으로 중단됨으로 인하여 발생한 손해를 배상하지 않습니다.

제 17 조 (재판권 및 준거법)
① 이 약관에 명시되지 않은 사항은 관계법령 및 펫라운지 이용약관에 따릅니다.
② 회사와 회원간 발생한 분쟁에 관한 소송은 민사소송법 상의 관할법원에 제소합니다.
                        </p>

                    </div>
                    <label for="agree-term">
                        <br><input type="checkbox" id="agree-term">
                        (필수) 펫라운지 후원 이용약관에 동의합니다.
                    </label>
                </div>
            </section> 
            <section id="button" style="margin-bottom: 100px;">
                <button class="btn-payment" onclick="checkPay()">후원 결제</button>
                <button class="btn-cancel" onClick="location.href='/support/detail.pet?sNo='+${support.sNo }">돌아가기</button>
            </section>
        </main>
		
		<jsp:include page="../include/footer.jsp"></jsp:include>
		
		<script>
			<!-- 금액 추가 버튼 -->
			function addAmount(value) {
			    // 현재 입력값 가져오기
			    var currentAmount = parseInt($('#s-h-amount-input').val().replace(/[^0-9]/g, ''), 10);
	
			    // 입력값이 숫자인지 확인
			    if (isNaN(currentAmount)) {
			        currentAmount = 0;
			    }
		        // 새로운 값 계산 및 설정
		        var newAmount = currentAmount + value;
		        $('#s-h-amount-input').val(newAmount.toLocaleString());
	
		        // 계산된 값을 숨은 필드에도 설정 
		        $('#s-h-amount').val(newAmount);
			}
			
            <!-- 숫자만 사용 가능, 콤마 -->
            document.getElementById("s-h-amount-input").addEventListener("keyup", function (e) {
                $(this).val($(this).val().replace(/\,/g, '').replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'));
            	// 사용자가 입력한 값에서 쉼표 제거하여 숫자만 추출
                let inputValue =  $(this).val().replace(/\,/g, '');
                // 추출한 숫자를 정수로 변환
                let numericValue = parseInt(inputValue, 10);
             	// hidden으로 숨겨둔 input에 넣어서 DB로 보낼 수 있게 함 
                document.getElementById("s-h-amount").value = numericValue;
            });
	
            <!-- 결제 -->
            var IMP = window.IMP; 
            IMP.init("imp51282354"); 
          
            var today = new Date();   
            var hours = today.getHours(); // 시
            var minutes = today.getMinutes();  // 분
            var seconds = today.getSeconds();  // 초
            var milliseconds = today.getMilliseconds();
            var makeMerchantUid = hours +  minutes + seconds + milliseconds;
            
            const sNo = ${support.sNo };
            const uId = '${user.uId }';
            const sHName = '${user.uNickName }';
            let sHAmount = 0;
            let sHType = 'N';
            
            <!-- 결제 기본값 -->
            $('input[name="sHPaytype"][value="kakaopay"]').prop('checked', true).change();
            
			<!-- 후원자 이름 선택 -->
			// 페이지 로드 시 초기값 설정 (예: 기본값인 'nickname'으로 설정)
			$('input[name="sHType"][value="nickname"]').prop('checked', true).change();
				// 라디오 버튼 변경 감지
			$('input[name="sHType"]').change(function() {
			    // 선택된 라디오 버튼의 값 가져오기
			    var selectedValue = $('input[name="sHType"]:checked').val();
			    // span 요소에 값을 설정
			    if (selectedValue === 'nickname') {
			        $('#s-h-name').text('${user.uNickName }');
			        sHType = 'N';
			    } else if (selectedValue === 'anonymous') {
			        $('#s-h-name').text('숨은천사');
			        sHType = 'A';
			    }
			});
            
            <!-- 결제 -->
            // 결제 처리 
            function checkPay() {
				if($('#s-h-amount').val() < 1000) {					
					// 금액 확인 
					alert('후원 최소 금액은 1,000원 입니다.');
				} else if(!$('#agree-term').is(':checked')) {
					// 필수동의 확인 
					alert('펫라운지 후원 이용약관에 동의 해주셔야 후원이 가능합니다.');
				} else {
	            	// 어떤 라디오 버튼이 선택되었는지 확인
				    if ($('#kakaopay').is(':checked')) {
				    	resuestKakaopay();
				    } else if ($('#creditcard').is(':checked')) {
				    	requestPay();
				    } 
				}
			}
            
	        // 신용카드 결제
            function requestPay() {
                IMP.request_pay({
                    pg : 'kcp', // kcp
                    pay_method : 'card',
                    merchant_uid: "PET-"+makeMerchantUid, // 주문 번호 
                    name : $('#s-title').text(), // 상품명 (후원 제목으로 넘김)
                    amount : parseInt($('#s-h-amount').val(), 10),	 // 금액, 숫자 타입 
                    buyer_email : $('#u-email').val(), // 구매자 이메일 
                    buyer_name : $('#u-name').val(), // 구매자 이름 
                    buyer_tel : $('#u-phone').text() // 구매자 연락처 
                }, function (rsp) { // callback
                	//rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
                    if (rsp.success) {
                    	sHAmount = parseInt($('#s-h-amount').val(), 10);
                       	$.ajax({
                       		url : '/support/payment.pet',
                       		data : { sNo : sNo, uId : uId, sHName : sHName, sHAmount : sHAmount, sHPaytype : 'creditcard', sHType : sHType }, 
                       		type : 'post',
                       		success : function(result) {
                       			sessionStorage.setItem("sHAmount", sHAmount);
                    			sessionStorage.setItem("sHPaytype", "creditcard");
                       			const url = '/support/complete.pet';
                       			location.href = url;
                       			
                       			// 메일 발송 
                       			$.ajax({
                       				url : '/support/sendMail.pet'	, 
                       				data : { sNo : sNo, uId : uId, sHName : sHName, sHAmount : sHAmount, sHPaytype : 'creditcard', sHType : sHType }, 
                       				type : 'post', 
                       				success : function(result) {
                       					console.log("메일 발송 완료");
                       				},
                       				error : function() {
                       					console.log("메일 발송 실패");
                       				}
                       			});
                       		}, 
                       		error : function() {
                       			alert("Ajax 오류! 관리자에게 문의하세요.");
                       		} 
                       	});
                    } else {
                    	console.log("결제 실패");
                    }
                });
            }
            
            // 카카오페이 결제
            function resuestKakaopay() {
            	IMP.request_pay({
                    pg : 'kakaopay.TC0ONETIME', // 카카오페이
                    merchant_uid: "PET-"+makeMerchantUid, // 주문 번호 
                    name : $('#s-title').text(), // 상품명 (후원 제목으로 넘김)
                    amount : parseInt($('#s-h-amount').val(), 10),	 // 금액, 숫자 타입 
                    buyer_email : $('#u-email').val(), // 구매자 이메일 
                    buyer_name : $('#u-name').val(), // 구매자 이름 
                    buyer_tel : $('#u-phone').text() // 구매자 연락처 
                }, function (rsp) { // callback
                	//rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
                    if (rsp.success) {
                        console.log("1:" + rsp);
                        console.log('sNo:' + sNo);
                        console.log('uId:' + uId);
                        console.log('sHName:' + sHName);
                        console.log('sHType:' + sHType);
                        sHAmount = parseInt($('#s-h-amount').val(), 10);
                        console.log('sHAmount:' + sHAmount);
                    	$.ajax({
                    		url : '/support/payment.pet',
                    		data : { sNo : sNo, uId : uId, sHName : sHName, sHAmount : sHAmount, sHPaytype : 'kakaopay', sHType : sHType }, 
                    		type : 'post',
                    		success : function(result) {
                    			sessionStorage.setItem("sHAmount", sHAmount);
                    			sessionStorage.setItem("sHPaytype", "kakaopay");
                    			const url = '/support/complete.pet';
                    			location.href = url;
                    			
                    			// 메일 발송 
                       			$.ajax({
                       				url : '/support/sendMail.pet'	, 
                       				data : { sNo : sNo, uId : uId, sHName : sHName, sHAmount : sHAmount, sHPaytype : 'kakaopay', sHType : sHType }, 
                       				type : 'post', 
                       				success : function(result) {
                       					console.log("메일 발송 완료");
                       				},
                       				error : function() {
                       					console.log("메일 발송 실패");
                       				}
                       			});
                       		}, 
                       		error : function() {
                       			alert("Ajax 오류! 관리자에게 문의하세요.");
                       		} 
                       	});
                    } else {
                        console.log("결제 실패");
                    }
                });
            }
        </script>
	</body>
</html>