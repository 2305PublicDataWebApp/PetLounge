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
				            <div class="status-wrap">
				                <div class="status" style="">
				                    <button name="" id="status-label" class="status-label">전체</button>
				                    <ul class="optionList">
				                        <li class="optionItem" data-status="all">전체</li>
				                        <li class="optionItem" data-status="onGoing">진행중</li>
				                        <li class="optionItem" data-status="closed">종료</li>
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
	                                            <td class="table-border"></td>
	                                            <td class="table-border table-left"></td>
	                                            <td class="table-border"></td>
	                                            <td class="table-border"></td>
	                                            <td class="table-border"></td>
	                                        </tr>
	                                    </tbody>
	                                </table>
	                                <div class="page-navigation">
	                                    <ul id="support-pagination" class="pagination pagination-sm"></ul>
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
	                                        <col width="40%">
	                                        <col width="15%">
	                                        <col width="17%">
	                                        <col width="15%">
	                                        <col width="13%">
	                                    </colgroup>
	                                    <thead>
	                                        <tr>
	                                            <th class="table-border">모금함 제목</th>
	                                            <th class="table-border">후원자</th>
	                                            <th class="table-border">후원 금액</th>
	                                            <th class="table-border">후원일</th>
	                                            <th class="table-border">결제 방법</th>
	                                        </tr>
	                                    </thead>
	                                    <tbody>
	                                        <tr>
	                                            <td class="table-border table-left"></td>
	                                            <td class="table-border"></td>
	                                            <td class="table-border table-right"></td>
	                                            <td class="table-border"></td>
	                                            <td class="table-border"></td>
	                                        </tr>
	                                    </tbody>
	                                </table>
	                                <div class="page-navigation">
	                                    <ul id="history-pagination" class="pagination pagination-sm"></ul>
                                	</div>
	                            </div>
	                        </div>
	                        <div class="content-inner">
	                            <div class="content-title">
	                                <p class="content-title-name">펫 라운지 모금함 : 후원 댓글 조회</p>
	                                <div class="line"></div>
	                            </div>
	                            <div id="s-reply-list">
	                                <table id="reply-table">
	                                    <colgroup>
	                                        <col width="35%">
	                                        <col width="35%">
	                                        <col width="15%">
	                                        <col width="15%">
	                                    </colgroup>
	                                    <thead>
	                                        <tr>
	                                            <th class="table-border">모금함 제목</th>
	                                            <th class="table-border">댓글 내용</th>
	                                            <th class="table-border">작성자</th>
	                                            <th class="table-border">작성일</th>
	                                        </tr>
	                                    </thead>
	                                    <tbody>
	                                        <tr>
	                                            <td class="table-border table-left"></td>
	                                            <td class="table-border table-left"></td>
	                                            <td class="table-border"></td>
	                                            <td class="table-border"></td>
	                                        </tr>
	                                    </tbody>
	                                </table>
	                                <div class="page-navigation">
	                                    <ul id="reply-pagination" class="pagination pagination-sm"></ul>
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
			
			
			
			// 후원 내역 리스트를 불러오는 ajax Function 
			const getHistoryList = () => {
				$.ajax({
					url : "/admin/sHList.pet",
					data : { currentPage: currentPage }, // 현재 페이지와 페이지당 댓글 수 전달
					type : "GET",
					success : function(resultMap) {
						const tableBody = $("#history-table tbody");
						tableBody.html('');
						let title;
						let nickname;
						let amount;
						let paytype;
						let paydate;
						
						const sHList = resultMap.sHList; // 후원내역 리스트 
						totalHistoryPages = resultMap.totalPages; // 총 페이지 수
				        
						if(sHList.length > 0) {
							for(let i in sHList) {
								// 닉네임, 숨은천사 
								let sHName = sHList[i].sHName;
								if(sHList[i].sHType == 'A') {
									sHName = '숨은천사';
								}
								
								// 결제방법 이미지 넣어주기
								let sHPaytypeImage = '';
								switch(sHList[i].sHPaytype) {
								case 'kakaopay' : sHPaytypeImage = '/resources/images/user/kakaoLogo2.png'; break;
								case 'creditcard' : sHPaytypeImage = '/resources/images/user/card_credit.png'; break;
								}
								
								// 후원글 제목 길이 잘라주기 
								let sTitle = sHList[i].sTitle;
								let truncatedTitle = sTitle.length > 21 ? sTitle.substring(0, 20) + '...' : sTitle;
								
								tr = $("<tr onclick='window.location.href=\"/support/detail.pet?sNo="+sHList[i].sNo+"\"' class='tr'>");
								title = $("<td class='table-border table-left'>").html(""+truncatedTitle+""); 
								nickname = $("<td class='table-border'>").html(""+sHName+""); 
								amount = $("<td class='table-border table-right'>").html(""+sHList[i].sHAmount.toLocaleString()+"원"); 
								paydate = $("<td class='table-border'>").html(""+getFormattedTimestamp(sHList[i].sHPaydate)+""); 
								paytype = $("<td class='table-border'>").html("<img src='"+sHPaytypeImage+"' style='width: 25px; height: 25px'>"); 
								
				
								tr.append(title);
								tr.append(nickname);
								tr.append(amount);
								tr.append(paydate);
								tr.append(paytype);
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
			    getHistoryList(currentPage);
			}
			
			// 후원내역 그룹 변경 시 호출되는 함수
			const changeHistoryGroup = (newGroup) => {
			    currentPage = (newGroup - 1) * naviCountPerPage + 1;
			    getHistoryList(currentPage);
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
				getHistoryList();
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
		
	</body>
</html>