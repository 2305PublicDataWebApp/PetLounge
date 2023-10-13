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
		<link rel="stylesheet" href="/resources/css/support/supportDetail.css">
		<title>펫 라운지 모금함 : 상세</title>
	</head>
	<body>
		<jsp:include page="../include/header.jsp"></jsp:include>
		
		<main id="main">
            <section id="title">
                <h1>펫 라운지 모금함</h1>
                <div id="line"></div>
			</section>
            <section id="content">
                <div id="content-left">
                    <div class="content-left-top">
                        <span style="margin-right:20px; width: 95px;"><h3 class="h3" style="color: #FFD370;">[ ${support.sCategory } ]</h3></span>
                        <span><h3 class="h3">${support.sTitle }</h3></span>
                    </div>
                    <div class="s-content">
                        ${support.sContent }
                    </div>
                    <!-- 댓글, 후원 내역 리스트 -->
                    <section id="support-action-section">
                        <div id="action-title">
                            <ul class="tab-list" role="tablist" style="padding-left:0px;">
                                <li class="tab-item"> 
                                    <button id="reply-tab" class="tabs" style="color: #FFD370;">댓글</button>
                                </li>
                                <li class="tab-item">
                                    <button id="history-tab" class="tabs">참여내역</button>
                                </li>
                            </ul>
                        </div>
                        <!-- 댓글탭 -->
                        <div id="reply-tabpanel" style="display: block;">
                            <!-- 등록 -->
                            <div id="reply-create-div">
	                            <textarea name="sRContent" id="reply-create-content" placeholder="응원의 댓글을 남겨주세요."></textarea>
	                            <input type="submit" value="등록" id="reply-create-btn">
                            </div>
                            <!-- 댓글 리스트 -->
                            <div id="reply-list-div">
                                <table id="replyTable">
                                    <colgroup>
                                        <col style="width: 5%;">
                                        <col style="width: 80%;">
                                        <col style="width: 15%;">
      	                              </colgroup>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                </table>
                                <div id="page-navigation">
                                    <ul id="pagination" class="pagination pagination-sm"></ul>
                                </div>
                            </div>
                        </div>
                        <!-- 후원내역탭 -->
                        <div id="history-tabpanel" style="display: none;">
                            <!-- 총 후원건 -->
                            <div id="history-div">
                                <p style="margin-top: 10px;">총 1,909건이 기부되었습니다.</p>
                            </div>
                            <!-- 후원 내역 -->
                            <div id="reply-list-div">
                                <table>
                                    <colgroup>
                                        <col style="width: 5%;">
                                        <col style="width: 80%;">
                                        <col style="width: 15%;">
                                    </colgroup>
                                    <tr class="tr">
                                        <td class="td">
                                            <div style="width: 50px; height: 50px; background-color: #FFD370; border-radius: 100%;"></div>
                                        </td>
                                        <td class="td">
                                            <div class="user-info-div">
                                                <span class="support-history-date">
                                                    2023.10.03 
                                                </span>
                                            </div>
                                            <div class="reply-content">
                                                <span class="user-nickname">
                                                    동숲주민
                                                </span>
                                                <span class="support-amount">
                                                    <span style="color:#FFD370;">200,000</span>원 참여 
                                                </span>
                                            </div>
                                        </td>
                                        <td class="td">
                                        </td>
                                    </tr>
                                </table>
                                <div id="page-navigation">
                                    <ul id="pagination" class="pagination pagination-sm">
	                                    <li class="page-item"><a class="page-link" href="javascript:void(0)"><i class="bi bi-caret-left-fill"></i></a></li>
	                                    <li class="page-item"><a class="page-link" href="javascript:void(0)"><i class="bi bi-caret-right-fill"></i></a></li>
									</ul>
                                </div>
                            </div>
                        </div>
                    </section>
                
                    <!-- 수정 모달창 -->
                    <section>
                        <div class="modal fade" id="modifyModal" tabindex="-1" aria-labelledby="modifyModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="modify-user-info-div">
                                            <div style="width: 50px; height: 50px; background-color: #FFD370; border-radius: 100%; margin-right: 20px;"></div>
                                            <span class="user-nickname modify-user-nickname">
                                                동숲주민
                                            </span>
                                        </div>
                                        <div id="reply-modify-div">
                                            <form action="" method="">
                                            	<input type="hidden" value="" name="sRNo" class="s-r-no">
                                                <textarea name="sRContent" class="reply-modify-content" placeholder="댓글 내용을 수정해주세요"></textarea>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn modal-modify-btn">수정</button>
                                    </div>
                                </div>
                            </div>
                        </div>      
                    </section>
                </div>
                <div id="content-right">
                    <!-- 후원 상태 -->
                    <div class="section-status">
                        <div class="graph-status">
                            <span class="per">
                                <strong class="num" id="per-num">64</strong>%
                            </span>
                        </div>
                        <div class="graph-bar">
                            <span class="graph-num" id="graph-num" style="width:64%;"></span>
                        </div>
                        <div class="term-area">
                            <p>${support.sStart } ~ ${support.sEnd }</p>
                        </div>
                        <div>
                            <span id="d-day" class="d-day">D-25</span>
                        </div>
                        <div class="num-area">
                            <p class="fund-amount"><span  id="s-fund-amount">0</span>원</p>
                            <p class="target-amount"><span id="s-target-amount">0</span>원 목표</p>
                        </div>
                    </div>
                    <!-- 후원 버튼 -->
                    <div class="section-btn">
                        <button class="support-btn"  onClick="location.href='/support/payment.pet?sNo='+${support.sNo }">후원 함께 하기</button>
                    </div>
                    <div class="section-group">
                        <p>모금단체<br>
                        <strong class="s-group">${support.sGroup }</strong></p>
                    </div>
                </div>
            </section>
            <section id="button" style="margin-bottom: 100px;">
                <div><button class="btn-cancel" onClick="location.href='/support/list.pet'">목록으로</button></div>
                <div class="admin-btn">
                    <button class="btn-update" onClick="location.href='/support/update.pet?sNo='+${support.sNo }">수정하기</button>
                    <button class="btn-delete" onclick="checkDelete();">삭제하기</button>
                </div>
                
            </section>
        </main>
		
		<jsp:include page="../include/footer.jsp"></jsp:include>
		<script>
			// 댓글 등록 
			$("#reply-create-btn").on("click", function() {
				const sRContent = $("#reply-create-content").val();
				const sNo = ${support.sNo };
				$.ajax({
					url : "/sReply/insert.pet",
					data : { sRContent : sRContent, sNo : sNo },
					type : "POST",
					success : function(result) {
						if(result == "success") {
							getReplyList();
							$("#reply-create-content").val("");
						} else {
							alert("댓글 등록 실패");
						}
					},
					error : function() {
						alert("Ajax 오류! 관리자에게 문의하세요.");
					}
				});
			});
			
			// 댓글 수정창 보이기 
			const openModifyView = (sRNo, sRWriter, sRContent) => {
				console.log(sRNo + sRWriter + sRContent);
				document.querySelector('.s-r-no').value = sRNo;
				document.querySelector('.modify-user-nickname').innerText = sRWriter;
				document.querySelector('.reply-modify-content').value = sRContent;
				let modifyButton = document.querySelector('.modal-modify-btn');
				modifyButton.addEventListener('click', function() {
					modifyReply();
				});	
			}
			
			// 댓글 수정 
			const modifyReply = () => {
				let sRNo = document.querySelector('.s-r-no').value;
				let sRContent = document.querySelector('.reply-modify-content').value;
				$.ajax({
					url : "/sReply/update.pet",
					data : { sRNo : sRNo, sRContent : sRContent},
					type : "POST",
					success : function(data) {
						if(data == "success") {
							document.querySelector('[data-bs-dismiss="modal"]').click(); // 모달 닫는 버튼이 클릭되어서 닫히게 함 
							getReplyList(); // 댓글 목록 새로고침 
						} else {
							alert("댓글 수정 실패!");
						}
					},
					error : function() {
						alert("Ajax 오류! 관리자에게 문의하세요.");
					}
				});
			}
			
			// 댓글 삭제 체크 
			function checkDeleteReply(sRNo) {
				if (confirm("삭제하시겠습니까?")) {
					deleteReply(sRNo);
				}
			}
			
			// 댓글 삭제 
			const deleteReply = (sRNo) => {
				$.ajax({
					url : "/sReply/delete.pet",
					data : { sRNo : sRNo },
					type : "GET",
					success : function(data) {
						if(data == "success") {
							getReplyList();
						} else {
							alert("댓글 삭제 실패!");
						}
					},
					error : function() {
						alert("Ajax 오류! 관리자에게 문의하세요.");
					}
				});
			}
			
			
			<!-- 페이징 처리된 댓글 조회 -->
			// 댓글 페이징 
			let currentPage = 1; // 현재 페이지 
			let recordCountPerPage = 10; // 페이지당 댓글 수 
			let naviCountPerPage = 5; // 한 그룹당 페이지 수
			let totalPages = 0; // 총 페이지 수
			
			// 날짜 포맷팅 (댓글 작성일에 사용)
			const getFormattedDate = (dateString) => {
			    const options = { year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit'};
			    const formattedDate = new Date(dateString).toLocaleDateString('ko-KR', options);
			    return formattedDate;
			};
			
			// 댓글 리스트를 불러오는 ajax Function 
			const getReplyList = () => {
				let sessionId = "${sessionScope.uId}";
				const sNo = ${support.sNo };
				$.ajax({
					url : "/sReply/list.pet",
					data : { sNo : sNo, currentPage: currentPage, recordCountPerPage: recordCountPerPage }, // 현재 페이지와 페이지당 댓글 수 전달
					type : "GET",
					success : function(resultMap) {
						const tableBody = $("#replyTable tbody");
						tableBody.html('');
						let tr;
						let left;
						let center;
						let right;
						
						const sRList = resultMap.sRList; // 댓글 리스트 
				        totalPages = resultMap.totalPages; // 총 페이지 수
						
						if(sRList.length > 0) {
							for(let i in sRList) {
								tr = $("<tr>"); // <tr></tr>
								left = $("<td class='td'>").html("<div style='width: 50px; height: 50px; background-color: #FFD370; border-radius: 100%;'></div>"); 
								center = $("<td class='td'>").html(
										"<div class='user-info-div'><span class='user-nickname'>"+sRList[i].sRWriter+"</span><span class='reply-create-date'>"
										+ ""+getFormattedDate(sRList[i].sRCreate)+"</span></div><div class='reply-content'>"+sRList[i].sRContent+"</div>"); 
								if(sessionId === sRList[i].uId) {
									right = $("<td class='td'>").html(
											"<a href='javascript:void(0)' class='reply-modify-btn' data-bs-toggle='modal' data-bs-target='#modifyModal' "
											+ "onclick='openModifyView("+sRList[i].sRNo+",\""+sRList[i].sRWriter+"\",\""+sRList[i].sRContent+"\");'>수정</a>"
											+ "<a href='javascript:void(0)' class='reply-delete-btn' onclick='checkDeleteReply("+sRList[i].sRNo+");'>삭제</a>"); 
								} else {
									right = $("<td class='td'>").html("");
								}
				
								tr.append(left);
								tr.append(center);
								tr.append(right); 
								tableBody.append(tr); 
								
								// 결과를 받은 후에 페이징을 업데이트
					            createPagination(resultMap.totalPages);
							}
						} else {
							tr = $("<tr class='td'><td class='td'colspan='3'style='width:725px;'><div width='100%'>등록된 댓글이 없습니다.</div></td></tr>");
							tableBody.append(tr);
						}
					},
					error : function() {
						alert("Ajax 오류! 관리자에게 문의하세요.");
					}
				});
			}
			
			// 페이지 만들기 
			const createPagination = (totalPages) => {
			    const paginationUl = $("#pagination");
			    paginationUl.empty(); // 이전의 페이징 링크를 지움
			    
			    const naviCountPerPage = 5; // 한 그룹당 페이지 수
			    const numGroups = Math.ceil(totalPages / naviCountPerPage); // 총 그룹 수
			    const currentGroup = Math.ceil(currentPage / naviCountPerPage); // 현재 페이지가 속한 그룹

			    let startPage = (currentGroup - 1) * naviCountPerPage + 1;
			    let endPage = Math.min(currentGroup * naviCountPerPage, totalPages);
			    
			 	// "이전" 버튼 추가
			    if (currentGroup > 1) {
			        const prevLi = $('<li class="page-item"><a class="page-link" href="javascript:void(0)"><i class="bi bi-caret-left-fill"></i></a></li>');
			        prevLi.click(() => {
			            goToPreviousGroup();
			        });
			        paginationUl.append(prevLi);
			    }
			 	// 페이지 링크 추가
			    for (let i = startPage; i <= endPage; i++) {
			        const li = $('<li class="page-item" data-page="${i}"><a class="page-link" href="javascript:void(0)">'+i+'</a></li>');
			        
			     	// 현재 페이지에 해당하는 경우 클래스 추가
			        if (i === currentPage) {
			            li.addClass('active');
			        }
			     
			        li.click(() => {
			            changePage(i);
			        });
			        paginationUl.append(li);
			    }
				// "다음" 버튼 추가
			    if (currentGroup < numGroups) {
			        const nextLi = $('<li class="page-item"><a class="page-link" href="javascript:void(0)"><i class="bi bi-caret-right-fill"></i></a></li>');
			        nextLi.click(() => {
			            goToNextGroup();
			        });
			        paginationUl.append(nextLi);
			    }
			}
			
			// 페이지 변경 시 호출되는 함수
			const changePage = (newPage) => {
			    currentPage = newPage;
			    getReplyList(currentPage);
			}
			
			// 그룹 변경 시 호출되는 함수
			const changeGroup = (newGroup) => {
			    currentPage = (newGroup - 1) * naviCountPerPage + 1;
			    getReplyList(currentPage);
			}

			// 이전 그룹으로 이동할 때 호출 
			const goToPreviousGroup = () => {
			    const currentGroup = Math.ceil(currentPage / naviCountPerPage);
			    if (currentGroup > 1) {
			        const lastPageOfPreviousGroup = (currentGroup - 1) * naviCountPerPage;
			        changePage(lastPageOfPreviousGroup);
			    }
			}

			// 다음 그룹으로 이동할 때 호출
			const goToNextGroup = () => {
			    const numGroups = Math.ceil(totalPages / naviCountPerPage);
			    const currentGroup = Math.ceil(currentPage / naviCountPerPage);
			    if (currentGroup < numGroups) {
			        changeGroup(currentGroup + 1);
			    }
			}
			
			$(function(){
				getReplyList();
				// setInterval(getReplyList, 1000); // 1초 단위로 getReplyList가 호출되어 댓글 실시간 조회
			})
			<!-- 디데이 구하기 -->
			const sStart = new Date('${support.sStart}');
		    const sEnd = new Date('${support.sEnd}');
		    const timeDiff = sEnd - sStart;
		    const daysDiff = Math.floor(timeDiff / (1000 * 60 * 60 * 24));
		    document.getElementById('d-day').innerText = "D-" + daysDiff;
			<!-- 목표 금액 불러온 숫자 사이에 , 넣어주기  -->
	        let sTargetAmount = (${support.sTargetAmount }).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	        $(document).ready(function() {
	            $('#s-target-amount').text(sTargetAmount);
	        });
			<!-- 후원 금액 불러온 숫자 사이에 , 넣어주기  -->
	        let sFundAmount = (${support.sFundAmount }).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	        $(document).ready(function() {
	            $('#s-fund-amount').text(sFundAmount);
	        });
	        <!-- 퍼센트 계산 -->
	        const targetAmount = parseFloat(${support.sTargetAmount });
	        const fundAmount = parseFloat(${support.sFundAmount });
	        const percentage = Math.round((fundAmount / targetAmount) * 100);
	        // 숫자 띄워주기 
	        $(document).ready(function() {
	            $('#per-num').text(percentage);
	        });
	        // 퍼센트바 보여주기 
	        $(document).ready(function() {
	            $('#graph-num').css('width', percentage + '%');
	        });
            <!-- 댓글, 후원내역 이동 -->
            document.addEventListener("DOMContentLoaded", function () {
                // 모든 탭을 숨기고 초기 탭을 표시
                const tabs = document.querySelectorAll('.tab-item');
                const tabpanels = document.querySelectorAll('[id$="-tabpanel"]');

                function showTab(tabId) {
                    tabpanels.forEach(panel => {
                        panel.style.display = (panel.id === tabId) ? 'block' : 'none';
                    });
                }

                tabs.forEach(tab => {
                    tab.addEventListener('click', (event) => {
                    const targetTabId = event.target.id + 'panel';
                    showTab(targetTabId);
                    });
                });
            });
            $(document).ready(function () {
                $(".tabs").click(function () {
                    var $selectedElement = $(this);
                    if(!$selectedElement.hasClass("selected")) {
                        $(".tabs").removeClass("selected").css("color", "black");
                        $selectedElement.addClass("selected").css("color", "#FFD370");
                    } else {
                        $selectedElement.removeClass("selected").css("color", "black");
                    }
                });
            });
         	// 게시글 삭제
			function checkDelete() {
				const sNo = '${support.sNo}';
				if (confirm("삭제하시겠습니까?")) {
					location.href = "/support/delete.pet?sNo=" + sNo;
				}
			}
        </script>
	</body>
</html>