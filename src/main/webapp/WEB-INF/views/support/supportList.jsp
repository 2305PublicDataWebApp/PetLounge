<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<jsp:include page="../include/importSource.jsp"></jsp:include>
		<link rel="stylesheet" href="/resources/css/support/supportList.css">
		<title>Pet Lounge</title>
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
                <button class="btn-create" onClick="location.href='/support/insert.do'">후원 등록</button>
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
                <div class="card-today">
                    <div class="label-today">Today</div><br>
                    <strong style="font-size: 20px;">오늘 함께한 기부금</strong>
                    <div class="hr"></div>
                    <div class="today-text">
                        900명이 <br>
                        4,234,500원을<br>
                        기부하였습니다.
                    </div>
                </div>  
                <div class="cards" style="border-radius: 20px;">
                    <img src="/resources/images/cat.jpg" class="card-img"
                    	onerror="this.src='https://petrounge.s3.ap-northeast-2.amazonaws.com/noimage.png'">
                    <div class="card-content">
                        <strong class="card-title">도살장에서 구조된 후, 폐종양을 선고받은 드뷔시</strong>
                        <div class="card-group">사단법인 동물행동권 카라</div>
                        <div class="card-bar">
                            <sapn class="card-bar-collection" style="width: 64%;"></sapn>
                        </div>
                        <strong class="card-percent">64%</strong>
                        <strong class="card-money">
                            4,187,300
                            <span class="text">원</span>
                        </strong>
                    </div>
                </div>
                <div class="cards" style="border-radius: 20px;">
                    <img src="/resources/images/cat.jpg" class="card-img"
                    	onerror="this.src='https://petrounge.s3.ap-northeast-2.amazonaws.com/noimage.png'">
                    <div class="card-content">
                        <strong class="card-title">도살장에서 구조된 후, 폐종양을 선고받은 드뷔시</strong>
                        <div class="card-group">사단법인 동물행동권 카라</div>
                        <div class="card-bar">
                            <sapn class="card-bar-collection" style="width: 64%;"></sapn>
                        </div>
                        <strong class="card-percent">64%</strong>
                        <strong class="card-money">
                            4,187,300
                            <span class="text">원</span>
                        </strong>
                    </div>
                </div>
                <div class="cards" style="border-radius: 20px;">
                    <img src="/resources/images/cat.jpg" class="card-img"
                    	onerror="this.src='https://petrounge.s3.ap-northeast-2.amazonaws.com/noimage.png'">
                    <div class="card-content">
                        <strong class="card-title">도살장에서 구조된 후, 폐종양을 선고받은 드뷔시</strong>
                        <div class="card-group">사단법인 동물행동권 카라</div>
                        <div class="card-bar">
                            <sapn class="card-bar-collection" style="width: 64%;"></sapn>
                        </div>
                        <strong class="card-percent">64%</strong>
                        <strong class="card-money">
                            4,187,300
                            <span class="text">원</span>
                        </strong>
                    </div>
                </div>
            </section>
            <section id="page-wrap">
                <p> 1 2 3 4 5 ▶</p>
            </section>
        </main>
		
		<jsp:include page="../include/footer.jsp"></jsp:include>
		<script>
            <!-- 정렬 -->
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