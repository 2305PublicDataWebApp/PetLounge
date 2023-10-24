<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="/resources/css/reset.css">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		<link rel="stylesheet" href="/resources/css/include/header.css">
		<link rel="stylesheet" href="/resources/css/include/footer.css">
		<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
		
     	
   		<style type="text/css">
        	@import url('https://fonts.googleapis.com/css2?family=Red+Hat+Text:wght@400;700&display=swap');
			@import url('https://fonts.googleapis.com/css2?family=Permanent+Marker&display=swap');
			@font-face {
			    font-family: 'GmarketSansMedium';
			    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
			    font-weight: normal;
			    font-style: normal;
			}
	        *:not(.f-content *) {
			    font-family: 'GmarketSansMedium';
			    font-size: 1em;
			    color: #3d3d3d;
			}
			*:not(.f-content) h1 {
			    font-family: 'GmarketSansMedium';
			    font-size: 2.5em;
			    font-weight: bold;
			} 
			*:not(.f-content) .edit {
			    font-family: Pretendard;
			    color: #ffffff;
			    font-size: 13px;
			    font-weight: bold;
			} 
			*:not(.f-content) .backtolist2 {
			    font-family: Pretendard;
			    border-color: #ffffff;
			    color: #ffd370;
			    font-size: 13px;
			    font-weight: bold;
			} 
        </style> 
		
		
        <link rel="stylesheet" href="/resources/css/board/freeDetail.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard-dynamic-subset.css" />
        <title>자유게시판</title>
<!--     <script> -->
<!--     history.replaceState({}, null, location.patuId); -->
<!--     </script> -->
    </head>
    <body>
        <jsp:include page="../include/header.jsp"></jsp:include>
            
        <main class="custom-main">
        
        <section id="title-section">
            <h1>자유게시판</h1>
            <div id="line"></div>
        </section>

		<div class="bmark">
			<div class="sub-bmark">
	          	<c:if test="${ fBookmark eq 1 }">
				    <span data-tooltip-text="북마크" style="color: #FFD370;" onclick="fBookmark(${ bOne.fNo });">
				        <i id="bookmark-icon" class="bi bi-bookmark-heart-fill"></i>
				    </span>
				</c:if>
				<c:if test="${ fBookmark eq 0 }">
				    <span data-tooltip-text="북마크" style="color: #FFD370;" onclick="fBookmark(${ bOne.fNo });">
				        <i id="bookmark-icon" class="bi bi-bookmark" id="empty"></i>
				    </span>
				</c:if>
			</div>
		</div>
        <div class="square-container">
            <div id="notice">
                <ul>
                    <li><input type="text" class="notice-title" value="${board.fTitle }" readonly></li>
                    <li class="user-info">
                        <div class="user-img">
                            <img src="${profileImgUrl }" alt="유저 프로필 이미지">
                            <span>${uNickname}</span>
                        </div>
                        <div class="menu">
                            <div class="info">
                                <span>
                                <fmt:formatDate pattern="yyyy.MM.dd" value="${board.fCreate }" />                                
                                </span>
                                <span>조회수 ${board.fViewCount +1}</span>
                            </div>
                        </div> 
                    </li>
                    <li>
	                   	<div class="f-content">
					    	<div class="custom-text-box">
					        	${board.fContent }
					    	</div>
                    	</div>
                    </li>
                </ul>
            </div>
        </div>
		<c:choose>
		    <c:when test="${sessionScope.uId == 'admin'}">
		        <div class="square-container2">
		            <div class="search-container3"> 
		                <div class="sub">
		                    <button class="submit" onclick="location.href='/board/freeDetailEdit.pet?fNo='+${board.fNo }">수정하기</button>
		                    <button class="submit-del" onclick="freeBoardDelete();">삭제하기</button>
		                </div>
		                <button class="backtolist1" onClick="location.href='/board/freeList.pet'">목록으로</button>
		            </div>
		        </div>
		    </c:when>
		    <c:when test="${sessionScope.uId != null && sessionScope.uId == board.uId}">
		        <div class="square-container2">
		            <div class="search-container"> 
		                <div class="sub">
		                    <button class="submit" onclick="location.href='/board/freeDetailEdit.pet?fNo='+${board.fNo }">수정하기</button>
		                    <button class="submit-del" onclick="freeBoardDelete();">삭제하기</button>
		                </div>
