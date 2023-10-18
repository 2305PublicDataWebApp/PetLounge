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
        document.addEventListener("DOMContentLoaded", function () {
            const faqBoard = document.querySelector(".faq-board");
            let openFaqItem = null; // 현재 열린 FAQ 아이템을 저장하는 변수
            const maxFaqItems = 10; // 최대 FAQ 항목 개수

            // FAQ 항목 가져오기 - ajax
            $.ajax({
                url: "/faq/show.pet",
                type: "GET",
                dataType: "json",
                success: function (data) {
                    // FAQ 데이터를 받아온 후, 각 항목을 동적으로 추가
                    data.slice(0, maxFaqItems).forEach(function (item, index) {
                        addFaqItem(item.faqTitle, item.faqContent, data[index].faqNo);
                    });
                },
                error: function (error) {
                    alert("FAQ 조회 실패");
                },
            });

            // "등록하기" 링크를 클릭할 때 FAQ 항목 개수를 체크
            const registerLink = document.getElementById("register-link");
            registerLink.addEventListener("click", function (e) {
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
                titleDiv.addEventListener("click", function () {

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

                        // 삭제하기 버튼 추가
                        addDeleteButton(contentDiv, faqNo);
                        // 수정하기 버튼 추가
                        addEditButton(contentDiv, faqNo);

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
                const deleteButton = contentDiv.querySelector(".delete-button");
                if (deleteButton) {
                    deleteButton.remove();
                }
                const editButton = contentDiv.querySelector(".edit-button");
                if (editButton) {
                    editButton.remove();
                }
            }

            function addDeleteButton(contentDiv, faqNo) {
                if (!contentDiv.querySelector(".delete-button")) {
                    const deleteButton = document.createElement("button");
                    deleteButton.textContent = "삭제하기";
                    deleteButton.classList.add("delete-button");
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
                    const editButton = document.createElement("button");
                    editButton.textContent = "수정하기";
                    editButton.classList.add("edit-button");
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