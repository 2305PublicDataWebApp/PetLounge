<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		// 페이지 로드 시 실행되는 스크립트
		window.onload = function() {
			// 알림 메시지 표시
			alert("${msg}");

			// 홈 페이지로 리다이렉트
			window.location.href = "${url}";
		};
	</script>
</body>
</html>