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
		<link rel="stylesheet" href="/resources/css/support/supportList.css">
		<title>펫 라운지 모금함</title>
	</head>
	<body>
		<jsp:include page="../include/header.jsp"></jsp:include>
		
		<main id="main">
            <section id="title">
                <h1>펫 라운지 모금함</h1>
                <div id="line"></div>
            </section>
            <!-- 카테고리 -->
            <section id="category-wrap">
                <a href="#">
                    <div class="category" style="background-color:#ffd370;">
                        <div><p style="color:white;">전체</p></div>
                    </div>
                </a>
                <a href="#">
                    <div class="category" style="background-color:#F2F2F2;">
                        <div><p style="color:black;">주거</p></div>
                    </div>
                </a>
                <a href="#">
                    <div class="category" style="background-color:#F2F2F2;">
                        <div><p style="color:black;">생계</p></div>
                    </div>
                </a>
                <a href="#">
                    <div class="category" style="background-color:#F2F2F2;">
                        <div><p style="color:black;">건강</p></div>
                    </div>
                </a>
                <a href="#">
                    <div class="category" style="background-color:#F2F2F2;">
                        <div><p style="color:black;">개선</p></div>
                    </div>
                </a>
                <!-- 글쓰기 버튼 (관리자만 보임)-->
                <button class="btn-create" onClick="location.href='/support/insert.pet'">후원 등록</button>
            </section>
            <!-- 정렬 -->
            <div class="sorting-wrap">
                <div class="sorting" style="">
                    <button name="" id="sorting-label" class="sorting-label">최신순</button>
                    <ul class="optionList">
                        <li class="optionItem">최신순</li>
                        <li class="optionItem">모금액 많은 순</li>
                        <li class="optionItem">모금액 적은 순</li>
                        <li class="optionItem">모금률 높은 순</li>
                        <li class="optionItem">종료임박 순</li>
                    </ul>
                </div>
            </div>
            <!-- 후원 목록 -->
            <section id="content">
            
            	<div class="container" data-aos="fade-up">
	                <div class="row gy-4 portfolio-container" id="portfolio">
	                
						<!-- 이자리에 게시글 들어와야 함  -->
						
	                </div>
                </div>
                
            </section>
            <section id="page-wrap">
				<div class="mt-5 d-flex justify-content-center">
					<nav aria-label="Page navigation exampler">
					    <ul id="pagination" class="pagination"></ul>
					</nav>
                </div>
            </section>
        </main>

		<jsp:include page="../include/footer.jsp"></jsp:include>
		<script>
			<!-- 페이징 처리된 게시글 조회 -->
			// 후원글 페이징 
			let currentPage = 1; // 현재 페이지 
			let recordCountPerPage = 11; // 페이지당 후원글 수 
			let naviCountPerPage = 5; // 한 그룹당 페이지 수
			let totalPages = 0; // 총 페이지 수
			
			// 후원글 리스트를 불러오는 ajax Function 
			const getSupportList = (page) => {
				$.ajax({
					url : "/support/sList.pet",
					data : { page: page, currentPage: currentPage, recordCountPerPage: recordCountPerPage }, // 현재 페이지와 페이지당 후원글 수 전달
					type : "GET",
					success : function(resultMap) {
						const portfolio = $("#portfolio");
						portfolio.html('');
						const cardToday = $("<div class='col-xl-3 col-md-6 portfolio-item'>")
											.html("<div class='card-today'><div class='label-today'>Today</div><br>"
											+"<strong style='font-size: 20px;'>오늘 함께한 기부금</strong>"
											+"<div class='hr'></div>"
											+"<div class='today-text'>900명이 <br>4,234,500원을<br>기부하였습니다.</div></div>");;
						portfolio.append(cardToday); 

						let supportList;
						
						const sList = resultMap.sList; // 후원글 리스트 
				        totalPages = resultMap.totalPages; // 총 페이지 수
						
						if(sList.length > 0) {
							for(let i in sList) {
								const percent = Math.floor((sList[i].sFundAmount / sList[i].sTargetAmount) * 100);
								// 후원 제목 두줄 이상 넘어가면 ... 처리
								const title = sList[i].sTitle;
								const truncatedTitle = title.length > 27 ? title.substring(0, 26) + '...' : title;
								const sFundAmount = sList[i].sFundAmount.toLocaleString();
								supportList = $("<div class='col-xl-3 col-md-6 portfolio-item'>")
												.html("<div class='cards' style='border-radius: 20px;''>"
												+"<div><a href=''/support/detail.pet?sNo="+sList[i].sNo+"' class='a-detail'>"
												+"<img src='/resources/images/cat.jpg' class='card-img'"
												+"onerror='this.src='https://petrounge.s3.ap-northeast-2.amazonaws.com/noimage.png''></a></div>"
												+"<div class='card-content'><strong class='card-title'><a href='/support/detail.pet?sNo="+sList[i].sNo+"' class='a-detail s-title' title='More Details'>"
												+""+truncatedTitle+"</a></strong><div class='card-group'>"+sList[i].sGroup+"</div><div class='card-bar'>"
												+"<span class='card-bar-collection' id='graph-num' style='width: "+percent+"%;'></span></div><div>"
												+"<strong class='card-percent' id='per-num'>"+percent+"%</strong>"
												+"<strong class='card-money'><span class='text'>"+sFundAmount+"원</span></strong></div></div></div>");
								
								portfolio.append(supportList);
								
								// 결과를 받은 후에 페이징을 업데이트
					            createPagination(resultMap.totalPages);
							}
						} else {
							alert("게시글이 없습니다.")
						}
					},
					error : function() {
						alert("Ajax 오류! 관리자에게 문의하세요.");
					}
				});
			}
			
			// 초기 상태를 히스토리에 추가
			history.pushState({ page: 1 }, null, "/support/list.pet?page=1");
			
			
			
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
				// 새로운 상태를 히스토리에 추가	
			    history.pushState({ page: newPage }, null, "/support/list.pet?page=" + newPage);
			 	// Ajax로 페이지의 내용을 가져와서 화면에 반영
			    getSupportList(currentPage);
			}
			
			// 뒤로 가기 이벤트 처리
			window.addEventListener("popstate", (event) => {
			    // event.state에는 pushState에서 추가한 상태 정보가 들어 있음
			    if (event.state) {
			        currentPage = event.state.page;
			        // Ajax로 페이지의 내용을 가져와서 화면에 반영
			        getSupportList(currentPage);
			    }
			});
			
			// 그룹 변경 시 호출되는 함수
			const changeGroup = (newGroup) => {
			    currentPage = (newGroup - 1) * naviCountPerPage + 1;
			    getSupportList(currentPage);
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
				getSupportList();
			})
            <!-- 정렬바 -->
            const label = document.querySelector('.sorting-label');
            const options = document.querySelectorAll('.optionItem');

            // 클릭한 옵션의 텍스트를 라벨 안에 넣음
            const handleSelect = (item) => {
            label.parentNode.classList.remove('active');
            label.innerHTML = item.textContent;
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