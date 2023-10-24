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
		<script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.0/dist/chart.umd.min.js"></script>
		<title>펫 라운지 관리자페이지</title>
		<style>
			.table-border table-left1 {
				padding-left: 10px;
			}
			.table-border table-right1 {
				padding-left: 10px;
			}
		</style>
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
	                                        <a href="/admin/stats.pet">통계 관리</a>
	                                    </span>
	                                </div>
	                            </li>
	                            <li class="menu-item">
	                                <div>
	                                    <span></span>
	                                    <span class="m-name">
	                                        <a href="/admin/user.pet">회원 관리</a>
	                                    </span>
	                                </div>
	                            </li>
	                            <li class="menu-item">
	                                <div>
	                                    <span></span>
	                                    <span class="m-name">
	                                        <a href="/admin/support.pet">후원 관리</a>
	                                    </span>
	                                </div>
	                            </li>
<!-- 	                            <li class="menu-item"> -->
<!-- 	                                <div> -->
<!-- 	                                    <span></span> -->
<!-- 	                                    <span class="m-name"> -->
<!-- 	                                        <a href="#">게시판 관리</a> -->
<!-- 	                                    </span> -->
<!-- 	                                </div> -->
<!-- 	                            </li> -->
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
	                                <p class="main-title-name">통계 관리</p>
	                            </div>
	                        </div>
	                        <div class="line-hr"></div>
	                        <div class="content-title">
	                            <p class="content-title-name">일별 후원금액 통계</p>
	                            <div class="line" style="margin-bottom:35px;"></div>
	                            <!-- 후원금액 통계 그래프 -->
								<div class="chart">
									<canvas id="c1" width="700px" height="300px"></canvas>
								</div>
	                        </div>
	                        <div class="line-hr"></div>
	                        
	                        <div class="content-inner">
	                            <div class="content-title">
	                                <p class="content-title-name">후원 순위</p>
	                                <div class="line"></div>
	                            </div>
	                            <div id="s-history-list">
	                                <table id="history-table">
	                                    <colgroup>
	                                        <col width="20%">
	                                        <col width="40%">
	                                        <col width="40%">
	                                    </colgroup>
	                                    <thead>
	                                        <tr>
	                                            <th class="table-border">순위</th>
	                                            <th class="table-border">후원자</th>
	                                            <th class="table-border">후원 금액</th>
	                                        </tr>
	                                    </thead>
	                                    <tbody>
	                                        <tr>
	                                            <td class="table-border table-left"></td>
	                                            <td class="table-border"></td>
	                                            <td class="table-border table-right"></td>
	                                        </tr>
	                                    </tbody>
	                                </table>
	                                <div class="page-navigation">
	                                    <ul id="history-pagination" class="pagination pagination-sm"></ul>
                                	</div>
	                            </div>
	                        </div>
	                        
	                        <div class="line-hr"></div>
	                        
	                        <div class="content-inner">
	                            <div class="content-title">
	                                <p class="content-title-name">병원 순위(리뷰)</p>
	                                <div class="line"></div>
	                            </div>
	                            <div id="s-history-list">
	                                <table id="HReview-table">
	                                    <colgroup>
	                                        <col width="20%">
	                                        <col width="40%">
	                                        <col width="40%">
	                                    </colgroup>
	                                    <thead>
	                                        <tr>
	                                            <th class="table-border">순위</th>
	                                            <th class="table-border">병원명</th>
	                                            <th class="table-border">리뷰 수</th>
	                                        </tr>
	                                    </thead>
	                                    <tbody>
	                                        <tr>
	                                            <td class="table-border table-left1"></td>
	                                            <td class="table-border"></td>
	                                            <td class="table-border table-right1"></td>
	                                        </tr>
	                                    </tbody>
	                                </table>
	                                <div class="page-navigation">
	                                    <ul id="HReview-pagination" class="pagination pagination-sm"></ul>
                                	</div>
	                            </div>
	                        </div>	                    	                        


	                        <div class="line-hr"></div>
	                        
	                        <div class="content-inner">
	                            <div class="content-title">
	                                <p class="content-title-name">병원 순위(북마크)</p>
	                                <div class="line"></div>
	                            </div>
	                            <div id="s-history-list">
	                                <table id="HBookmark-table">
	                                    <colgroup>
	                                        <col width="20%">
	                                        <col width="40%">
	                                        <col width="40%">
	                                    </colgroup>
	                                    <thead>
	                                        <tr>
	                                            <th class="table-border">순위</th>
	                                            <th class="table-border">병원명</th>
	                                            <th class="table-border">북마크 수</th>
	                                        </tr>
	                                    </thead>
	                                    <tbody>
	                                        <tr>
	                                            <td class="table-border table-left1"></td>
	                                            <td class="table-border"></td>
	                                            <td class="table-border table-right1"></td>
	                                        </tr>
	                                    </tbody>
	                                </table>
	                                <div class="page-navigation">
	                                    <ul id="HBM-pagination" class="pagination pagination-sm"></ul>
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
			<!-- 페이징 처리된 후원글, 후원내역, 댓글 조회 -->
			// 페이징 
			let currentPage = 1; // 현재 페이지 
			let status = 'all'; // 초기값 설정
			let naviCountPerPage = 5; // 한 그룹당 페이지 수
			let totalSupportPages = 0; // 총 후원글 페이지 수
			let totalReplyPages = 0; // 총 댓글 페이지 수
			let totalHistoryPages = 0; // 총 후원내역 페이지 수
			let totalHReviewPages = 0;
			let totalHBookMarkPages = 0;
			

			
