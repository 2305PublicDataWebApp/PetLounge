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
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/0.2.0/Chart.min.js"></script>
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
	                                        <a href="#">회원 관리</a>
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
	                                <p class="main-title-name">통계 관리</p>
	                            </div>
	                        </div>
	                        <div class="line-hr"></div>
	                        <div class="content-title">
	                            <p class="content-title-name">가입자수 통계</p>
	                            <div class="line"></div>
	                        </div>
	                        <div class="line-hr"></div>
	                        <div class="content-title">
	                            <p class="content-title-name">후원금액 통계(일별)</p>
	                            <div class="line"></div>
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
	                        
	                        
<!-- 	                        <div class="content-inner"> -->
<!-- 	                            <div class="content-title"> -->
<!-- 	                                <p class="content-title-name">병원 순위(좋아요)</p> -->
<!-- 	                                <div class="line"></div> -->
<!-- 	                            </div> -->
<!-- 	                            <div id="s-reply-list"> -->
<!-- 	                                <table id="reply-table"> -->
<%-- 	                                    <colgroup> --%>
<%-- 	                                        <col width="35%"> --%>
<%-- 	                                        <col width="35%"> --%>
<%-- 	                                        <col width="15%"> --%>
<%-- 	                                        <col width="15%"> --%>
<%-- 	                                    </colgroup> --%>
<!-- 	                                    <thead> -->
<!-- 	                                        <tr> -->
<!-- 	                                            <th class="table-border">모금함 제목</th> -->
<!-- 	                                            <th class="table-border">댓글 내용</th> -->
<!-- 	                                            <th class="table-border">작성자</th> -->
<!-- 	                                            <th class="table-border">작성일</th> -->
<!-- 	                                        </tr> -->
<!-- 	                                    </thead> -->
<!-- 	                                    <tbody> -->
<!-- 	                                        <tr> -->
<!-- 	                                            <td class="table-border table-left"></td> -->
<!-- 	                                            <td class="table-border table-left"></td> -->
<!-- 	                                            <td class="table-border"></td> -->
<!-- 	                                            <td class="table-border"></td> -->
<!-- 	                                        </tr> -->
<!-- 	                                    </tbody> -->
<!-- 	                                </table> -->
<!-- 	                                <div class="page-navigation"> -->
<!-- 	                                    <ul id="reply-pagination" class="pagination pagination-sm"></ul> -->
<!--                                 	</div> -->
<!-- 	                            </div> -->
<!-- 	                        </div> -->
	                        
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
			
			// 후원글 리스트를 불러오는 ajax Function 
			const getSupportList = (currentPage, status) => {
				$.ajax({
					url : "/admin/sList.pet",
					data : { currentPage : currentPage, status : status}, // 현재 페이지와 후원 상태 전달 
					type : "GET",
					success : function(resultMap) {
						const tableBody = $("#support-table tbody");
						tableBody.html('');
						let tr;
						let category;
						let title;
						let group;
						let term;
						let amounts;
						
						const sList = resultMap.sList; // 후원글 리스트 
						totalSupportPages = resultMap.totalPages; // 총 페이지 수
						
						if(sList.length > 0) {
							for(let i in sList) {
								
								// 카테고리 한글로 넣어주기  
								let sCategory = '';
								switch(sList[i].sCategory) {
								case 'residence' : 
									sCategory = '주거';
									break;
								case 'living' : 
									sCategory = '생계';
									break;
								case 'health' : 
									sCategory = '건강';
									break;
								case 'improvement' : 
									sCategory = '개선';
									break;
								}
								
								// Date타입 날짜 형식 변환 
								function formatDate(dataString) {
									const dateParts = dataString.match(/(\d{1,2})월 (\d{1,2}), (\d{4})/);
									if (dateParts) {
										var year = dateParts[3];
										var month = dateParts[1].padStart(2, '0');
										var day = dateParts[2].padStart(2, '0');   
										// 'padStart' 함수 = 월과 일이 1자리 숫자일 경우 앞에 '0' 을 추가하여 2자리 숫자로 만들어 줌
							      	  
							      		// YYYY.MM.DD 형식으로 조합
							      		var formattedDate = year + "." + month + "." + day;
							      		return formattedDate;
							      	} else {
							      		// 날짜 문자열을 올바르게 파싱하지 못한 경우에 대한 오류 처리
							      		console.error("날짜를 파싱하지 못했습니다.");
									}
						        }
								
								// 후원글 제목 길이 잘라주기 
								let title = sList[i].sTitle;
								let truncatedTitle = title.length > 30 ? title.substring(0, 29) + '...' : title;
						        
								tr = $("<tr onclick='window.location.href=\"/support/detail.pet?sNo="+sList[i].sNo+"\"' class='tr'>");
								category = $("<td class='table-border'>").html(""+sCategory+""); 
								title = $("<td class='table-border table-left'>").html(""+truncatedTitle+""); 
								group = $("<td class='table-border'>").html(""+sList[i].sGroup+""); 
								term = $("<td class='table-border'>").html(""+formatDate(sList[i].sStart)+"<br> ~ "+formatDate(sList[i].sEnd)+""); 
								amounts = $("<td class='table-border table-right'>").html(""+sList[i].sFundAmount.toLocaleString()+" / <br>"+sList[i].sTargetAmount.toLocaleString()+" 원"); 
								
				
								tr.append(category);
								tr.append(title);
								tr.append(group);
								tr.append(term);
								tr.append(amounts);
								tableBody.append(tr); 
								
								// 결과를 받은 후에 페이징을 업데이트
					            createSupportPagination(totalSupportPages);
							}
						} else {
							tr = $("<tr class='td'><td class='td'colspan='5'style='width:725px;'><div width='100%' style='color: lightgray;'>후원글이 없습니다.</div></td></tr>");
							tableBody.append(tr);
						}
					},
					error : function() {
						alert("Ajax 오류! 관리자에게 문의하세요.");
					}
				});
			}
			// 후원글 페이지 만들기 
			const createSupportPagination = (totalSupportPages) => {
			    const SupportPaginationUl = $("#support-pagination");
			    SupportPaginationUl.empty(); // 이전의 페이징 링크를 지움
			    
			    const numGroups = Math.ceil(totalSupportPages / naviCountPerPage); // 총 그룹 수
			    const currentGroup = Math.ceil(currentPage / naviCountPerPage); // 현재 페이지가 속한 그룹
	
			    let startPage = (currentGroup - 1) * naviCountPerPage + 1;
			    let endPage = Math.min(currentGroup * naviCountPerPage, totalSupportPages);
			    
			 	// "이전" 버튼 추가
			    if (currentGroup > 1) {
			        const prevLi = $('<li class="page-item"><a class="page-link" href="javascript:void(0)"><i class="bi bi-caret-left-fill"></i></a></li>');
			        prevLi.click(() => {
			        	goToPreviousSupportGroup();
			        });
			        SupportPaginationUl.append(prevLi);
			    }
			 	// 페이지 링크 추가
			    for (let i = startPage; i <= endPage; i++) {
			        const li = $('<li class="page-item" data-page="${i}"><a class="page-link" href="javascript:void(0)">'+i+'</a></li>');
			        
			     	// 현재 페이지에 해당하는 경우 클래스 추가
			        if (i === currentPage) {
			            li.addClass('active');
			        }
			     
			        li.click(() => {
			        	changeSupportPage(i, status);
			        });
			        SupportPaginationUl.append(li);
			    }
			 	
				// "다음" 버튼 추가
			    if (currentGroup < numGroups) {
			        const nextLi = $('<li class="page-item"><a class="page-link" href="javascript:void(0)"><i class="bi bi-caret-right-fill"></i></a></li>');
			        nextLi.click(() => {
			        	goToNextSupportGroup();
			        });
			        SupportPaginationUl.append(nextLi);
			    }
			}
			
			// 후원글 페이지 변경 시 호출되는 함수
			const changeSupportPage = (newPage, status) => {
			    currentPage = newPage;
			    getSupportList(currentPage, status);
			}
			
			// 후원글 그룹 변경 시 호출되는 함수
			const changeSupportGroup = (newGroup, status) => {
			    currentPage = (newGroup - 1) * naviCountPerPage + 1;
			    getSupportList(currentPage, status);
			}
	
			// 후원글 이전 그룹으로 이동할 때 호출 
			const goToPreviousSupportGroup = () => {
			    const currentGroup = Math.ceil(currentPage / naviCountPerPage);
			    if (currentGroup > 1) {
			        const lastPageOfPreviousGroup = (currentGroup - 1) * naviCountPerPage;
			        changeSupportPage(lastPageOfPreviousGroup);
			    }
			}
	
			// 후원글 다음 그룹으로 이동할 때 호출
			const goToNextSupportGroup = () => {
			    const numGroups = Math.ceil(totalSupportPages / naviCountPerPage);
			    const currentGroup = Math.ceil(currentPage / naviCountPerPage);
			    if (currentGroup < numGroups) {
			    	changeSupportGroup(currentGroup + 1);
			    }
			}
			
			
			<!-- Timestamp타입 날짜 형식 변환 -->
			const getFormattedTimestamp = (dateString) => {
				// Date 객체를 생성
				const date = new Date(dateString);
				// 년, 월, 일 추출
				const year = date.getFullYear();
				const month = (date.getMonth() + 1).toString().padStart(2, '0'); // 월은 0부터 시작하므로 +1을 하고 두 자리로 포맷팅
				const day = date.getDate().toString().padStart(2, '0');
				// 최종 결과를 출력
				const formattedDate = year + '.' + month + '.' + day;
				return formattedDate;
			}
			
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
			
			// 댓글 리스트를 불러오는 ajax Function 
			const getReplyList = () => {
				$.ajax({
					url : "/admin/sRList.pet",
					data : { currentPage: currentPage }, // 현재 페이지와 페이지당 댓글 수 전달
					type : "GET",
					success : function(resultMap) {
						const tableBody = $("#reply-table tbody");
						tableBody.html('');
						let tr;
						let title;
						let content;
						let nickname;
						let date;
						
						const sRList = resultMap.sRList; // 댓글 리스트 
						totalReplyPages = resultMap.totalPages; // 총 페이지 수
						
						if(sRList.length > 0) {
							for(let i in sRList) {
								
								
								let sRDate = getFormattedTimestamp(sRList[i].sRCreate);
								if(sRList[i].sRCreate != sRList[i].sRUpdate) {
									sRDate = getFormattedTimestamp(sRList[i].sRUpdate);
								}
								// 후원글 제목 길이 잘라주기 
								let sTitle = sRList[i].sTitle;
								let truncatedTitle = sTitle.length > 18 ? sTitle.substring(0, 17) + '...' : sTitle;
								
								tr = $("<tr onclick='window.location.href=\"/support/detail.pet?sNo="+sRList[i].sNo+"\"' class='tr'>");
								title = $("<td class='table-border table-left'>").html(""+truncatedTitle+""); 
								content = $("<td class='table-border table-left'>").html(""+sRList[i].sRContent+""); 
								nickname = $("<td class='table-border'>").html(""+sRList[i].uNickName+""); 
								date = $("<td class='table-border'>").html(""+sRDate+""); 
								
								
								tr.append(title);
								tr.append(content);	
								tr.append(nickname); 
								tr.append(date); 
								tableBody.append(tr); 
								
								// 결과를 받은 후에 페이징을 업데이트
					            createReplyPagination(totalReplyPages);
							}
						} else {
							tr = $("<tr class='td'><td class='td'colspan='3'style='width:725px;'><div width='100%' style='color: lightgray;'>등록된 댓글이 없습니다.</div></td></tr>");
							tableBody.append(tr);
						}
					},
					error : function() {
						alert("Ajax 오류! 관리자에게 문의하세요.");
					}
				});
			}
			
			// 댓글 페이지 만들기 
			const createReplyPagination = (totalReplyPages) => {
			    const replyPaginationUl = $("#reply-pagination");
			    replyPaginationUl.empty(); // 이전의 페이징 링크를 지움
			    
			    const naviCountPerPage = 5; // 한 그룹당 페이지 수
			    const numGroups = Math.ceil(totalReplyPages / naviCountPerPage); // 총 그룹 수
			    const currentGroup = Math.ceil(currentPage / naviCountPerPage); // 현재 페이지가 속한 그룹

			    let startPage = (currentGroup - 1) * naviCountPerPage + 1;
			    let endPage = Math.min(currentGroup * naviCountPerPage, totalReplyPages);
			    
			 	// "이전" 버튼 추가
			    if (currentGroup > 1) {
			        const prevLi = $('<li class="page-item"><a class="page-link" href="javascript:void(0)"><i class="bi bi-caret-left-fill"></i></a></li>');
			        prevLi.click(() => {
			            goToPreviousGroup();
			        });
			        replyPaginationUl.append(prevLi);
			    }
			 	// 페이지 링크 추가
			    for (let i = startPage; i <= endPage; i++) {
			        const li = $('<li class="page-item" data-page="${i}"><a class="page-link" href="javascript:void(0)">'+i+'</a></li>');
			        
			     	// 현재 페이지에 해당하는 경우 클래스 추가
			        if (i === currentPage) {
			            li.addClass('active');
			        }
			     
			        li.click(() => {
			        	changeReplyPage(i);
			        });
			        replyPaginationUl.append(li);
			    }
			 	
				// "다음" 버튼 추가
			    if (currentGroup < numGroups) {
			        const nextLi = $('<li class="page-item"><a class="page-link" href="javascript:void(0)"><i class="bi bi-caret-right-fill"></i></a></li>');
			        nextLi.click(() => {
			            goToNextGroup();
			        });
			        replyPaginationUl.append(nextLi);
			    }
			}
			
			// 댓글 페이지 변경 시 호출되는 함수
			const changeReplyPage = (newPage) => {
			    currentPage = newPage;
			    getReplyList(currentPage);
			}
			
			// 댓글 그룹 변경 시 호출되는 함수
			const changeGroup = (newGroup) => {
			    currentPage = (newGroup - 1) * naviCountPerPage + 1;
			    getReplyList(currentPage);
			}

			// 댓글 이전 그룹으로 이동할 때 호출 
			const goToPreviousGroup = () => {
			    const currentGroup = Math.ceil(currentPage / naviCountPerPage);
			    if (currentGroup > 1) {
			        const lastPageOfPreviousGroup = (currentGroup - 1) * naviCountPerPage;
			        changeReplyPage(lastPageOfPreviousGroup);
			    }
			}

			// 댓글 다음 그룹으로 이동할 때 호출
			const goToNextGroup = () => {
			    const numGroups = Math.ceil(totalReplyPages / naviCountPerPage);
			    const currentGroup = Math.ceil(currentPage / naviCountPerPage);
			    if (currentGroup < numGroups) {
			        changeGroup(currentGroup + 1);
			    }
			}
			
			
			
			
			// 후원글, 댓글, 후원내역 출력 
			$(function(){
				getSupportList(currentPage, status);
				getHistoryListForRank();
				getReplyList();
			})
			
			
			<!-- 상태바 -->
	        const label = document.querySelector('.status-label');
	        const options = document.querySelectorAll('.optionItem');
	
	        // 클릭한 옵션의 텍스트를 라벨 안에 넣음
	        const handleSelect = (item) => {
	        label.parentNode.classList.remove('active');
	        status = item.getAttribute('data-status');
	        label.innerHTML = item.textContent;
		    currentPage = 1; 
			getSupportList(currentPage, status);
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
			
			var data1 = {
			  labels : labels,
			  datasets : [
			    {
			      // 전체
			      fillColor : "rgba(236,72,127,.1)",
			      strokeColor : "rgba(236,72,127,1)",
			      pointColor : "rgba(236,72,127,1)",
			      pointStrokeColor : "#FFF",
			      data : totalArr
			    },
			    {
			      // 신용카드
			      fillColor : "#cce2ef9c",
			      strokeColor : "#1b79ce",
			      pointColor : "#1b79ce",
			      pointStrokeColor : "#FFF",
			      data : creditArr
			    },
			    {
			      // 카카오페이
			      fillColor : "#fffbebb5",
			      strokeColor : "#fee339",
			      pointColor : "#fee339",
			      pointStrokeColor : "#FFF",
			      data : kakaoArr
			    }
			  ]
			}
	
			var options1 = {
			  scaleGridLineColor : "#eee",
			  scaleFontFamily: "GmarketSansMedium",
			  scaleFontSize: 14,
			  bezierCurve : true,
			  scaleShowLabels: true,
			  pointDotRadius: 6,
			  animation: true,
			  scaleShowGridLines: true,
			  datasetFill: true,
			  responsive: true
			}
	
// 			new Chart(c1.getContext("2d")).Line(data1,options1);
			
			var chart = new Chart(c1.getContext("2d")).Line(data1, {
				  scaleOverride: true,
				  scaleSteps: 7, // 원하는 스텝 수 설정
				  scaleStepWidth: 200000, // 스텝 너비 설정
				  scaleStartValue: 0
				});


			
		</script>
	</body>
</html>