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
        <link rel="stylesheet" href="/resources/css/board/freeList.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard-dynamic-subset.css" />
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <title>자유게시판</title>
    </head>
    <body>
        <jsp:include page="../include/header.jsp"></jsp:include>

        <main class="custom-main">

        <section id="title-section">
            <h1>자유게시판</h1>
            <div id="line"></div>
        </section>

<!--             게시글 목록 -->
			<div class="square-container">
			    <div id="portfolio">
<!-- 			        여기에 동적으로 생성된 자유게시판 목록이 들어갈 것입니다 -->
			    </div>

			    <ul id="pagination" class="pagination">
<!-- 			    페이지 링크가 들어갈 부분입니다 -->
			    </ul>
    		    <c:if test="${sessionScope.uId != null}">
				    <div class="fsubmit">
				    	<button class="submit" onClick="location.href='/board/freeDetailSubmit.pet'">글쓰기</button>
				    </div>
			    </c:if>
			</div>

        </main>
      	
		<jsp:include page="../include/footer.jsp"></jsp:include>
		<script>

			<!-- 페이징 처리된 게시글 조회 -->
				// 게시글 페이징 
				let currentPage = 1; // 현재 페이지 
				let recordCountPerPage = 5; // 페이지당 게시글 수 
				let naviCountPerPage = 5; // 한 그룹당 페이지 수
				let totalPages = 0; // 총 페이지 수
				
				// 게시글 리스트를 불러오는 ajax Function 
				const getFreeBoardList = (page) => {
					if(page == null) {
						page = 1;	// 첫 번째 페이지(페이지 번호 1)의 게시글 목록을 가져오도록 함
						} 
				    currentPage = page;		//currentPage 변수를 page로 설정, 페이지 번호를 나타냄, 이후 AJAX 요청에서 현재 페이지를 서버에 전달하는 데 사용
					$.ajax({
						url : "/board/freeList1.pet", // 서버에서 데이터를 가져올 URL
						data : { 
							currentPage: currentPage, // 현재 페이지
							recordCountPerPage: recordCountPerPage }, // 페이지당 게시글 수
						type : "GET",
						success : function(resultMap) {
					        // 성공 시 실행될 콜백 함수
							const portfolio = $("#portfolio");  // id가 "portfolio"인 요소를 선택하는데 사용
							portfolio.html('');	  // 해당 요소의 내용을 비우는 역할을 합니다. 이로써 이전에 표시된 내용은 지워지고, 새로운 내용을 추가할 준비가 됨
							const fList = resultMap.freeBoardList; // 후원글 리스트 
					        totalPages = resultMap.totalSearchPages; // 총 페이지 수 (함수 외부에서 선언한 totalPages에 할당->const를 쓰지 않음)
							
// 							const cardToday = `
// 				                <div class='col-xl-3 col-md-6 portfolio-item'>
// 			                    <div class='card-today'>
// 			                        <div class='label-today'>Today</div>
// 			                        <br>
// 			                        <strong style='font-size: 20px;'>오늘 함께한 기부금</strong>
// 			                        <div class='hr'></div>
// 			                    </div>
// 			                </div>`;
			                
// 							portfolio.append(cardToday); 
	
							let freeBoardList = '';

							
							if(fList.length > 0) {
// 								for(let f in fList) {
								freeBoardList += `
						            <div id="notice">
						                    <table>
						                        <colgroup>
						                            <col width="7%">
						                            <col width="54%">
						                            <col width="15%">
						                            <col width="15%">
						                            <col width="10%">
						                        </colgroup>
						                        <thead>
						                            <tr>
						                                <th>번호</th>
						                                <th>제목</th>
						                                <th>작성자</th>
						                                <th>작성일</th>
						                                <th>조회수</th>
						                            </tr>
						                        </thead>
						                        <tbody>`;
								for(let f of fList) {
									// 각 게시물의 정보를 추출
									console.log(f.fNo);
							        var fNo = f.fNo;
							        var uId = f.uId;
							        var fTitle = f.fTitle;
							        var fCreate = f.fCreate;
							        var fViewCount = f.fViewCount;
							        var fWriter = f.fWriter;
							        
							     // 날짜 문자열에서 월, 일, 연도를 추출
							        var dateParts = fCreate.match(/(\d{1,2})월 (\d{1,2}), (\d{4})/);
							        
							        if (dateParts) {
							        	  var year = dateParts[3];
							        	  var month = dateParts[1].padStart(2, '0');
							        	  var day = dateParts[2].padStart(2, '0');   // 'padStart' 함수 = 월과 일이 1자리 숫자일 경우 앞에 '0' 을 추가하여 2자리 숫자로 만들어 줌
							        	  
							        	  // YYYY.MM.DD 형식으로 조합
							        	  var formattedDate = year + "." + month + "." + day;
							        	  
							        	  // formattedDate를 표시하거나 사용하려는 방식에 맞게 적용
							        	} else {
							        	  // 날짜 문자열을 올바르게 파싱하지 못한 경우에 대한 오류 처리
							        	  console.error("날짜를 파싱하지 못했습니다.");
							        	}
							        
									// 후원 제목 두줄 이상 넘어가면 ... 처리
// 									const truncatedTitle = title.length > 27 ? title.substring(0, 26) + '...' : title;
									freeBoardList +=   "<tr>"
														+"<td colspan='5'>"+"<hr class='line3'>"+"</td>"
														+"</tr>"
														+"<tr>"
														+"<td class='right2'>" + fNo + "</td>"
														+"<td class='right1'>" + "<a href='/board/freeDetail.pet?fNo=" + fNo + "'>" + (fTitle.length > 21 ? fTitle.substring(0, 20) + '...' : fTitle) + "</a>" + "</td>"
														+"<td class='right2'>" + (fWriter.length > 11 ? fWriter.substring(0, 10) + '...' : fWriter) + "</td>"
														+"<td class='right2'>" + formattedDate + "</td>"
														+"<td class='right2'>" + fViewCount + "</td>"
														+"</tr>";									
								}						
						createPagination(totalPages)
							} else {
								alert("게시글이 없습니다.")
							}
						
						portfolio.html(freeBoardList);
						
						},
						error : function() {
					        // 오류 시 실행될 콜백 함수
							alert("Ajax 오류! 관리자에게 문의하세요.");
						}
					});
				}
				
				// 페이지 로드 시 첫 번째 목록 불러오기
				getFreeBoardList();
				
				
				
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
				const changePage = (page) => {
				    const currentPage = page;
					// 새로운 상태를 히스토리에 추가
				    history.pushState({ page: currentPage }, null, "/board/freeList.pet?currentPage=" + currentPage);
				    getFreeBoardList(currentPage);
				}
				
				
				// 뒤로 가기 이벤트 처리
				window.addEventListener("popstate", (event) => {
				    // event.state에는 pushState에서 추가한 상태 정보가 들어 있음
				    if (event.state) {
				        currentPage = event.state.page;
				        // Ajax로 페이지의 내용을 가져와서 화면에 반영
				        getFreeBoardList(currentPage);
				    }
				});
				
				
				// 그룹 변경 시 호출되는 함수
				const changeGroup = (newGroup) => {
				    currentPage = (newGroup - 1) * naviCountPerPage + 1;
				    getFreeBoardList(currentPage);
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
					getFreeBoardList();
				})
				
				// 새로고침 시 특정 URL로 이동
				window.addEventListener('beforeunload', function() {
				  window.location.href = '/board/freeList.pet';
				});
				
				
        </script>
    </body>
    </html>
    
    
    