// ====================================================================================================================================				
			
			// 후원 내역 리스트(for 후원순위)를 불러오는 ajax Function 
			const getHistoryListForRank = () => {
				$.ajax({
					url : "/admin/sRank.pet",
					data : { currentPage: currentPage }, // 현재 페이지와 페이지당 댓글 수 전달
					type : "GET",
					success : function(resultMap) {
						const tableBody = $("#history-table tbody");
						tableBody.html('');
						let sNo;
						let nickname;
						let amount;
						let sHNo;
						
						const sHList = resultMap.sHList; // 후원내역 리스트 
						totalHistoryPages = resultMap.totalPages; // 총 페이지 수
						const totalRecords = resultMap.totalRecords; // 후원내역 총 갯수
				        
						if(sHList.length > 0) {
							for(let i in sHList) {
								// 닉네임, 숨은천사 
								let sHName = sHList[i].sHName;
								if(sHList[i].sHType == 'A') {
									sHName = '숨은천사';
								}
								
								
								let sNo = sHList[i].sNo;
								let sHNo = sHList[i].sHNo;
								
								tr = $("<tr onclick='window.location.href=\"/support/detail.pet?sNo="+sHList[i].sNo+"\"' class='tr'>");
								sHNo = $("<td class='table-border table-left1'>").html(""+sHNo+""); 
								nickname = $("<td class='table-border'>").html(""+sHName+""); 
								amount = $("<td class='table-border table-right1'>").html(""+sHList[i].sHAmount.toLocaleString()+" 원"); 

								
				
								tr.append(sHNo);
								tr.append(nickname);
								tr.append(amount);

								tableBody.append(tr); 
								
								// 결과를 받은 후에 페이징을 업데이트
					            createHistoryPagination(totalHistoryPages);
							}
						} else {
							tr = $("<tr class='td'><td class='td'colspan='3'style='width:725px;'><div width='100%' style='color: lightgray;'>후원 내역이 없습니다.</div></td></tr>");
							tableBody.append(tr);
						}
					},
					error : function() {
						alert("Ajax 오류! 관리자에게 문의하세요.");
					}
				});
			}
			
			
			// 후원 내역 페이지 만들기 
			const createHistoryPagination = (totalHistoryPages) => {
			    const HistoryPaginationUl = $("#history-pagination");
			    HistoryPaginationUl.empty(); // 이전의 페이징 링크를 지움
			    
			    const naviCountPerPage = 5; // 한 그룹당 페이지 수
			    const numGroups = Math.ceil(totalHistoryPages / naviCountPerPage); // 총 그룹 수
			    const currentGroup = Math.ceil(currentPage / naviCountPerPage); // 현재 페이지가 속한 그룹

			    let startPage = (currentGroup - 1) * naviCountPerPage + 1;
			    let endPage = Math.min(currentGroup * naviCountPerPage, totalHistoryPages);
			    
			 	// "이전" 버튼 추가
			    if (currentGroup > 1) {
			        const prevLi = $('<li class="page-item"><a class="page-link" href="javascript:void(0)"><i class="bi bi-caret-left-fill"></i></a></li>');
			        prevLi.click(() => {
			        	goToPreviousHistoryGroup();
			        });
			        HistoryPaginationUl.append(prevLi);
			    }
			 	// 페이지 링크 추가
			    for (let i = startPage; i <= endPage; i++) {
			        const li = $('<li class="page-item" data-page="${i}"><a class="page-link" href="javascript:void(0)">'+i+'</a></li>');
			        
			     	// 현재 페이지에 해당하는 경우 클래스 추가
			        if (i === currentPage) {
			            li.addClass('active');
			        }
			     
			        li.click(() => {
			            changeHistoryPage(i);
			        });
			        HistoryPaginationUl.append(li);
			    }
			 	
				// "다음" 버튼 추가
			    if (currentGroup < numGroups) {
			        const nextLi = $('<li class="page-item"><a class="page-link" href="javascript:void(0)"><i class="bi bi-caret-right-fill"></i></a></li>');
			        nextLi.click(() => {
			        	goToNextHistoryGroup();
			        });
			        HistoryPaginationUl.append(nextLi);
			    }
			}
			
			// 후원내역 페이지 변경 시 호출되는 함수
			const changeHistoryPage = (newPage) => {
			    currentPage = newPage;
			    getHistoryListForRank(currentPage);
			}
			
			// 후원내역 그룹 변경 시 호출되는 함수
			const changeHistoryGroup = (newGroup) => {
			    currentPage = (newGroup - 1) * naviCountPerPage + 1;
			    getHistoryListForRank(currentPage);
			}

			// 후원내역 이전 그룹으로 이동할 때 호출 
			const goToPreviousHistoryGroup = () => {
			    const currentGroup = Math.ceil(currentPage / naviCountPerPage);
			    if (currentGroup > 1) {
			        const lastPageOfPreviousGroup = (currentGroup - 1) * naviCountPerPage;
			        changeHistoryPage(lastPageOfPreviousGroup);
			    }
			}

			// 후원내역 다음 그룹으로 이동할 때 호출
			const goToNextHistoryGroup = () => {
			    const numGroups = Math.ceil(totalHistoryPages / naviCountPerPage);
			    const currentGroup = Math.ceil(currentPage / naviCountPerPage);
			    if (currentGroup < numGroups) {
			    	changeHistoryGroup(currentGroup + 1);
			    }
			}
			
