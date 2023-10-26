# Pet Lounge
동물의 숲 - 파이널 프로젝트
<br>
![PetLounge_Logo](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/78d79668-a454-472f-b8e5-6c66994b9edb)

## 🐾 프로젝트 소개
펫 라운지(Pet Lounge)는 반려동물을 사랑하는 모두에게 유용한 정보와 커뮤니티를 제공하여, <br>
반려동물과의 특별한 순간을 더욱 즐겁게 만들어줍니다.
<br><br>

## 🐶 기획의도
✔ 반려동물에 대한 관심 상승과 함께 유기동물의 수도 증가하는 추세 <br>
✔ 커뮤니티 기능과 동시에 동물 병원과 날씨 안내, 후원을 함께 할 수 있는 통합 사이트 기획
<br><br>

## 📅 개발기간
2023년 9월 26일 ~ 2023년 10월 25일
<br><br>

## 🧑‍🤝‍🧑 멤버구성 및 담당 기능
![동물의숲_역할분담](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/9ecf6122-9287-4282-b2f1-c08a75cacf1b)
❤ **박예지** https://github.com/Ennakoida <br>
💛 **박선우** https://github.com/PSW8246082 <br>
💚 **이지연** https://github.com/Powerbobo <br>
💙 **이지환** https://github.com/hitom22 <br>
💜 **장진경** https://github.com/jangjingyeong
<br><br>

## 🛠️ 개발환경
<img src="https://img.shields.io/badge/Apache%20Tomcat-F8DC75?style=flat&logo=Apache%20Tomcat&logoColor=white"> <img src="https://img.shields.io/badge/Apache%20Maven-C71A36?style=flat&logo=Apache%20Maven&logoColor=white"> 
<img src="https://img.shields.io/badge/Mybatis-000000?style=flat&logo=Mybatis&logoColor=white"> <img src="https://img.shields.io/badge/GitHub-181717?style=flat&logo=GitHub&logoColor=white">
<br>
<img src="https://img.shields.io/badge/spring-6DB33F?style=flat&logo=Spring&logoColor=white"> <img src="https://img.shields.io/badge/HTML5-E34F26?style=flat&logo=HTML5&logoColor=white">
<img src="https://img.shields.io/badge/CSS3-1572B6?style=flat&logo=CSS3&logoColor=white"> <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=flat&logo=JavaScript&logoColor=white">
<img src="https://img.shields.io/badge/jQuery-0769AD?style=flat&logo=jQuery&logoColor=white"> <img src="https://img.shields.io/badge/JAVA-4682B4?style=flat&logo=JAVA&logoColor=white">
<img src="https://img.shields.io/badge/Oracle-F80000?style=flat&logo=Oracle&logoColor=white"> <img src="https://img.shields.io/badge/Ajax-D3D3D3?style=flat&logo=Ajax&logoColor=white">
<img src="https://img.shields.io/badge/JSON-000000?style=flat&logo=JSON&logoColor=white"> <img src="https://img.shields.io/badge/Bootstrap-7952B3?style=flat&logo=Bootstrap&logoColor=white">
<br><br>

## 🐱 주요기능

### 동물 병원 안내
기능명 | 상세
--|--
동물 병원 조회 | 비회원은 기본으로 설정된 주소를 기준으로, 회원은 회원가입 시 등록했던 자신의 주소를 기준으로 주변의 동물병원 목록을 조회할 수 있으며, 이후, 좌표의 이동이 가능하다. <br> 병원의 위치와 목록은 현재 지도에 표시되고 있는 주소를 기준으로 5개가 출력되어 지도 위에 마커로 표시되며, 마커 클릭 시 뜨는 인포윈도우에는 병원의 이름과 전화번호 정보, 상세보기 링크를 포함한다.
동물 병원 검색 | 비회원과 회원은 메인페이지와 주소 또는 동물 병원의 이름을 직접 검색하여 위치와 정보를 조회할 수 있다. 검색된 결과가 없을 경우, 검색 결과 없음 화면이 대신 출력된다.
기본 주소 및 현위치 기준 조회 | 비회원과 회원은 '기본 주소로 이동' 또는 '현위치로 이동' 버튼을 클릭하여 자신의 기본 주소를 중심 좌표로 설정하여 주변 동물병원을 조회할 수 있다.
즐겨찾기 기능 | 회원은 자신이 선호하는 동물 병원을 즐겨 찾는 병원으로 등록하거나, 해제할 수 있다.
길찾기 및 로드뷰 보기 기능 | 비회원과 회원은 카카오 맵을 이용하여 자신이 선택한 동물 병원에 가는 길과 방법, 로드뷰를 볼 수 있다.