<!-- 		                <button class="bookmark">북마크하기</button> -->
		                <button class="backtolist" onClick="location.href='/board/freeList.pet'">목록으로</button>
		            </div>
		        </div>
		    </c:when>				
		    <c:when test="${sessionScope.uId != null && sessionScope.uId != board.uId}">
		        <div class="square-container2">
		            <div class="search-container-1"> 
		                <button class="backtolist" onClick="location.href='/board/freeList.pet'">목록으로</button>
		            </div>
		        </div>
		    </c:when>
		    <c:otherwise>
		        <div class="square-container2">
		            <div class="search-container-1"> 
		                <button class="backtolist" onClick="location.href='/board/freeList.pet'">목록으로</button>
		            </div>
		        </div>
		    </c:otherwise>
		</c:choose>        
          
            <!-- 댓글 리스트 -->
            <div class="reply-container">
            <section id="hospital-review-section">
                <!-- 등록 -->
                <div id="reply-create-div">
                    <input type="text" class="reply-input" name="fRContent" id="reply-create-content" placeholder="댓글 내용을 작성해주세요" required>
                    <button class="submit2" id="reply-create-btn" onclick="fbReplyInsert(${ bOne.fNo });">등록</button>
                </div>
                <!-- 리스트 -->
                <div id="reply-list-div">
                    <table id="reply-table">
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
					<div id="search-div">
						<c:if test="${ fRSearchKeyword ne null }">
						<input type="search" value="${ fRSearchKeyword }" name="fRSearchKeyword" id="f-r-search-keyword" class="search-input" placeholder="${ bOne.uId } 댓글 검색">                     	
						</c:if>
						<c:if test="${ fRSearchKeyword eq null }">
							<input type="search" name="fRSearchKeyword" id="f-r-search-keyword" class="search-input" placeholder="댓글 검색">                     	
						</c:if>
						<span class="material-symbols-outlined search-icon" id="search-icon" style="font-size: 2em; color: #FFD370; cursor: pointer; margin-left: 10px;">
				        	<i class="bi bi-search" id="searchIcon" ></i>
				    	</span>
					</div>
					<div id="page-navigation">
					    <ul id="pagination" class="pagination pagination-sm"></ul>
					</div>
                </div>
            </section>
            </div>
            
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
<!--                                     <div style="width: 50px; height: 50px; background-color: #FFD370; border-radius: 100%; margin-right: 20px;"></div> -->
									<img src="" class="reply-modify-profile-img" style="border-radius: 100%; border: 2px solid #FFD370; width:50px; height:50px; margin-right: 20px;">
                                    <span class="user-nickname modify-user-nickname">
                                    </span>
                                </div>
                                <div id="reply-modify-div">
                                   	<input type="hidden" name="fRNo" class="f-r-no">
                                    <input type="text" name="fRContent" class="reply-modify-content" placeholder="댓글을 수정해 주세요">
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn modal-modify-btn" onclick="modifyReply();">수정</button>
                            </div>
                        </div>
                    </div>
                </div>      
            </section>

        </main>
        
		<jsp:include page="../include/footer.jsp"></jsp:include>   
		
		<script>
			function freeBoardDelete() {
				const fNo = '${board.fNo}';
				if (confirm("삭제하시겠습니까?")) {
					location.href = "/board/fdelete.pet?fNo=" + fNo;
				}
			}
		</script>
		
		<!--========================================= 즐겨찾기 =========================================-->
		<script>
		    function fBookmark(bookmarkfNo) {
		    	console.log(bookmarkfNo);	
		        var bookmark = document.getElementById('bookmark-icon');
		
		        $.ajax({
		            url: '/board/addToFBookmark.pet',
		            type: 'POST',
		            data: {
		                fNo: bookmarkfNo
		            },
		            success: function (data) {		// success 함수: Ajax 요청이 성공할 경우 실행되는 함수
		                if (data == "insert") {
		                    bookmark.classList.remove('bi-bookmark');
		                    bookmark.classList.add('bi-bookmark-heart-fill');
		                } else if (data == "delete") {
		                    bookmark.classList.remove('bi-bookmark-heart-fill');
		                    bookmark.classList.add('bi-bookmark');
		                } else if (data == "loginFail") {
		                    alert("로그인이 필요한 서비스입니다.");
		                    location.href="/user/login.pet";
		                } 
		            },
		            error: function () {
		            	alert("게시글 북마크 오류. 관리자에게 문의 바랍니다.");
		            }
		        });
		    }
		</script>		     
		
		<!--========================================= 댓글 =========================================-->
		<script>
			// 댓글 등록 
			function fbReplyInsert(fNo) {
				const fRContent = $("#reply-create-content").val().trim();
				$.ajax({
					url : '/fReply/insert.pet',
					type : 'POST',
					data : { 
						fNo : fNo,
						fRContent : fRContent 
					},
					success : function(data) {
						if(data == "success") {
							$("#reply-create-content").val("");
							getReplyList();
						} else if(data == "loginFail") {
							alert("로그인이 필요한 서비스입니다."); 
							location.href="/user/login.pet";
						} else if (data == "empty") {
		                	alert("댓글 내용은 비워둘 수 없습니다.");
		                } else {
							alert("댓글 등록 실패");
						}
					},
					error : function() {
						alert("댓글 작성 오류. 관리자에게 문의 바랍니다.");
					}
				});
			}
			
			// 댓글 수정창 보이기 
			function openModifyView(fRNo, fRNickName, fRContent, fRProfileImg) {
				document.querySelector('.f-r-no').value = fRNo;
				document.querySelector('.modify-user-nickname').innerText = fRNickName;
				document.querySelector('.reply-modify-content').value = fRContent;
				document.querySelector('.reply-modify-profile-img').src = fRProfileImg;
				let modifyButton = document.querySelector('.modal-modify-btn');
// 				modifyButton.addEventListener('click', function() {
// 					modifyReply();
// 				});	
			}
			
			// 댓글 수정 
			function modifyReply() {
				let fRNo = document.querySelector('.f-r-no').value;
				let fRContent = document.querySelector('.reply-modify-content').value.trim();
				$.ajax({
					url : '/fReply/update.pet',
					type : 'POST',
					data : { 
						fRNo : fRNo,
						fRContent : fRContent 
					},
					success : function(data) {
						if(data == "success") {
							document.querySelector('[data-bs-dismiss="modal"]').click(); // 모달 닫는 버튼이 클릭되어서 닫히게 함 
							getReplyList(); // 댓글 목록 새로고침 
						} else if(data == "loginFail") {
							alert("로그인이 필요한 서비스입니다."); 
							location.href="/user/login.pet";
						} else if (data == "empty") {
		                	alert("댓글 내용은 비워둘 수 없습니다.");
		                } else {
							alert("댓글 수정 실패");
						}
					},
					error : function() {
						alert("댓글 수정 오류. 관리자에게 문의 바랍니다.");
					}
				});
			}
			
			// 댓글 삭제 체크 
			function checkdeleteReply(fRNo) {
				if (confirm("댓글을 삭제하시겠습니까?")) {
					deleteReply(fRNo);
				}
			}
			
			// 댓글 삭제 
			function deleteReply(fRNo) {
				$.ajax({
					url : '/fReply/delete.pet',
					type : 'POST',
					data : { 
						fRNo : fRNo 
					},
					success : function(data) {
						if(data == "success") {
							getReplyList();
						} else {
							alert("댓글 삭제 실패");
						}
					},
					error : function() {
						alert("댓글 삭제 오류. 관리자에게 문의 바랍니다.");
					}
				});
			}
			
			// 댓글 페이징 
			let currentPage = 1; // 현재 페이지 
			let recordCountPerPage = 5; // 페이지당 댓글 수 
			let naviCountPerPage = 5; // 한 그룹당 페이지 수
			let totalPages = 0; // 총 페이지 수
			
			// 날짜 포맷팅 (댓글 작성일에 사용)
			function getFormattedDate(dateString) {
			    const options = { year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit'};
			    const formattedDate = new Date(dateString).toLocaleDateString('ko-KR', options);
			    return formattedDate;
			};
			
			// 댓글 리스트를 불러오는 ajax Function 
			function getReplyList() {
				let sessionId = '${ sessionScope.uId }';
				const fNo = '${ bOne.fNo }';
				$.ajax({
					url : "/fReply/list.pet",
					type : "GET",
					dataType: "json",
					data : { 
						fNo : fNo, 
						currentPage: currentPage, 
						recordCountPerPage: recordCountPerPage 
					}, // 현재 페이지와 페이지당 댓글 수 전달
					success : function(data) {
						const tableBody = $("#reply-table tbody");
						tableBody.html('');
						let tr;
						let left;
						let center;
						let right;
						
						const fRList = data.fRList; // 댓글 리스트 
				        totalPages = data.totalPages; // 총 페이지 수
						
						if(fRList.length > 0) {
							for(let i in fRList) {
								tr = $("<tr>"); // <tr></tr>
								left = $("<td class='td'>").html("<img src='" + fRList[i].fRProfileImg + "' width='50px' height='50px' style='border-radius: 100%; border: 2px solid #FFD370;'>");
								
								if(fRList[i].fRCreate === fRList[i].fRUpdate) {
									center = $("<td class='td'>").html(
											"<div class='user-info-div'><span class='user-nickname'>"+fRList[i].fRNickName+"</span><span class='reply-create-date'>"
											+ ""+getFormattedDate(fRList[i].fRCreate)+"</span></div><div class='reply-content'>"+fRList[i].fRContent+"</div>"); 
								} else {
									center = $("<td class='td'>").html(
											"<div class='user-info-div'><span class='user-nickname'>"+fRList[i].fRNickName+"</span><span class='reply-create-date'>"
											+ ""+getFormattedDate(fRList[i].fRUpdate)+"&nbsp;(수정됨)</span></div><div class='reply-content'>"+fRList[i].fRContent+"</div>");
								}
										
								if(sessionId === fRList[i].uId || sessionId === 'admin') {
									right = $("<td class='td'>").html(
											"<a href='javascript:void(0)' class='reply-modify-btn' data-bs-toggle='modal' data-bs-target='#modifyModal' "
											+ "onclick='openModifyView("+fRList[i].fRNo+",\""+fRList[i].fRNickName+"\",\""+fRList[i].fRContent+"\",\"" + fRList[i].fRProfileImg + "\");'>수정</a>"
											+ "<a href='javascript:void(0)' class='reply-delete-btn' onclick='checkdeleteReply("+fRList[i].fRNo+");'>삭제</a>"); 
								} else {
									right = $("<td class='td'>").html("");
								}
								
								tr.append(left);
								tr.append(center);
								tr.append(right); 
								tableBody.append(tr); 
								
								// 결과를 받은 후에 페이징을 업데이트
					            createPagination(data.totalPages);
							}
						} else {
							tr = $("<tr class='td'><td class='td'colspan='3'><div style='color: lightgray;'>등록된 댓글이 없습니다</div></td></tr>");
							tableBody.append(tr);
						}
					},
					error : function() {
						alert("댓글 리스트 호출 오류. 관리자에게 문의 바랍니다.");
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
			
			
			<!--========================================= 댓글 검색 =========================================-->
			// 자유게시판 댓글 검색결과 리스트를 불러오는 ajax Function
			function searchFBReply(currentPage) {
				var fRSearchKeyword = document.getElementById('f-r-search-keyword').value.trim();
				let sessionId = '${ sessionScope.uId }';
				
				if(fRSearchKeyword !== '') {
					$.ajax ({
						url: "/fReply/search.pet",
						type: "POST",
						dataType: "json",
						data: {
							fNo: ${ bOne.fNo },
							fRSearchKeyword: fRSearchKeyword,
							currentPage: currentPage, 
							recordCountPerPage: recordCountPerPage 
						},
						success: function(data) {
							const tableBody = $("#reply-table tbody");
							tableBody.html('');
							let tr;
							let left;
							let center;
							let right;
							
							const fRList = data.fRList; // 댓글 리스트 
					        totalPages = data.totalPages; // 총 페이지 수
							
							if(fRList.length > 0) {
								th = $("<th colspan='3' style='text-align: left; font-size: 1.2em;'><span style='color: #FFD370;'>" + fRSearchKeyword + "</span> 검색 결과</th>");
								tableBody.append(th);
								for(let i in fRList) {
	
									tr = $("<tr>"); // <tr></tr>
									left = $("<td class='td'>").html("<img src='" + fRList[i].fRProfileImg + "' width='50px' height='50px' style='border-radius: 100%; border: 2px solid #FFD370;'>");
	
									if(fRList[i].fRCreate === fRList[i].fRUpdate) {
										center = $("<td class='td'>").html(
												"<div class='user-info-div'><span class='user-nickname'>"+fRList[i].fRNickName+"</span><span class='reply-create-date'>"
												+ ""+getFormattedDate(fRList[i].fRCreate)+"</span></div><div class='reply-content'>"+fRList[i].fRContent+"</div>"); 
									} else {
										center = $("<td class='td'>").html(
												"<div class='user-info-div'><span class='user-nickname'>"+fRList[i].fRNickName+"</span><span class='reply-create-date'>"
												+ ""+getFormattedDate(fRList[i].fRUpdate)+"&nbsp;(수정됨)</span></div><div class='reply-content'>"+fRList[i].fRContent+"</div>");
									}
											
									if(sessionId === fRList[i].uId || sessionId === 'admin') {
										right = $("<td class='td'>").html(
												"<a href='javascript:void(0)' class='reply-modify-btn' data-bs-toggle='modal' data-bs-target='#modifyModal' "
												+ "onclick='openModifyView("+fRList[i].fRNo+",\""+fRList[i].fRNickName+"\",\""+fRList[i].fRContent+"\",\"" + fRList[i].fRProfileImg + "\");'>수정</a>"
												+ "<a href='javascript:void(0)' class='reply-delete-btn' onclick='checkdeleteReply("+fRList[i].fRNo+");'>삭제</a>"); 
									} else {
										right = $("<td class='td'>").html("");
									}
									
									tr.append(left);
									tr.append(center);
									tr.append(right); 
									tableBody.append(tr); 
									
									// 결과를 받은 후에 페이징을 업데이트
						            rCreatePagination(data.totalPages);
								}
							} else {
								th = $("<th colspan='3' style='text-align: left; font-size: 1.2em;'><span style='color: #FFD370;'>" + fRSearchKeyword + "</span> 검색 결과</th>");
								tr = $("<tr class='td'><td class='td'colspan='3'><div style='color: lightgray;'>등록된 댓글이 없습니다</div></td></tr>");
								tableBody.append(th);
								tableBody.append(tr);
								$("#pagination").html('');
							}
						}, 
						error: function() {
// 							alert("${ bOne.uId} 댓글 검색 오류. 관리자에게 문의 바랍니다.");
							alert("${ bOne.uId} 댓글 검색 오류. 관리자에게 문의 바랍니다.");
						}
					});
				} else {
					getReplyList();
					$("#pagination").html('');
				}
			}
			
			// 댓글 검색결과 페이지 만들기 
			const rCreatePagination = (totalPages) => {
				var fRSearchKeyword = document.getElementById('f-r-search-keyword').value.trim();
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
			        	rGoToPreviousGroup();
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
			        	rChangePage(i);
			        });
			        paginationUl.append(li);
			    }
				// "다음" 버튼 추가
			    if (currentGroup < numGroups) {
			        const nextLi = $('<li class="page-item"><a class="page-link" href="javascript:void(0)"><i class="bi bi-caret-right-fill"></i></a></li>');
			        nextLi.click(() => {
			        	rGoToNextGroup();
			        });
			        paginationUl.append(nextLi);
			    }
			}
			
			// 페이지 변경 시 호출되는 함수
			const rChangePage = (newPage) => {
			    currentPage = newPage;
			    searchFBReply(currentPage);
			}
			
			// 그룹 변경 시 호출되는 함수
			const rChangeGroup = (newGroup) => {
			    currentPage = (newGroup - 1) * naviCountPerPage + 1;
			    searchFBReply(currentPage);
			}
	
			// 이전 그룹으로 이동할 때 호출 
			const rGoToPreviousGroup = () => {
			    const currentGroup = Math.ceil(currentPage / naviCountPerPage);
			    if (currentGroup > 1) {
			        const lastPageOfPreviousGroup = (currentGroup - 1) * naviCountPerPage;
			        rChangePage(lastPageOfPreviousGroup);
			    }
			}
	
			// 다음 그룹으로 이동할 때 호출
			const rGoToNextGroup = () => {
			    const numGroups = Math.ceil(totalPages / naviCountPerPage);
			    const currentGroup = Math.ceil(currentPage / naviCountPerPage);
			    if (currentGroup < numGroups) {
			    	rChangeGroup(currentGroup + 1);
			    }
			}
			
			$(function(){
				getReplyList();
				// setInterval(getReplyList, 1000); // 1초 단위로 getReplyList가 호출되어 댓글 실시간 조회
			})
		</script>
		<!-- 자유게시판 댓글 검색 (input search) -->
		<script>
			document.getElementById('f-r-search-keyword').addEventListener('keypress', function (event) {
			    if (event.key === 'Enter') {
			    	currentPage = 1;
			    	searchFBReply(currentPage);
			    }
			});
			
			document.getElementById("search-icon").addEventListener("click", function() {
				currentPage = 1;
				searchFBReply(currentPage);
			});
        </script>
		
    </body>
    </html>
    
    
    