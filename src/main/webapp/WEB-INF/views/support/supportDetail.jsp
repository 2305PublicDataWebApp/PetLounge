<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<jsp:include page="../include/importSource.jsp"></jsp:include>
		<link rel="stylesheet" href="/resources/css/support/supportDetail.css">
		<title>Pet Lounge</title>
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
                                    < <span style="color:#FFD370;">1</span> 2 3 4 5 >>
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
                                    <tr>
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
                                    <tr>
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
                                    <tr>
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
                                    <tr>
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
                                    << <span style="color:#FFD370;">1</span> 2 3 4 5 >>
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
                                            <span class="user-nickname">
                                                동숲주민
                                            </span>
                                        </div>
                                        <div id="reply-modify-div">
                                            <form action="" method="">
                                                <textarea name="" class="reply-modify-content" placeholder="댓글 내용을 수정해주세요"></textarea>
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
                        <button class="support-btn"  onClick="location.href='/support/payment.do?sNo='+${support.sNo }">후원 함께 하기</button>
                    </div>
                    <div class="section-group">
                        <p>모금단체<br>
                        <strong class="s-group">${support.sGroup }</strong></p>
                    </div>
                </div>
            </section>
            <section id="button" style="margin-bottom: 100px;">
                <div><button class="btn-cancel" onClick="location.href='/support/list.do'">목록으로</button></div>
                <div class="admin-btn">
                    <button class="btn-update" onClick="location.href='/support/update.do?sNo='+${support.sNo }">수정하기</button>
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
					url : "/sReply/insert.do",
					data : { sRContent : sRContent, sNo : sNo },
					type : "POST",
					success : function(result) {
						if(result == "success") {
							alert("댓글 등록 성공");
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
			// 날짜 포맷팅 
			const getFormattedDate = (dateString) => {
			    const options = { year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit'};
			    const formattedDate = new Date(dateString).toLocaleDateString('ko-KR', options);
			    return formattedDate;
			};
			// 댓글 리스트를 불러오는 ajax Function 
			const getReplyList = () => {
				const sNo = ${support.sNo };
				$.ajax({
					url : "/sReply/list.do",
					data : { sNo : sNo}, 
					type : "GET",
					success : function(result) {
						const tableBody = $("#replyTable tbody");
						tableBody.html('');
						let tr;
						let left;
						let center;
						let right;
						
						if(result.length > 0) {
							for(let i in result) {
								tr = $("<tr>"); // <tr></tr>
								left = $("<td class='td'>").html("<div style='width: 50px; height: 50px; background-color: #FFD370; border-radius: 100%;'></div>"); // <td>khuser01</td>
								center = $("<td class='td'>").html(
										"<div class='user-info-div'><span class='user-nickname'>"+result[i].uId+"</span><span class='reply-create-date'>"+getFormattedDate(result[i].sRCreate)+"</span></div><div class='reply-content'>"+result[i].sRContent+"</div>"); // <td>댓글내용</td>
								right = $("<td class='td'>").html(
										"<a href='' class='reply-modify-btn' data-bs-toggle='modal' data-bs-target='#modifyModal'>수정</a><a href='' class='reply-delete-btn'>삭제</a>"); // <td>2023/09/26</td>
								tr.append(left);
								tr.append(center);
								tr.append(right); // <tr><td></td><td></td>...</tr>
								tableBody.append(tr); // <tbody><tr><td></td><td></td>...</tr></tbody> -> 눈에 보이게 됨
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
					location.href = "/support/delete.do?sNo=" + sNo;
				}
			}
        </script>
	</body>
</html>