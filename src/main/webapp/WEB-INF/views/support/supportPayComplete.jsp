<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<jsp:include page="../include/importSource.jsp"></jsp:include>
		<link rel="stylesheet" href="/resources/css/support/supportPayComplete.css">
		<title>후원 완료</title>
	</head>
	<body>
		<jsp:include page="../include/header.jsp"></jsp:include>
		
		<main id="main">
            <section id="title">
                <h1>후원 완료</h1>
                <div id="line"></div>
			</section>
            <section id="contents">
                <img src="https://petlounge.s3.ap-northeast-2.amazonaws.com/check.png">
                <h3>결제 정보</h3>
                <div class="content">
                    <ul>
                        <li>
                            <label class="li-label"><b>후원 금액</b></label>
                            <p id="s-h-amount"></p>
                        </li>
                        <li>
                            <label class="li-label"><b>결제 방법</b></label>
                            <p id="s-h-paytype"></p>
                        </li>
                    </ul>
                </div>
                <h1>후원이 완료되었습니다.</h1> 
                <h3>따뜻한 손길에 감사드립니다.</h3>
            </section>
            <section id="button" style="margin-bottom: 100px;">
                <button class="btn-list" onClick="location.href='/support/list.pet'">목록으로</button>
            </section>
        </main>
		
		<jsp:include page="../include/footer.jsp"></jsp:include>
		<script>
            <!-- 정보 받아오기 -->
            const sHAmount = sessionStorage.getItem("sHAmount");
            const sHPaytype = sessionStorage.getItem("sHPaytype");
            <!-- 천단위 끊기 -->
            function addCommasToNumber(number) {
                return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            }
         	// sHAmount에 천 단위 콤마 추가
            const formattedAmount = addCommasToNumber(sHAmount);
            console.log(sHAmount);
            console.log(sHPaytype);
            $('#s-h-amount').html(formattedAmount+' 원');
            if(sHPaytype == 'creditcard') {
	            $('#s-h-paytype').html('신용카드');
            } else {
            	$('#s-h-paytype').html('카카오페이');
            }
            
        </script>
	</body>
</html>