// ====================================================================================================================================				
			
			// 병원 내역 리스트(for 리뷰수순위)를 불러오는 ajax Function 
			const getHReviewListForRank = () => {
				$.ajax({
					url : "/admin/HReview.pet",
					data : { currentPage: currentPage }, // 현재 페이지와 페이지당 댓글 수 전달
					type : "GET",
					success : function(resultMap) {
						const tableBody = $("#HReview-table tbody");
						tableBody.html('');
						let hRNo;
						let hRContent;
						let hRStatus;
						
						const hRList = resultMap.hRList; // 후원내역 리스트 
						totalHReviewPages = resultMap.totalPages; // 총 페이지 수
						const totalRecords = resultMap.totalRecords; // 후원내역 총 갯수
				        
						if(hRList.length > 0) {
							for(let i in hRList) {				
								
								let hNo = hRList[i].hNo;
								let hRNo = hRList[i].hRNo;
								let hRContent = hRList[i].hRContent;
								let hRStatus = hRList[i].hRStatus;
								
								tr = $("<tr onclick='window.location.href=\"/hospital/detail.pet?hNo="+hRList[i].hNo+"\"' class='tr'>");
								hRNo = $("<td class='table-border table-left1'>").html(""+hRNo+""); 
								hRContent = $("<td class='table-border'>").html(""+hRContent+""); 
								hRStatus = $("<td class='table-border table-right1'>").html(""+hRList[i].hRStatus.toLocaleString()+" 개"); 

								
				
								tr.append(hRNo);
								tr.append(hRContent);
								tr.append(hRStatus);

								tableBody.append(tr); 
								
								// 결과를 받은 후에 페이징을 업데이트
					            createHReviewPagination(totalHReviewPages);
							}
						} else {
							tr = $("<tr class='td'><td class='td'colspan='3'style='width:725px;'><div width='100%' style='color: lightgray;'>후원 내역이 없습니다.</div></td></tr>");
							tableBody.append(tr);
						}
					},
					error : function() {
						alert("Ajax 오류! 관리자에게 문의하세요.");
					}
				});
			}
			
			
			// 후원 내역 페이지 만들기 
			const createHReviewPagination = (totalHReviewPages) => {
			    const HReviewPaginationUl = $("#HReview-pagination");
			    HReviewPaginationUl.empty(); // 이전의 페이징 링크를 지움
			    
			    const naviCountPerPage = 5; // 한 그룹당 페이지 수
			    const numGroups = Math.ceil(totalHReviewPages / naviCountPerPage); // 총 그룹 수
			    const currentGroup = Math.ceil(currentPage / naviCountPerPage); // 현재 페이지가 속한 그룹


			    let startPage = (currentGroup - 1) * naviCountPerPage + 1;
			    let endPage = Math.min(currentGroup * naviCountPerPage, totalHReviewPages);
			    
			 	// "이전" 버튼 추가
			    if (currentGroup > 1) {
			        const prevLi = $('<li class="page-item"><a class="page-link" href="javascript:void(0)"><i class="bi bi-caret-left-fill"></i></a></li>');
			        prevLi.click(() => {
			        	goToPreviousHReviewGroup();
			        });
			        HReviewPaginationUl.append(prevLi);
			    }
			 	// 페이지 링크 추가
			    for (let i = startPage; i <= endPage; i++) {
			        const li = $('<li class="page-item" data-page="${i}"><a class="page-link" href="javascript:void(0)">'+i+'</a></li>');
			        
			     	// 현재 페이지에 해당하는 경우 클래스 추가
			        if (i === currentPage) {
			            li.addClass('active');
			        }
			     
			        li.click(() => {
			        	changeHReviewPage(i);
			        });
			        HReviewPaginationUl.append(li);
			    }
			 	
				// "다음" 버튼 추가
			    if (currentGroup < numGroups) {
			        const nextLi = $('<li class="page-item"><a class="page-link" href="javascript:void(0)"><i class="bi bi-caret-right-fill"></i></a></li>');
			        nextLi.click(() => {
			        	goToNextHReviewGroup();
			        });
			        HReviewPaginationUl.append(nextLi);
			    }
			} 
			
			// 후원내역 페이지 변경 시 호출되는 함수
			const changeHReviewPage = (newPage) => {
			    currentPage = newPage;
			    getHReviewListForRank(currentPage);
			}
			
			// 후원내역 그룹 변경 시 호출되는 함수
			const changeHReviewGroup = (newGroup) => {
			    currentPage = (newGroup - 1) * naviCountPerPage + 1;
			    getHReviewListForRank(currentPage);
			}

			// 후원내역 이전 그룹으로 이동할 때 호출 
			const goToPreviousHReviewGroup = () => {
			    const currentGroup = Math.ceil(currentPage / naviCountPerPage);
			    if (currentGroup > 1) {
			        const lastPageOfPreviousGroup = (currentGroup - 1) * naviCountPerPage;
			        changeHReviewPage(lastPageOfPreviousGroup);
			    }
			}

			// 후원내역 다음 그룹으로 이동할 때 호출
			const goToNextHReviewGroup = () => {
			    const numGroups = Math.ceil(totalHReviewPages / naviCountPerPage);
			    const currentGroup = Math.ceil(currentPage / naviCountPerPage);
			    if (currentGroup < numGroups) {
			    	changeHReviewGroup(currentGroup + 1);
			    }
			}
			
