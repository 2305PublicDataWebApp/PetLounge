<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<jsp:include page="../include/importSource.jsp"></jsp:include>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
		<link rel="stylesheet" href="/resources/css/admin/adminSupport.css">
		<title>펫 라운지 모금함 : 후원 관리</title>
	</head>
	<body>
		<jsp:include page="../include/header.jsp"></jsp:include>
		
		<main id="main">
	        <section id="wrap">
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
	                <div class="content">
	                    <div class="square-container">
	                        <div class="right-title">
	                            <div>
	                                <img src="/resources/images/pet.png" id="logo">
	                            </div>
	                            <div>
	                                <p class="main-title-name">후원 관리</p>
	                            </div>
	                        </div>
	                        <div class="line-hr"></div>
	                        <div class="content-title">
	                            <p class="content-title-name">펫 라운지 모금함 : 후원글 조회</p>
	                            <div class="line"></div>
	                        </div>
	                        <!-- 정렬 -->
				            <div class="funding-wrap">
				                <div class="funding" style="">
				                    <button name="" id="funding-label" class="funding-label">전체</button>
				                    <ul class="optionList">
				                        <li class="optionItem" data-sort="all">전체</li>
				                        <li class="optionItem" data-sort="ongoing">진행중</li>
				                        <li class="optionItem" data-sort="closed">종료</li>
				                    </ul>
				                </div>
				            </div>
	                        <div class="content-inner">
	                            <div id="support-list">
	                                <table id="support-table">
	                                    <colgroup>
	                                        <col width="12%">
	                                        <col width="30%">
	                                        <col width="18%">
	                                        <col width="20%">
	                                        <col width="20%">
	                                    </colgroup>
	                                    <thead>
	                                        <tr>
	                                            <th class="table-border">카테고리</th>
	                                            <th class="table-border">모금함 제목</th>
	                                            <th class="table-border">모금 단체</th>
	                                            <th class="table-border">모금 기간</th>
	                                            <th class="table-border">모금/목표금액</th>
	                                        </tr>
	                                    </thead>
	                                    <tbody>
	                                        <tr>
	                                            <td class="table-border">주거</td>
	                                            <td class="table-border table-left">협회 구조묘들의 건강한...</td>
	                                            <td class="table-border">사단법인 나비야</td>
	                                            <td class="table-border">2023.10.20 ~ 2023.12.06</td>
	                                            <td class="table-border">4,800,000 / 11,000,000원</td>
	                                        </tr>
	                                        <tr>
	                                            <td class="table-border">생계</td>
	                                            <td class="table-border table-left">협회 구조묘들의 건강한...</td>
	                                            <td class="table-border">동물자유연대</td>
	                                            <td class="table-border">2023.10.20 ~ 2023.12.06</td>
	                                            <td class="table-border">3,000,000원 / 7,000,000원</td>
	                                        </tr>
	                                        <tr>
	                                            <td class="table-border">건강</td>
	                                            <td class="table-border table-left">협회 구조묘들의 건강한...</td>
	                                            <td class="table-border">사단법인 어독스</td>
	                                            <td class="table-border">2023.10.20 ~ 2023.12.06</td>
	                                            <td class="table-border">2,500,000원 / 7,000,000원</td>
	                                        </tr>
	                                        <tr>
	                                            <td class="table-border">개선</td>
	                                            <td class="table-border table-left">협회 구조묘들의 건강한...</td>
	                                            <td class="table-border">사단법인 팅커벨프로젝트</td>
	                                            <td class="table-border">2023.10.20 ~ 2023.12.06</td>
	                                            <td class="table-border">10,000,000원 / 8,000,000원</td>
	                                        </tr>
	                                        <tr>
	                                            <td class="table-border">주거</td>
	                                            <td class="table-border table-left">협회 구조묘들의 건강한...</td>
	                                            <td class="table-border">한국고양이보호협회</td>
	                                            <td class="table-border">2023.10.20 ~ 2023.12.06</td>
	                                            <td class="table-border">3,000,000원 / 9,900,000원</td>
	                                        </tr>
	                                    </tbody>
	                                </table>
	                                <div class="page-navigation">
	                                    <ul id="support-pagination" class="pagination pagination-sm">
		                                    <li class="page-item"><a class="page-link" href="javascript:void(0)"><i class="bi bi-caret-left-fill"></i></a></li>
		                                    <li class="page-item"><a class="page-link" href="javascript:void(0)">1</a></li>
		                                    <li class="page-item"><a class="page-link" href="javascript:void(0)">2</a></li>
		                                    <li class="page-item"><a class="page-link" href="javascript:void(0)">3</a></li>
		                                    <li class="page-item"><a class="page-link" href="javascript:void(0)"">4</a></li>
		                                    <li class="page-item"><a class="page-link" href="javascript:void(0)">5</a></li>
		                                    <li class="page-item"><a class="page-link" href="javascript:void(0)"><i class="bi bi-caret-right-fill"></i></a></li>
		                                </ul>
                                	</div>
	                            </div>
	                        </div>
	                        <div class="content-inner">
	                            <div class="content-title">
	                                <p class="content-title-name">펫 라운지 모금함 : 후원 내역 조회</p>
	                                <div class="line"></div>
	                            </div>
	                            <div id="s-history-list">
	                                <table id="history-table">
	                                    <colgroup>
	                                        <col width="35%">
	                                        <col width="15%">
	                                        <col width="20%">
	                                        <col width="15%">
	                                        <col width="15%">
	                                    </colgroup>
	                                    <thead>
	                                        <tr>
	                                            <th class="table-border">모금함 제목</th>
	                                            <th class="table-border">후원자</th>
	                                            <th class="table-border">후원 금액</th>
	                                            <th class="table-border">결제 방법</th>
	                                            <th class="table-border">후원일</th>
	                                        </tr>
	                                    </thead>
	                                    <tbody>
	                                        <tr>
	                                            <td class="table-border table-left">협회 구조묘들의 건강한 공동체...</td>
	                                            <td class="table-border">닉네임</td>
	                                            <td class="table-border">30,000원</td>
	                                            <td class="table-border">카카오페이</td>
	                                            <td class="table-border">2023.10.18</td>
	                                        </tr>
	                                        <tr>
	                                            <td class="table-border table-left">협회 구조묘들의 건강한 공동체...</td>
	                                            <td class="table-border">숨은천사</td>
	                                            <td class="table-border">100,000원</td>
	                                            <td class="table-border">신용카드</td>
	                                            <td class="table-border">2023.10.18</td>
	                                        </tr>
	                                        <tr>
	                                            <td class="table-border table-left">협회 구조묘들의 건강한 공동체...</td>
	                                            <td class="table-border">닉네임</td>
	                                            <td class="table-border">90,000원</td>
	                                            <td class="table-border">신용카드</td>
	                                            <td class="table-border">2023.10.18</td>
	                                        </tr>
	                                        <tr>
	                                            <td class="table-border table-left">협회 구조묘들의 건강한 공동체...</td>
	                                            <td class="table-border">숨은천사</td>
	                                            <td class="table-border">160,000원</td>
	                                            <td class="table-border">카카오페이</td>
	                                            <td class="table-border">2023.10.18</td>
	                                        </tr>
	                                        <tr>
	                                            <td class="table-border table-left">협회 구조묘들의 건강한 공동체...</td>
	                                            <td class="table-border">닉네임</td>
	                                            <td class="table-border">200,000원</td>
	                                            <td class="table-border">신용카드</td>
	                                            <td class="table-border">2023.10.18</td>
	                                        </tr>
	                                    </tbody>
	                                </table>
	                                <div class="page-navigation">
	                                    <ul id="history-pagination" class="pagination pagination-sm">
		                                    <li class="page-item"><a class="page-link" href="javascript:void(0)"><i class="bi bi-caret-left-fill"></i></a></li>
		                                    <li class="page-item"><a class="page-link" href="javascript:void(0)">1</a></li>
		                                    <li class="page-item"><a class="page-link" href="javascript:void(0)">2</a></li>
		                                    <li class="page-item"><a class="page-link" href="javascript:void(0)">3</a></li>
		                                    <li class="page-item"><a class="page-link" href="javascript:void(0)"">4</a></li>
		                                    <li class="page-item"><a class="page-link" href="javascript:void(0)">5</a></li>
		                                    <li class="page-item"><a class="page-link" href="javascript:void(0)"><i class="bi bi-caret-right-fill"></i></a></li>
		                                </ul>
                                	</div>
	                            </div>
	                        </div>
	                        <div class="content-inner">
	                            <div class="content-title">
	                                <p class="content-title-name">펫 라운지 모금함 : 후원 댓글 조회</p>
	                                <div class="line"></div>
	                            </div>
	                            <div id="notice">
	                                <table id="reply-table">
	                                    <colgroup>
	                                        <col width="30%">
	                                        <col width="45%">
	                                        <col width="25%">
	                                    </colgroup>
	                                    <thead>
	                                        <tr>
	                                            <th class="table-border">모금함 제목</th>
	                                            <th class="table-border">댓글 내용</th>
	                                            <th class="table-border">작성일</th>
	                                        </tr>
	                                    </thead>
	                                    <tbody>
	                                        <tr>
	                                            <td class="table-border table-left">협회 구조묘들의 건강한...</td>
	                                            <td class="table-border">댓글 내용 입니다.</td>
	                                            <td class="table-border">2023.10.20 10:30</td>
	                                        </tr>
	                                        <tr>
	                                            <td class="table-border table-left">협회 구조묘들의 건강한...</td>
	                                            <td class="table-border">댓글 내용 입니다.</td>
	                                            <td class="table-border">2023.10.20 10:30</td>
	                                        </tr>
	                                        <tr>
	                                            <td class="table-border table-left">협회 구조묘들의 건강한...</td>
	                                            <td class="table-border">댓글 내용 입니다.</td>
	                                            <td class="table-border">2023.10.20 10:30</td>
	                                        </tr>
	                                        <tr>
	                                            <td class="table-border table-left">협회 구조묘들의 건강한...</td>
	                                            <td class="table-border">댓글 내용 입니다.</td>
	                                            <td class="table-border">2023.10.20 10:30</td>
	                                        </tr>
	                                        <tr>
	                                            <td class="table-border table-left">협회 구조묘들의 건강한...</td>
	                                            <td class="table-border">댓글 내용 입니다.</td>
	                                            <td class="table-border">2023.10.20 10:30</td>
	                                        </tr>
	                                    </tbody>
	                                </table>
	                                <div class="page-navigation">
	                                    <ul id="reply-pagination" class="pagination pagination-sm">
		                                    <li class="page-item"><a class="page-link" href="javascript:void(0)"><i class="bi bi-caret-left-fill"></i></a></li>
		                                    <li class="page-item"><a class="page-link" href="javascript:void(0)">1</a></li>
		                                    <li class="page-item"><a class="page-link" href="javascript:void(0)">2</a></li>
		                                    <li class="page-item"><a class="page-link" href="javascript:void(0)">3</a></li>
		                                    <li class="page-item"><a class="page-link" href="javascript:void(0)"">4</a></li>
		                                    <li class="page-item"><a class="page-link" href="javascript:void(0)">5</a></li>
		                                    <li class="page-item"><a class="page-link" href="javascript:void(0)"><i class="bi bi-caret-right-fill"></i></a></li>
		                                </ul>
                                	</div>
	                            </div>
	                        </div>
	                        
	                    </div>
	                </div>
	            </section>
	        </section>
	    </main>
		
		
		<jsp:include page="../include/footer.jsp"></jsp:include>
		
		<script>
			<!-- 정렬바 -->
	        const label = document.querySelector('.funding-label');
	        const options = document.querySelectorAll('.optionItem');
	
	        // 클릭한 옵션의 텍스트를 라벨 안에 넣음
	        const handleSelect = (item) => {
	        label.parentNode.classList.remove('active');
	        const sort = item.getAttribute('data-sort');
	        label.innerHTML = item.textContent;
	        
		    currentPage = 1; 
		    
			getSupportList(currentPage);
	        }
	        
	        // 옵션 클릭시 클릭한 옵션을 넘김
	        options.forEach(option => {
	            option.addEventListener('click', () => handleSelect(option))
	        })
	
	        // 라벨을 클릭시 옵션 목록이 열림/닫힘
	        label.addEventListener('click', () => {
	        if(label.parentNode.classList.contains('active')) {
	            label.parentNode.classList.remove('active');
	        } else {
	            label.parentNode.classList.add('active');
	        }
	        })
		</script>
		
	</body>
</html>