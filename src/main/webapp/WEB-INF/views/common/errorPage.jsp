<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="/resources/css/error.css">
        <link rel="stylesheet" href="/resources/css/font.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<title>펫 라운지 : 주의</title>
	</head>
	<body>
		<div class="wrapper">
			<h1 class="oops">앗!</h1>
			<p class="info">
				페이지를 찾을 수 없습니다
				<c:if test="${ msg ne null }">
					<span style="color:#ccc;">(${ msg })</span>
				</c:if>
                <br>
                대신 여기에 귀여운 고양이가 있습니다!
            </p>
			<br>
			<c:if test="${ url ne null }">
				<a href="${ url }" class="button"><i class="fa fa-angle-left" style="color: #fff"></i>펫 라운지</a>
			</c:if>
			<c:if test="${ url eq null }">
				<a href="/home.pet" class="button"><i class="fa fa-angle-left" style="color: #fff"></i>펫 라운지</a>
			</c:if>
			<img src="http://abovethelaw.com/wp-content/uploads/2015/03/cute-gray-kitty.jpg" alt="Kitty" />
		</div>
	</body>
</html>