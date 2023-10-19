<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <jsp:include page="../include/importSource.jsp"></jsp:include>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <link rel="stylesheet" href="/resources/css/faq/list.css">
        <link rel="stylesheet" href="/resources/css/reset.css">
        <link rel="stylesheet" href="/resources/css/font.css">
        <title>FAQ</title>
        <style>
        	.edit-icon {
			    position: relative;
			    top: 5px;
			    left: 685px;
			    cursor: pointer;
			}
			
        	.delete-icon {
			    position: relative;
			    top: 5px;
			    left: 740px;
			    font-size: 27px;
			    cursor: pointer;
			}
			
			.material-symbols-outlined {
			  font-variation-settings:
			  'FILL' 0,
			  'wght' 400,
			  'GRAD' 0,
			  'opsz' 24
			}
        </style>
    </head>
    <body>
    	<!-- header -->
        <jsp:include page="../include/header.jsp"></jsp:include> 

        <main class="main">
            <div class="contanier">
                <!-- 타이틀 -->
                <div class="main-title">
                    <h1>FAQ</h1>
                </div>

                <div id="line"></div>

                <!-- FAQ 목록 -->
				<div class="faq-board">
				    <!-- FAQ 항목이 동적으로 추가 됨 -->
				</div>
				
				<!-- 아이디가 admin일 경우에만 등록버튼 보이게 함. -->
				<c:if test="${ sessionScope.uId eq 'admin' }">
				 <div class="faq-register">
				     <a href="/faq/insert.pet" id="register-link">등록하기</a>
				 </div>
				</c:if>

            </div>
        </main>

		<!-- footer -->
        <jsp:include page="../include/footer.jsp"></jsp:include>

        <script>
        
     	// 웹페이지 로그되면 실행되는 이벤트
        document.addEventListener("DOMContentLoaded", function () { 
        	
            const faqBoard = document.querySelector(".faq-board");	// 클래스가 "faq-board"인 첫 번째 요소를 선택
            let openFaqItem = null; 								// 현재 열린 FAQ 아이템을 저장하는 변수
            const maxFaqItems = 10; 								// 최대 FAQ 항목 개수를 정의하는 상수

            // FAQ 항목 조회 - ajax
            $.ajax({
                url: "/faq/show.pet",	// 요청이 보내질 URL 주소
                type: "GET",			// HTTP 요청 메서드
                dataType: "json",		// 서버에서 반환되는 데이터의 형식
                success: function (data) {
                	// 최대 FAQ 항목 개수(maxFaqItems)까지 반복하며 각 FAQ 항목 추가
					data.slice(0, maxFaqItems).forEach(function (item, index) {
					// 함수에 전달되는 매개변수
					addFaqItem(item.faqTitle, item.faqContent, data[index].faqNo); 
                    });
                },
                error: function (error) {
                    alert("FAQ 조회 실패");
                },
            });

            
            // "등록하기" 링크를 클릭할 때 FAQ 항목 개수를 체크
            const registerLink = document.getElementById("register-link");
            registerLink.addEventListener("click", function (e) { // 이벤트 리스너 추가
                if (faqBoard.children.length >= maxFaqItems) {
                    e.preventDefault(); // 링크의 기본 동작(페이지 이동)을 중지
                    alert("등록 가능한 FAQ 항목은 최대 10개입니다.");
                }
            });

            
            // FAQ 항목을 추가하는 함수
            function addFaqItem(question, answer, faqNo) {

                const faqItem = document.createElement("div");
                faqItem.classList.add("faq-item");

                const titleDiv = document.createElement("div");
                titleDiv.classList.add("faqTitle");

                const title = document.createElement("h3");
                title.textContent = question;

                // + 아이콘 추가
                const iconPlus = document.createElement("span");
                iconPlus.textContent = "+";
                iconPlus.classList.add("icon");
                iconPlus.classList.add("plus");

                // 내용을 토글하는 이벤트 리스너 추가
                faqItem.addEventListener("click", function () {

                    const contentDiv = faqItem.querySelector(".faqContent");

                    const icon = titleDiv.querySelector(".icon");

                    // 다른 FAQ를 클릭했을 때만 기존 FAQ 닫기
                    if (faqItem !== openFaqItem) {
                        if (openFaqItem) {
                            closeFaqItem(openFaqItem);
                        }

                        // 현재 FAQ를 열기
                        openFaqItem = faqItem;
                        openFaqItem.classList.add("open");

                        // 삭제하기, 수정하기 버튼 추가
                        if('${sessionScope.uId}' === 'admin') {
	                        addDeleteButton(contentDiv, faqNo);
	                        addEditButton(contentDiv, faqNo);

                        }

                    } else {
                        // 현재 FAQ가 이미 열려있는 경우, 토글 닫기
                        closeFaqItem(faqItem);
                        openFaqItem = null;
                    }
                });

                titleDiv.appendChild(title);
                titleDiv.appendChild(iconPlus);

                const contentDiv = document.createElement("div");
                contentDiv.classList.add("faqContent");

                const content = document.createElement("p");
                content.innerHTML = answer;

                contentDiv.appendChild(content);

                faqItem.appendChild(titleDiv);
                faqItem.appendChild(contentDiv);

                faqBoard.appendChild(faqItem);
            }

            function closeFaqItem(faqItem) {
                faqItem.classList.remove("open");
                const contentDiv = faqItem.querySelector(".faqContent");
                const deleteButton = contentDiv.querySelector(".delete-icon");
                if (deleteButton) {
                    deleteButton.remove();
                }
                const editButton = contentDiv.querySelector(".edit-icon");
                if (editButton) {
                    editButton.remove();
                }
            }

            function addDeleteButton(contentDiv, faqNo) {
                if (!contentDiv.querySelector(".delete-button")) {
					var deleteButton =document.createElement('span');
					deleteButton.className = 'material-symbols-outlined delete-icon';
					deleteButton.style.color = '#FF7070';
					deleteButton.textContent = 'delete_forever';
					contentDiv.appendChild(deleteButton);
                    

                    deleteButton.addEventListener("click", function() {
                        const faqItem = this.closest(".faq-item");
                        const confirmDelete = window.confirm("이 FAQ 항목을 삭제하시겠습니까?");
                        if (confirmDelete) {
                            $.ajax({
                                url: "/faq/delete.pet",
                                type: "POST",
                                data: {faqNo: faqNo},
                                success: function(result) {
                                    faqItem.remove();
                                },
                                error: function() {
                                    alert("FAQ 삭제에 실패했습니다.");
                                }
                            });
                        }
                    });
                }
            }

            function addEditButton(contentDiv, faqNo) {
                if (!contentDiv.querySelector(".edit-button")) {
					var editButton = document.createElement('span');
					editButton.className = 'material-symbols-outlined edit-icon';
// 					editButton.style.color = '#FF7070';
					editButton.textContent = 'edit_square';
					contentDiv.appendChild(editButton);
					
                    editButton.addEventListener("click", function() {
                        const faqNum = faqNo;
                        location.href = "/faq/modify.pet?FaqNo=" + faqNum;
                    });
                }
            }
        });
        </script>
    </body>
</html>