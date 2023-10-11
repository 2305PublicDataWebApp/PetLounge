<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <jsp:include page="../include/importSource.jsp"></jsp:include>
        <link rel="stylesheet" href="/resources/css/admin/main_stats.css">
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
                <p class="main-title-name">통계 관리</p>
                <hr class="line5">
            </div>
            <div class="sub-title2">
                <p class="sub-title-name2">가입자수 통계</p>
            </div>
            <div class="sub-title2">
                <p class="sub-title-name2">후원금액 통계(월별)</p>
            </div>
            <div class="sub-title2">
                <p class="sub-title-name2">후원 순위</p>
            </div>
            <div id="notice">
                <ul>
                    <table>
                        <colgroup>
                            <col width="10%">
                            <col width="60%">
                            <col width="30%">
                        </colgroup>
                        <thead>
                            <tr>
                                <th>순위</th>
                                <th>닉네임</th>
                                <th>후원금액</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td colspan="5"><hr class="line3-1"></td>
                            </tr>
                            <tr>
                                <td class="right2">1</td>
                                <td class="right1" style="text-align: center;">사이다</td>
                                <td class="right2">10,322,000</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">2</td>
                                <td class="right1" style="text-align: center;">여울이</td>
                                <td class="right2">5,810,000</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">3</td>
                                <td class="right1" style="text-align: center;">클레오</td>
                                <td class="right2">3,520,000</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">4</td>
                                <td class="right1" style="text-align: center;">스피카</td>
                                <td class="right2">1,125,000</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">5</td>
                                <td class="right1" style="text-align: center;">뽀야미</td>
                                <td class="right2">580,000</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                        </tbody>
                    </table>
                </ul>
            </div>
            <div class="sub-title2">
                <p class="sub-title-name2">병원 순위(리뷰)</p>
            </div>
            <div id="notice">
                <ul>
                    <table>
                        <colgroup>
                            <col width="10%">
                            <col width="60%">
                            <col width="30%">
                        </colgroup>
                        <thead>
                            <tr>
                                <th>순위</th>
                                <th>이름</th>
                                <th>리뷰 수</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td colspan="5"><hr class="line3-1"></td>
                            </tr>
                            <tr>
                                <td class="right2">1</td>
                                <td class="right1" style="text-align: center;">가로수동물병원</td>
                                <td class="right2">270</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">2</td>
                                <td class="right1" style="text-align: center;">케어덴동물병원</td>
                                <td class="right2">222</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">3</td>
                                <td class="right1" style="text-align: center;">그레이스동물병원</td>
                                <td class="right2">180</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">4</td>
                                <td class="right1" style="text-align: center;">메이트동물병원</td>
                                <td class="right2">132</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">5</td>
                                <td class="right1" style="text-align: center;">커비동물병원</td>
                                <td class="right2">105</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                        </tbody>
                    </table>
                </ul>
            </div>
            <div class="sub-title2">
                <p class="sub-title-name2">병원 순위(좋아요)</p>
            </div>
            <div id="notice">
                <ul>
                    <table>
                        <colgroup>
                            <col width="10%">
                            <col width="60%">
                            <col width="30%">
                        </colgroup>
                        <thead>
                            <tr>
                                <th>순위</th>
                                <th>이름</th>
                                <th>좋아요</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td colspan="5"><hr class="line3-1"></td>
                            </tr>
                            <tr>
                                <td class="right2">1</td>
                                <td class="right1" style="text-align: center;">가로수동물병원</td>
                                <td class="right2">100</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">2</td>
                                <td class="right1" style="text-align: center;">케어덴동물병원</td>
                                <td class="right2">80</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">3</td>
                                <td class="right1" style="text-align: center;">그레이스동물병원</td>
                                <td class="right2">60</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">4</td>
                                <td class="right1" style="text-align: center;">메이트동물병원</td>
                                <td class="right2">40</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">5</td>
                                <td class="right1" style="text-align: center;">커비동물병원</td>
                                <td class="right2">20</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                        </tbody>
                    </table>
                </ul>
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
    
    
    