// ====================================================================================================================================

// ====================================================================================================================================				
			
			// 병원 내역 리스트(for 북마크 순위)를 불러오는 ajax Function 
			const getHBookMarkListForRank = () => {
				$.ajax({
					url : "/admin/HBookmark.pet",
					data : { currentPage: currentPage }, // 현재 페이지와 페이지당 댓글 수 전달
					type : "GET",
					success : function(resultMap) {
						const tableBody = $("#HBookmark-table tbody");
						tableBody.html('');
						let hNo;
						let hAddr;
						let hName;
						let hX;
						
						const hBMList = resultMap.hBMList; // 후원내역 리스트 
						totalHBookMarkPages = resultMap.totalPages; // 총 페이지 수
						const totalRecords = resultMap.totalRecords; // 후원내역 총 갯수
				        
						if(hBMList.length > 0) {
							for(let i in hBMList) {				
								
								let hNo = hBMList[i].hNo;
								let hAddr = hBMList[i].hAddr;
								let hName = hBMList[i].hName;
								let hX = hBMList[i].hX;
								
								tr = $("<tr onclick='window.location.href=\"/hospital/detail.pet?hNo="+hBMList[i].hNo+"\"' class='tr'>");
								hAddr = $("<td class='table-border table-left1'>").html(""+hAddr+""); 
								hName = $("<td class='table-border'>").html(""+hName+""); 
								hX = $("<td class='table-border table-right1'>").html(""+hBMList[i].hX.toLocaleString()+" 개");  

								
				
								tr.append(hAddr);
								tr.append(hName);
								tr.append(hX);

								tableBody.append(tr); 
								
								// 결과를 받은 후에 페이징을 업데이트
					            createHBookMarkPagination(totalHBookMarkPages);
							}
						} else {
							tr = $("<tr class='td'><td class='td'colspan='3'style='width:725px;'><div width='100%' style='color: lightgray;'>후원 내역이 없습니다.</div></td></tr>");
							tableBody.append(tr);
						}
					},
					error : function() {
						alert("Ajax 오류! 관리자에게 문의하세요.");
					}
				});
			}
			
			
			// 후원 내역 페이지 만들기 
			const createHBookMarkPagination = (totalHBookMarkPages) => {
			    const HBookMarkPaginationUl = $("#HBM-pagination");
			    HBookMarkPaginationUl.empty(); // 이전의 페이징 링크를 지움
			    
			    const naviCountPerPage = 5; // 한 그룹당 페이지 수
			    const numGroups = Math.ceil(totalHBookMarkPages / naviCountPerPage); // 총 그룹 수
			    const currentGroup = Math.ceil(currentPage / naviCountPerPage); // 현재 페이지가 속한 그룹


			    let startPage = (currentGroup - 1) * naviCountPerPage + 1;
			    let endPage = Math.min(currentGroup * naviCountPerPage, totalHBookMarkPages);
			    
			 	// "이전" 버튼 추가
			    if (currentGroup > 1) {
			        const prevLi = $('<li class="page-item"><a class="page-link" href="javascript:void(0)"><i class="bi bi-caret-left-fill"></i></a></li>');
			        prevLi.click(() => {
			        	goToPreviousHBMGroup();
			        });
			        HBookMarkPaginationUl.append(prevLi);
			    }
			 	// 페이지 링크 추가
			    for (let i = startPage; i <= endPage; i++) {
			        const li = $('<li class="page-item" data-page="${i}"><a class="page-link" href="javascript:void(0)">'+i+'</a></li>');
			        
			     	// 현재 페이지에 해당하는 경우 클래스 추가
			        if (i === currentPage) {
			            li.addClass('active');
			        }
			     
			        li.click(() => {
			        	changeHBMPage(i);
			        });
			        HBookMarkPaginationUl.append(li);
			    }
			 	
				// "다음" 버튼 추가
			    if (currentGroup < numGroups) {
			        const nextLi = $('<li class="page-item"><a class="page-link" href="javascript:void(0)"><i class="bi bi-caret-right-fill"></i></a></li>');
			        nextLi.click(() => {
			        	goToNextHBMGroup();
			        });
			        HBookMarkPaginationUl.append(nextLi);
			    }
			} 
			
			// 후원내역 페이지 변경 시 호출되는 함수
			const changeHBMPage = (newPage) => {
			    currentPage = newPage;
			    getHBookMarkListForRank(currentPage);
			}
			
			// 후원내역 그룹 변경 시 호출되는 함수
			const changeHBMGroup = (newGroup) => {
			    currentPage = (newGroup - 1) * naviCountPerPage + 1;
			    getHBookMarkListForRank(currentPage);
			}

			// 후원내역 이전 그룹으로 이동할 때 호출 
			const goToPreviousHBMGroup = () => {
			    const currentGroup = Math.ceil(currentPage / naviCountPerPage);
			    if (currentGroup > 1) {
			        const lastPageOfPreviousGroup = (currentGroup - 1) * naviCountPerPage;
			        changeHBMPage(lastPageOfPreviousGroup);
			    }
			}

			// 후원내역 다음 그룹으로 이동할 때 호출
			const goToNextHBMGroup = () => {
			    const numGroups = Math.ceil(totalHBookMarkPages / naviCountPerPage);
			    const currentGroup = Math.ceil(currentPage / naviCountPerPage);
			    if (currentGroup < numGroups) {
			    	changeHBMGroup(currentGroup + 1);
			    }
			}
			
