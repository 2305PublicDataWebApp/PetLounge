<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <jsp:include page="../include/importSource.jsp"></jsp:include>
        <link rel="stylesheet" href="/resources/css/admin/main_board.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard-dynamic-subset.css" />
        <title>관리자 페이지</title>
        <style>
        .left-section {
            flex: 1 0 0px; /* flex-grow: 1, flex-shrink: 0, flex-basis: 250px */
        }
       	.right-section {
            flex: 1 0 1500px; /* flex-grow: 1, flex-shrink: 0, flex-basis: 250px */
        }
        main {
        	display: flex;
        }
        body {
        	flex-direction: column;
        }
        </style>        
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
		    <div class="main1">
		        <div class="square-container">
		            <div class="sub-title">
		                <p class="main-title-name">게시판 관리</p>
		                <hr class="line5">
		            </div>
		            <div class="sub-title2">
		                <p class="sub-title-name2">공지사항 목록 조회</p>
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
		                                <th>글번호</th>
		                                <th>제목</th>
		                                <th>작성일</th>
		                            </tr>
		                        </thead>
		                        <tbody>
		                            <tr>
		                                <td colspan="5"><hr class="line3-1"></td>
		                            </tr>
		                            <tr>
		                                <td class="right2">1</td>
		                                <td class="right1" style="text-align: left;">공지1</td>
		                                <td class="right2">2023.09.07</td>
		                            </tr>
		                            <tr>
		                                <td colspan="5"><hr class="line3"></td>
		                            </tr>
		                            <tr>
		                                <td class="right2">2</td>
		                                <td class="right1" style="text-align: left;">공지2</td>
		                                <td class="right2">2023.09.06</td>
		                            </tr>
		                            <tr>
		                                <td colspan="5"><hr class="line3"></td>
		                            </tr>
		                            <tr>
		                                <td class="right2">3</td>
		                                <td class="right1" style="text-align: left;">공지3</td>
		                                <td class="right2">2023.08.31</td>
		                            </tr>
		                            <tr>
		                                <td colspan="5"><hr class="line3"></td>
		                            </tr>
		                            <tr>
		                                <td class="right2">4</td>
		                                <td class="right1" style="text-align: left;">공지4</td>
		                                <td class="right2">2023.08.15</td>
		                            </tr>
		                            <tr>
		                                <td colspan="5"><hr class="line3"></td>
		                            </tr>
		                            <tr>
		                                <td class="right2">5</td>
		                                <td class="right1" style="text-align: left;">공지5</td>
		                                <td class="right2">2023.08.10</td>
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
		            <div class="sub-title2">
		                <p class="sub-title-name2">자유게시판 목록 조회</p>
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
		                                <th>글번호</th>
		                                <th>제목</th>
		                                <th>작성일</th>
		                            </tr>
		                        </thead>
		                        <tbody>
		                            <tr>
		                                <td colspan="5"><hr class="line3-1"></td>
		                            </tr>
		                            <tr>
		                                <td class="right2">1</td>
		                                <td class="right1" style="text-align: left;">자유1</td>
		                                <td class="right2">2023.09.07</td>
		                            </tr>
		                            <tr>
		                                <td colspan="5"><hr class="line3"></td>
		                            </tr>
		                            <tr>
		                                <td class="right2">2</td>
		                                <td class="right1" style="text-align: left;">자유2</td>
		                                <td class="right2">2023.09.06</td>
		                            </tr>
		                            <tr>
		                                <td colspan="5"><hr class="line3"></td>
		                            </tr>
		                            <tr>
		                                <td class="right2">3</td>
		                                <td class="right1" style="text-align: left;">자유3</td>
		                                <td class="right2">2023.08.31</td>
		                            </tr>
		                            <tr>
		                                <td colspan="5"><hr class="line3"></td>
		                            </tr>
		                            <tr>
		                                <td class="right2">4</td>
		                                <td class="right1" style="text-align: left;">자유4</td>
		                                <td class="right2">2023.08.15</td>
		                            </tr>
		                            <tr>
		                                <td colspan="5"><hr class="line3"></td>
		                            </tr>
		                            <tr>
		                                <td class="right2">5</td>
		                                <td class="right1" style="text-align: left;">자유5</td>
		                                <td class="right2">2023.08.10</td>
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
		            <div class="sub-title2">
		                <p class="sub-title-name2">병원리뷰 목록 조회</p>
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
		                                <th>글번호</th>
		                                <th>제목</th>
		                                <th>작성일</th>
		                            </tr>
		                        </thead>
		                        <tbody>
		                            <tr>
		                                <td colspan="5"><hr class="line3-1"></td>
		                            </tr>
		                            <tr>
		                                <td class="right2">1</td>
		                                <td class="right1" style="text-align: left;">리뷰1</td>
		                                <td class="right2">2023.09.07</td>
		                            </tr>
		                            <tr>
		                                <td colspan="5"><hr class="line3"></td>
		                            </tr>
		                            <tr>
		                                <td class="right2">2</td>
		                                <td class="right1" style="text-align: left;">리뷰2</td>
		                                <td class="right2">2023.09.06</td>
		                            </tr>
		                            <tr>
		                                <td colspan="5"><hr class="line3"></td>
		                            </tr>
		                            <tr>
		                                <td class="right2">3</td>
		                                <td class="right1" style="text-align: left;">리뷰3</td>
		                                <td class="right2">2023.08.31</td>
		                            </tr>
		                            <tr>
		                                <td colspan="5"><hr class="line3"></td>
		                            </tr>
		                            <tr>
		                                <td class="right2">4</td>
		                                <td class="right1" style="text-align: left;">리뷰4</td>
		                                <td class="right2">2023.08.15</td>
		                            </tr>
		                            <tr>
		                                <td colspan="5"><hr class="line3"></td>
		                            </tr>
		                            <tr>
		                                <td class="right2">5</td>
		                                <td class="right1" style="text-align: left;">리뷰5</td>
		                                <td class="right2">2023.08.10</td>
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
		    	</div>
			</div>
		</section>
  	</main>   
  	<footer>
	<jsp:include page="../include/footer.jsp"></jsp:include>
	</footer>
    </body>	 
</html>
    
    
    