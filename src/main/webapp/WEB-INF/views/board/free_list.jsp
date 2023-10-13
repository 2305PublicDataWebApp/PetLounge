<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
   		<jsp:include page="../include/importSource.jsp"></jsp:include>
        <link rel="stylesheet" href="/resources/css/board/free_list.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard-dynamic-subset.css" />
        <title>자유게시판</title>
    </head>
    <body>
        <jsp:include page="../include/header.jsp"></jsp:include>

        <main class="custom-main">
<!--         <br><br><br><br> -->
<!--         <h2>자유게시판</h2> -->
<!--         <div id="line"></div> -->

        <section id="title-section">
            <h1>자유게시판</h1>
            <div id="line"></div>
        </section>

        <div class="square-container">
            <div id="notice">
                <ul>
                    <table>
                        <colgroup>
                            <col width="7%">
                            <col width="50%">
                            <col width="15%">
                            <col width="15%">
                            <col width="15%">
                        </colgroup>
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>제목</th>
                                <th>닉네임</th>
                                <th>작성일</th>
                                <th>조회수</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">1</td>
                                <td class="right1" style="text-align: left;">자유1</td>
                                <td class="right2">사이다</td>
                                <td class="right2">2023.10.03</td>
                                <td class="right2">12</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">2</td>
                                <td class="right1" style="text-align: left;">자유2</td>
                                <td class="right2">여울이</td>
                                <td class="right2">2023.10.03</td>
                                <td class="right2">8</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">3</td>
                                <td class="right1" style="text-align: left;">자유3</td>
                                <td class="right2">귀오미</td>
                                <td class="right2">2023.10.03</td>
                                <td class="right2">21</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">4</td>
                                <td class="right1" style="text-align: left;">자유4</td>
                                <td class="right2">모니카</td>
                                <td class="right2">2023.10.03</td>
                                <td class="right2">11</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">5</td>
                                <td class="right1" style="text-align: left;">자유5</td>
                                <td class="right2">스피카</td>
                                <td class="right2">2023.10.03</td>
                                <td class="right2">17</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                            <tr>
                                <td class="right2">6</td>
                                <td class="right1" style="text-align: left;">자유6</td>
                                <td class="right2">뽀야미</td>
                                <td class="right2">2023.10.03</td>
                                <td class="right2">6</td>
                            </tr>
                            <tr>
                                <td colspan="5"><hr class="line3"></td>
                            </tr>
                        </tbody>
                    </table>
                </ul>
            </div>
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
                <div>
                    <input type="text" class="search-input">
                    <button class="search-button">검색</button>
                </div>
                <div class="sub">
                    <button class="submit">글쓰기</button>
                </div>
            </div>

        </main>
      	<footer>
		<jsp:include page="../include/footer.jsp"></jsp:include>
		</footer>
    </body>
    </html>
    
    
    