### 동물 병원 안내 - 후기
기능명 | 상세
--|--
후기 조회 | 비회원과 회원은 작성된 모든 후기를 조회할 수 있다. 후기가 없을 경우, 등록된 후기 없음 화면이 대신 출력된다.
후기 검색 | 비회원과 회원은 해당 동물 병원에 대한 후기를 검색할 수 있다. 검색된 결과가 없을 경우, 등록된 후기 없음 화면이 대신 출력된다.
후기 작성, 수정, 삭제 | 회원은 동물 병원에 대한 후기를 작성, 수정, 삭제할 수 있다.

### 산책 날씨 예보
기능명 | 상세
--|--
날씨 정보 조회 | 현 시간 기준의 기온, 강수량과 최저/최고 기온과 시간/강수량에 따른 아이콘을 조회한다.<br>기준시간(01:00, 07:00, 13:00, 19:00)으로부터 6시간씩 기온과 시간/강수량에 따른 아이콘을 조회한다.<br>당일로부터 3일간의 강수량과 최저/최고 기온을 조회한다.
날씨 지역 선택 | 회원은 회원가입 시 기재한 주소 기준으로 지역이 조회되며, 이후 다른 지역을 선택할 수 있다.<br>비회원은 서울이 기본값으로 조회되며, 이후 다른 지역을 선택할 수 있다.

### 산책 날씨 예보 - TMI 리스트
기능명 | 상세
--|--
TMI 리스트 | 반려동물에 대한 TMI가 5초 간격으로 랜덤으로 변경되며 표시된다.<br>관리자는 TMI 항목을 등록, 삭제할 수 있다.
       
### 펫 라운지 모금함
기능명 | 상세
--|--
펫 라운지 모금함 게시판 | 회원/비회원은 현재 모금중인 후원글을 조회할 수 있으며, 카테고리별(주거, 생계, 건강, 개선)로<br>확인할 수도 있고 원하는 대로 정렬(최신순, 모금액 많은 순, 모금액 적은 순, 모금률 높은 순, 종료임박순)을 선택하여 볼 수 있다.<br>관리자는 후원글을 등록, 수정, 삭제할 수 있으며, 회원이 등록한 댓글을 수정, 삭제할 수 있다.
후원 결제 | 회원은 현재 모금 중인 글에 후원을 할 수 있다. 결제 금액과 결제 수단(카카오페이, 신용카드), <br>상세페이지 후원 내역에 익명이나 닉네임(아이디)를 공개할지 선택할 수 있다. <br>후원한 회원은 자신이 후원한 후원글에 댓글을 남길 수 있고, 댓글을 수정, 삭제도 가능하다.
후원 내역 email | 회원은 후원 결제 후에 회원 정보에 등록된 이메일로 후원 내역을 받아볼 수 있다.

### 공지사항
기능명 | 상세
--|--
공지사항 조회 | 비회원과 회원 모두 공지사항 게시글을 조회, 검색만 가능하다.
공지사항 관리 | 관리자만이 공지사항을 등록, 수정, 삭제할 수 있다.

### FAQ
기능명 | 상세
--|--
FAQ 게시판 | 회원과 비회원은 FAQ 목록 페이지에서 조회가 가능하며, 제목을 클릭하면 토글이 열리며 내용을 확인할 수 있다.<br>관리자는 FAQ 항목을 등록, 수정, 삭제를 할 수 있으며, FAQ는 총 10개까지만 등록된다.

### 자유게시판
기능명 | 상세
--|--
자유게시판 조회 | 비회원과 회원 모두 자유게시판 게시글을 볼 수 있다.
자유게시판 사용 | 회원은 자유게시판에서 글을 검색 및 등록, 수정, 삭제, 북마크할 수 있으며, 관리자도 검색 및 등록, 수정, 삭제 가능하다.
자유게시판 댓글 | 회원은 자유게시판에 게시된 글에 댓글을 작성, 수정, 삭제할 수 있다.

