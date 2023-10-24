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
	                                <p class="main-title-name">회원 관리</p>
	                            </div>
	                        </div>
	                        <div class="line-hr"></div>

	                        
	                        <div class="content-inner">
	                            <div class="content-title">
	                                <p class="content-title-name">회원 목록 조회</p>
	                                <div class="line"></div>
	                            </div>
	                            <div id="s-history-list">
	                                <table id="history-table">
	                                    <colgroup>
	                                        <col width="10%">
	                                        <col width="20%">
	                                        <col width="20%">
	                                        <col width="20%">
	                                        <col width="30%">
	                                    </colgroup>
	                                    <thead>
	                                        <tr>
	                                            <th class="table-border">번호</th>
	                                            <th class="table-border">아이디</th>
	                                            <th class="table-border">이름</th>
	                                            <th class="table-border">닉네임</th>
	                                            <th class="table-border">휴대폰</th>
	                                        </tr>
	                                    </thead>
	                                    <tbody>
	                                        <tr>
	                                            <td class="table-border table-left1"></td>
	                                            <td class="table-border"></td>
	                                            <td class="table-border"></td>
	                                            <td class="table-border"></td>
	                                            <td class="table-border table-right1"></td>
	                                        </tr>
	                                    </tbody>
	                                </table>
	                                <div class="page-navigation">
	                                    <ul id="history-pagination" class="pagination pagination-sm"></ul>
                                	</div>
	                            </div>
	                        </div>


	                        <div class="line-hr"></div>


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
			

			
// ====================================================================================================================================				
			
			//회원 내역 리스트를 불러오는 ajax Function 
			const getHistoryListForRank = () => {
				$.ajax({
					url : "/admin/userlist.pet",
					data : { currentPage: currentPage }, // 현재 페이지와 페이지당 댓글 수 전달
					type : "GET",
					success : function(resultMap) {
						const tableBody = $("#history-table tbody");
						tableBody.html('');
						let uAddr;
						let uId;
						let uName;
						let uNickName;
						let uPhone;
						
						const sUList = resultMap.sUList; // 후원내역 리스트 
						totalHistoryPages = resultMap.totalPages; // 총 페이지 수
						const totalRecords = resultMap.totalRecords; // 후원내역 총 갯수
				        
						if(sUList.length > 0) {
							for(let i in sUList) {					
								
								let uAddr = sUList[i].uAddr;
			                    let uId = sUList[i].uId;
			                    let uName = sUList[i].uName;
			                    let uNickName = sUList[i].uNickName;
			                 	// 휴대폰 번호에 '-' 추가
			                    let uPhone = sUList[i].uPhone; // 휴대폰 번호 받아오기
			                    // '-'를 추가하여 포맷팅
			                    uPhone = uPhone.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
								
								tr = $("<tr onclick='event.preventDefault()' class='tr'>");
// 								tr = $("<tr onclick='window.location.href=\"/user/userInfo.pet?uId="+sUList[i].uId+"\"' class='tr'>");
								uAddr = $("<td class='table-border table-left1'>").html(""+uAddr+""); 
								uId = $("<td class='table-border'>").html(""+uId+""); 
								uName = $("<td class='table-border'>").html(""+uName+""); 
								uNickName = $("<td class='table-border'>").html(""+uNickName+""); 
								uPhone = $("<td class='table-border table-right1'>").html(""+uPhone+""); 

								
				
								tr.append(uAddr);
								tr.append(uId);
								tr.append(uName);
								tr.append(uNickName);
								tr.append(uPhone);

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
					// 출력 
			$(function(){
				getHistoryListForRank(currentPage);
				getHistoryList();
			})
			
			// ====================================================================================================================================				

	
		</script>

	</body>
</html>