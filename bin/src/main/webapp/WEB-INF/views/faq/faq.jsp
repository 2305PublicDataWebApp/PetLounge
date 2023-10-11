<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FAQ</title>
        <link rel="stylesheet" href="/resources/css/faq/faq.css">
        <link rel="stylesheet" href="/resources/css/reset.css">
        <link rel="stylesheet" href="/resources/css/font.css">
    </head>
    <body>
        <header>

        </header>

        <main class="main">
            <div class="contanier">
                <!-- 타이틀 -->
                <div class="main-title">
                    <h1>FAQ</h1>
                </div>

                <div id="line"></div>

                <!-- FAQ 게시판 -->
                <form action="">
                    <div class="faq-board">
                        <!-- FAQ 항목이 동적으로 추가됩니다. -->
                    </div>
                    <div class="faq-register">
                        <a href="#">등록하기</a>
                    </div>
                </form>


            </div>
        </main>

        <footer>

        </footer>

        <!-- js -->
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const faqBoard = document.querySelector(".faq-board");
                let openFaqItem = null; // 현재 열린 FAQ 아이템을 저장하는 변수

                // FAQ 항목을 추가하는 함수
                function addFaqItem(question, answer) {
                    const faqItem = document.createElement("div");
                    faqItem.classList.add("faq-item");

                    const titleDiv = document.createElement("div");
                    titleDiv.classList.add("faq-title");

                    const title = document.createElement("h3");
                    title.textContent = question;

                    // + 아이콘 추가
                    const iconPlus = document.createElement("span");
                    iconPlus.textContent = "+";
                    iconPlus.classList.add("icon");
                    iconPlus.classList.add("plus");

                    // 내용을 토글하는 이벤트 리스너 추가
                    titleDiv.addEventListener("click", function () {
                        const contentDiv = faqItem.querySelector(".faq-content");
                        const icon = titleDiv.querySelector(".icon");

                        if (faqItem !== openFaqItem) {
                            // 다른 FAQ를 클릭했을 때만 기존 FAQ를 닫습니다.
                            if (openFaqItem) {
                                const openContentDiv = openFaqItem.querySelector(".faq-content");
                                const openIcon = openFaqItem.querySelector(".icon");
                                openFaqItem.classList.remove("open");
                            }

                            // 현재 FAQ를 엽니다.
                            faqItem.classList.add("open");
                            openFaqItem = faqItem;
                        } else {
                            // 현재 FAQ가 이미 열려있는 경우, 닫습니다.
                            faqItem.classList.remove("open");
                            openFaqItem = null;
                        }
                    });

                    titleDiv.appendChild(title);
                    titleDiv.appendChild(iconPlus);

                    const contentDiv = document.createElement("div");
                    contentDiv.classList.add("faq-content");

                    const content = document.createElement("p");
                    content.textContent = answer;

                    contentDiv.appendChild(content);

                    faqItem.appendChild(titleDiv);
                    faqItem.appendChild(contentDiv);

                    faqBoard.appendChild(faqItem);
                }

                // 예시 FAQ 항목을 추가합니다.
                addFaqItem("질문 1", "답변 1답변 1답변 1답변 1답변 1답변 1답변 1답변 1답변 1답변 1답변 1답변 1답변 1답변 1답변 1답변 1답변 1답변 1답변 1답변 1답변 1답변 1답변 1답변 1답변 1답변 1답변 1답변 1답변 1답변 1답변 1답변 1답변 1");
                addFaqItem("질문 2", "답변 2");
                addFaqItem("질문 3", "답변 3");
                addFaqItem("질문 4", "답변 4");
                addFaqItem("질문 5", "답변 5");
                addFaqItem("질문 6", "답변 6");
                addFaqItem("질문 7", "답변 7");
                addFaqItem("질문 8", "답변 8");
                addFaqItem("질문 9", "답변 9");
                addFaqItem("질문 10", "답변 10");
            });
        </script>
    </body>
</html>