### 회원관리
기능명 | 상세
--|--
회원가입 | 회원은 아이디, 비밀번호, 비밀번호 확인, 이름, 닉네임, 이메일, 휴대폰, 주소, 프로필 사진을 입력해 중복확인 및 이메일 인증이 확인되면 회원가입을 할 수 있다.
로그인 | 회원은 아이디와 비밀번호를 입력해 로그인 할 수 있다.
아이디 / 비밀번호 찾기 | 회원은 이름과 이메일 인증을 통해 아이디 찾기 및 비밀번호 찾기를 할 수 있다.
회원 정보관리 | 회원은 가입 당시 입력한 아이디, 비밀번호, 이름, 닉네임, 이메일, 휴대폰, 주소 프로필 사진 정보를 조회할 수 있고 수정 및 탈퇴할 수 있다.
게시글 관리 | 회원은 마이페이지에서 자유게시판 작성글, 댓글 및 북마크 한 게시글, 후원 목록과 후원게시판 댓글, 북마크 병원 목록 및 나의 병원리뷰 작성글을 조회 및 검색할 수 있다

### 관리자 페이지
기능명 | 상세
--|--
통계 관리 | 관리자는 일일 후원금액 통계, 후원 순위, 병원순위(리뷰), 병원순위(북마크)에 대한 정보를 조회할 수 있다.
회원 관리 | 관리자는 전체 회원의 아이디, 이름, 닉네임, 휴대폰의 정보를 목록을 조회/확인할 수 있다.
후원 관리 | 관리자는 전체 후원글, 전체 후원 내역, 전체 후원 댓글에 대한 정보를 조회할 수 있다.<br>후원글은 전체 후원글을 기본으로 모금중인 후원글과 종료된 후원글을 나누어 조회할 수 있다.
<br>

## 💻 실행화면
### 1. 메인화면
![메인화면](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/f158d115-6b35-436a-a466-7f7f4344c1de)
![동물병원안내](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/4fff48be-adf8-4d05-8132-a311ee159741)
![산책날씨예보](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/7913e3c7-980b-407b-b020-711f2b58eae5)
![펫라운지모금함](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/07e2ed2b-5173-4571-a019-baf12c31c83d)
![메인화면 메뉴](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/ddf432c6-7d21-4c95-83b6-63ce49d7c84e)
<br><br>

### 2. 동물 병원 안내
![동물병원안내](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/de0b7eaf-9ef5-4252-9e9d-c44d72e927fa)
![동물병원검색](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/16f4106c-0ee1-4312-9eef-89e31f818c69) 
<br>
**로그인 시 (즐겨찾기)**
![동물병원안내-로그인시](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/5da26725-f339-40ac-9e01-b683010a52c1)
<br>
**길찾기**
![동물병원안내-길찾기](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/e1206e18-0b9f-4139-8596-002ffcc9b140)
<br><br>

### 2-1. 동물 병원 안내 - 상세 조회
![동물병원안내-상세조회](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/cca9fec5-b09b-4591-b7cb-93b03ba7a784)
![동물병원안내-후기수정](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/38e07f61-ef41-4cf4-8a77-22377125a443)
<br>
**로드뷰**
![동물병원안내-로드뷰](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/21ea4f69-bdbd-4326-8ff8-e2e87438eb0b)

### 3. 산책 날씨 예보
![01  날씨페이지](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/5c2a1981-a01e-45c4-adbb-85e51ada0ae9)
![02  TMI리스트](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/e181402f-36d2-411f-b653-ad31f60b8fe5)

### 4. 펫 라운지 모금함
![목록 건강 모금률 높은 순](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/81462cf4-a0a5-489c-b714-489b767b3673)
![후원 등록](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/22cd0834-9457-4b6a-9048-0f23019f6bf3)
![후원 수정](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/a8d5ec14-12c7-4924-bf1b-527d75b3b9ad)

### 4-1. 펫 라운지 모금함 - 상세 페이지
![상세페이지 댓글](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/b8ca618c-cc17-4525-b238-2c71545061c4)
![상세페이지 후원내역](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/b190c89d-1d08-4d76-b91e-548956f34e7d)
**후원 결제**
![결제 페이지](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/84753b5d-7eb3-40c8-8197-043fa67472ff)
![결제창 카카오페이](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/63ccac38-9a2e-452b-baad-015bd5999221)
![결제창 신용카드](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/78c5ce2d-9c0f-452e-9cf5-cba964507888)
![결제 완료](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/e955fa98-595e-48bb-a5ef-f0154537daf9)
![후원내역 메일](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/ea6befe7-6c82-405f-a6ed-48f7e546985e)

### 5. 공지사항
![공지사항_목록 조회](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/4a302584-853f-45d6-bf10-61377a0005b8)
![공지사항_게시글 검색](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/081a3960-f8ec-4843-9ca6-e4d1c0f11846)
![공지사항_게시글 등록](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/119ff510-72d7-4d60-b76f-4506b49fa81f)
![공지사항_게시글 수정](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/d9c89960-1274-43b6-a741-613d28151fa3)
![공지사항_게시글 삭제](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/59d62098-3ea3-43b2-9bfb-fe90e90679c0)
![공지사항_게시글 상세조회](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/25c0b828-b7f4-4d08-a629-334ffb73b75c)

