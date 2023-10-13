<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<jsp:include page="../include/importSource.jsp"></jsp:include>
        <link rel="stylesheet" href="/resources/css/admin/main_userdetail.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard-dynamic-subset.css" />
        <title>관리자 페이지</title>
    </head>
    <body>
        <jsp:include page="../include/header.jsp"></jsp:include>

        <main>
        
    <!-- 왼쪽 메뉴 바 -->
   	<section class="left-section">
    <div class="menu">
        <div class="m-container">
            <div class="sub-title">
                <p class="sub-title-name">관리자페이지</p>
                <hr class="line4">
            </div>
            <ul class="sub-menu">
                <li class="menu-item">
                    <div>
                    <span>
                    </span>  
                    <span class="m-name">
                        <a href="#">통계 관리</a>
                    </span>
                    </div>
                </li>
                <li class="menu-item">
                    <div>
                    <span></span>  
                    <span class="m-name">
                        <a href="#">회원 관리</a>
                    </span>
                    </div>
                </li>
                <li class="menu-item">
                    <div>
                    <span></span>  
                    <span class="m-name">
                        <a href="#">후원 관리</a>
                    </span>
                    </div>
                </li>
                <li class="menu-item">
                    <div>
                    <span></span>  
                    <span class="m-name">
                        <a href="#">게시판 관리</a>
                    </span>
                    </div>
                </li>
            </ul>
        </div>
    </div>
	</section>

    <!-- 오른쪽 메인 화면 -->
    <section class="right-section">  
    <div class="main">
        <div class="square-container">
            <div class="sub-title">
                <p class="main-title-name">회원 관리</p>
                <hr class="line5">
            </div>
            <div class="sub-title2">
                <p class="sub-title-name2">회원 상세 조회</p>
            </div>
            <div id="notice">
                <ul>
                    <table>
                        <colgroup>
                            <col width="25%">
                            <col width="75%">
                        </colgroup>
                        <thead>
                            <tr>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <!-- <td colspan="5"><hr class="line3-1"></td> -->
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">아이디</td>
                                <td class="right1" style="text-align: left;">khuser01</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">이름</td>
                                <td class="right1" style="text-align: left;">김이름</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">닉네임</td>
                                <td class="right1" style="text-align: left;">여행가고싶다</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">이메일</td>
                                <td class="right1" style="text-align: left;">user01@naver.com</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">휴대폰</td>
                                <td class="right1" style="text-align: left;">010-7293-2193</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">주소</td>
                                <td class="right1" style="text-align: left;">서울특별시 중구 남대문로 120 그레이츠 청계</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">프로필 사진</td>
                                <td class="right1" style="text-align: left;">
                                    <div class="user-img">
                                        <img alt="유저 프로필 이미지" src="../../resources/images/user/register/join.png">
                                        <button class="addphoto">사진등록</button>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                        </tbody>
                    </table>
                </ul>
            </div>
            <div class="search-container">
                <button class="search-button1">수정하기</button>
                <button class="search-button2">탈퇴하기</button>
            </div>
   		</div>
	</div>
	</section>
	</main>   
  	<footer>
	<jsp:include page="../include/footer.jsp"></jsp:include>
	</footer>


    </body>
    </html>
    
    
    