// ====================================================================================================================================	
	
	
			
			// 출력 
			$(function(){
				getHistoryListForRank();
				getHReviewListForRank();
				getHBookMarkListForRank();
			})
			
			

		</script>
		<!-- 통계 그래프 -->
		<script>
			// Inspired by https://dribbble.com/shots/1821178-Sales-Report/
			// 현재 날짜를 가져오는 JavaScript 코드
	        var currentDate = new Date();
	        var payCurrentDate = new Date();
	        
	        // 날짜를 원하는 형식으로 포맷
	        var year = currentDate.getFullYear();
	        var month = String(currentDate.getMonth() + 1).padStart(2, '0');
	        var day = String(currentDate.getDate()).padStart(2, '0');
	        var formattedDate = month + "/" + day;
	        var paydateFormatted = year + "-" + month + "-" + day;
	        
			// 배열 초기화
			var labels = [formattedDate];
			var paydateArr = [paydateFormatted];
			var kakaoArr = [];
			var creditArr = [];
			var totalArr = [];
			
			
			// 6일 동안의 이전 날짜를 labels 배열에 추가
			for (var i = 0; i < 6; i++) {
			    currentDate.setDate(currentDate.getDate() - 1); // 하루씩 이전 날짜로 이동
			    var month = String(currentDate.getMonth() + 1).padStart(2, '0');
			    var day = String(currentDate.getDate()).padStart(2, '0');
			    var previousDate = month + "/" + day;
			    labels.unshift(previousDate); // 배열의 맨 앞에 추가
			}
			
			// 날짜 비교를 위해 7일 동안의 이전 날짜를 paydateArr 배열에 추가
			for (var i = 0; i < 6; i++) {
				payCurrentDate.setDate(payCurrentDate.getDate() - 1); // 하루씩 이전 날짜로 이동
			    var month = String(payCurrentDate.getMonth() + 1).padStart(2, '0');
			    var day = String(payCurrentDate.getDate()).padStart(2, '0');
			    var payPreviousDate = year + "-" + month + "-" + day;
			    paydateArr.unshift(payPreviousDate); // 배열의 맨 앞에 추가
			}
			
			<c:forEach items="${sList}" var="sList">
				for(var i = 0; i < paydateArr.length; i++) {
					if(('${sList.sHPaytype}' == 'kakaopay') && ('${sList.paydate}' == paydateArr[i])) {
						kakaoArr[i] = ${sList.totalAmount};
					}
					if(('${sList.sHPaytype}' == 'creditcard') && ('${sList.paydate}' == paydateArr[i])) {
						creditArr[i] = ${sList.totalAmount};
					}
					if(('${sList.sHPaytype}' == '') && ('${sList.paydate}'== paydateArr[i])) {
						totalArr[i] = ${sList.totalAmount};
					}
				}
			</c:forEach>

			const data = {
			  labels: labels,
			  datasets: [
			    {
			      label: '총합',
			      data: totalArr,
			      borderColor: "rgba(236,72,127,1)",
			      backgroundColor: "rgba(236,72,127,.1)",
			      fill: true,
			      tension: 0.4,
			    }, {
			      label: '신용카드',
			      data: creditArr,
			      borderColor: "#1b79ce",
			      backgroundColor: "#cce2ef9c",
			      fill: true,
			      tension: 0.4
			    }, {
			      label: '카카오페이',
			      data: kakaoArr,
			      borderColor: "#fee339",
			      backgroundColor: "#fffbebb5",
			      fill: true,
			      tension: 0.4
			    }
			  ]
			};

			const ctx = document.getElementById('c1');
			Chart.defaults.font.family = "GmarketSansMedium";
			  new Chart(ctx, {
				  type: 'line',
				  data: data,
				  options: {
				    responsive: true,
				    plugins: {
				    },
				    interaction: {
				      intersect: false,
				    },
				    scales: {
				      x: {
				        display: true,
				      },
				      y: {
				        display: true,
				        suggestedMin: 0,
				      }
				    }
				  },
			  });
		</script>
	</body>
</html>