### 6. FAQ
![03  FAQ 목록 조회](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/d58f97a1-a739-4ed7-838c-4c33f8a9b9f7)
**관리자**
![04  FAQ 목록 조회 - 관리자](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/eee2db24-21b0-47aa-beee-b12076b5a9e0)
![05  FAQ 등록 - 관리자](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/7e81b65d-d489-4c5b-9a93-2b885ca70098)
![06  FAQ 수정 - 관리자](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/fb51239b-792c-4624-8697-816801c2a95a)

### 7. 자유게시판
![자유게시판_목록조회](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/8e64a044-53c7-49da-bde1-2d6d9a5b3d7e)
![자유게시판_게시글 등록](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/ff3f0ff5-4032-4c1b-9024-709a430518f7)
![자유게시판_게시글 수정](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/a8bbbf37-bb83-4023-94ac-1cf778ba1fe9)
![자유게시판_게시글 삭제](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/0484fab6-c5f0-4682-aaf4-2269b3d04780)
![자유게시판_게시글 상세조회](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/48c4be87-c6d8-4294-8817-573c175c721f)
**게시글 북마크**
![자유게시판_게시글 북마크](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/1b75fd43-c637-49c9-85a8-9e03575cdc95)
**댓글**
![자유게시판_댓글 목록조회](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/e166632c-492d-4889-aafd-3aeb89643e36)
![자유게시판_댓글 검색](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/9afd4534-d655-4332-941a-13db0577b076)
![자유게시판_댓글 수정](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/eb6cc213-566f-4ff6-9aba-304caaac233d)

### 8. 로그인
![login pet](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/2b20ee8f-da23-459a-835b-17212459a9e0)

### 9. 회원가입
![register pet (1)](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/a254f8a7-4552-460f-b3a7-eef8c95e21ad)
![register pet (2)](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/5898f43c-e55e-410f-b378-600d36029692)
![register pet (3)](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/ac2e409c-dbed-4baf-9b74-9e8ca5c7a63c)
![register pet (4)](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/86dbb4fc-65d7-4e70-9a76-99e3f3e0d4f4)
![이메일인증](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/c5cff21b-324d-415a-90d3-892a4ece6897)
![register pet (5)](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/9bb7474e-c364-40fd-a1e4-461b0565d323)

### 10. 아이디 / 비밀번호 찾기
**아이디 찾기**
![idpwFind pet](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/5185f819-691e-4f0c-9cad-e32c4dd54c0e)
**비밀번호 찾기**
![idpwFind pet (1)](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/396b2f8c-e391-4a42-85d3-b02c146d40a1)
![checkPw pet](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/2a17255f-3d09-4caf-8025-5701419eadc8)
![findPw pet](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/9e24a5f8-5451-4dab-a148-af35ad4c5eba)

### 11. 마이페이지
![userInfo pet](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/6997b1f7-5304-47f0-999a-adb6f1b124a2)
![update pet](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/662c31c3-c39a-4e05-9208-9793d6f66a21)
![delete pet](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/f0bcb9fc-7223-4675-939d-15b634bc892f)
**게시글관리**
![uBoard pet](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/fdf66ec9-f52c-437c-a5ad-6b9997e2bdc8)
![uBoardMark pet](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/2a8a7938-18c7-4029-88e6-6b5e0fcc5e84)
**후원관리**
![uSupport pet](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/7608955e-5b99-4075-b1f7-018d5b53d75e)
![uSupportReply pet](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/73a0f907-9aa9-4b6e-978d-f2d3009d91b3)
**병원관리**
![uHospital pet](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/330bea24-240f-46dc-b105-14864ff47f39)
![uHosReview pet](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/0722a3bb-4066-4104-b004-415ed1cba33b)

### 12. 관리자 페이지
![관리자페이지_통계관리](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/fd346a5b-c227-499c-85a1-60e712ddb5c8)
![관리자페이지_회원관리](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/73d35ebb-88a0-455a-b582-f654c04cd6e5)
![관리자페이지 후원관리](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/65f3a7ae-5726-4cfc-8f85-cd1f34b85eb7)
![관리자페이지 후원관리 2](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/238dc6f2-34d8-4251-978e-8a8131a58c81)

### 13. 에러 페이지
![펫라운지-에러페이지](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/f81c103f-e9cb-4899-9413-8213fd70b190)
