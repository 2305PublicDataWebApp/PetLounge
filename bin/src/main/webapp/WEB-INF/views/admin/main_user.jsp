<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<jsp:include page="../include/importSource.jsp"></jsp:include>
        <link rel="stylesheet" href="/resources/css/admin/main_user.css">
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
                <p class="sub-title-name2">회원 목록 조회</p>
            </div>
            <div id="notice">
                <ul>
                    <table>
                        <colgroup>
                            <col width="10%">
                            <col width="20%">
                            <col width="15%">
                            <col width="20%">
                            <col width="20%">
                        </colgroup>
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>아이디</th>
                                <th>이름</th>
                                <th>닉네임</th>
                                <th>휴대폰</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td colspan="5"><hr class="line3-1"></td>
                            </tr>
                            <tr>
                                <td class="right2">1</td>
                                <td class="right1" style="text-align: center;">user01</td>
                                <td class="right1">김이름</td>
                                <td class="right1">여행가고싶다</td>
                                <td class="right1">01072932193</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">2</td>
                                <td class="right1" style="text-align: center;">user02</td>
                                <td class="right1">이용자</td>
                                <td class="right1">이용자</td>
                                <td class="right1">01023125888</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">3</td>
                                <td class="right1" style="text-align: center;">user03</td>
                                <td class="right1">삼용자</td>
                                <td class="right1">삼용자</td>
                                <td class="right1">01020205587</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">4</td>
                                <td class="right1" style="text-align: center;">user04</td>
                                <td class="right1">사용자</td>
                                <td class="right1">사용자</td>
                                <td class="right1">01055489657</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">5</td>
                                <td class="right1" style="text-align: center;">user05</td>
                                <td class="right1">오용자</td>
                                <td class="right1">오용자</td>
                                <td class="right1">01032125557</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                        </tbody>
                    </table>
                </ul>
            </div>
            <div class="page">
                <ul class="pagination">
                    <li class="Mui-selected"><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li><a href="#">다음</a></li>
                </ul>
            </div>
            <div class="search-container">
                <input type="text" class="search-input">
                <button class="search-button">검색</button>
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
    
    
    