# Pet Lounge
동물의 숲 - 파이널 프로젝트
<br>
![Pet_Lounge](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/54f5c424-9e7b-455a-a42b-1edbd786a547)

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
![동물의숲_역할분담](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/06152fce-8b26-4ed1-b833-3dd477dcb2f5)
<br>
❤ **박예지** https://github.com/Ennakoida <br>
💛 **박선우** https://github.com/PSW8246082 <br>
💚 **이지연** https://github.com/Powerbobo <br>
💙 **이지환** https://github.com/hitom22 <br>
💜 **장진경** https://github.com/jangjingyeong
<br><br>

## 🛠️ 개발환경
:heavy_check_mark: **FRONT :** 
<img src="https://img.shields.io/badge/HTML5-E34F26?style=flat-square&logo=HTML5&logoColor=white"/></a>
<img src="https://img.shields.io/badge/CSS3-1572B6?style=flat-square&logo=CSS3&logoColor=white"/></a>
<img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=flat-square&logo=JavaScript&logoColor=white"/></a>
<img src="https://img.shields.io/badge/bootstrap-7952B3?style=flat-square&logo=bootstrap&logoColor=white"/></a>

:heavy_check_mark: **BACK :** 
<img src="https://img.shields.io/badge/Apache%20Tomcat-F8DC75?style=flat&logo=Apache%20Tomcat&logoColor=white"/></a>
<img src="https://img.shields.io/badge/Oracle-F80000?style=flat&logo=Oracle&logoColor=white"></a>
<img src="https://img.shields.io/badge/apachemaven-C71A36?style=flat-square&logo=apachemaven&logoColor=white"/></a>
<img src="https://img.shields.io/badge/Ajax-D3D3D3?style=flat&logo=Ajax&logoColor=white"/></a>
<img src="https://img.shields.io/badge/JAVA-4682B4?style=flat&logo=JAVA&logoColor=white"/></a>
<img src="https://img.shields.io/badge/Mybatis-000000?style=flat&logo=Mybatis&logoColor=white"/></a>
<img src="https://img.shields.io/badge/JSP-000000?style=flat&logo=JSP&logoColor=white"/></a>
<img src="https://img.shields.io/badge/jquery-0769AD?style=flat&logo=jquery&logoColor=white"/></a>

:heavy_check_mark: **TOOLS :** 
<img src="https://img.shields.io/badge/eclipseide-2C2255?style=flat-square&logo=eclipseidep&logoColor=white"/></a>
<img src="https://img.shields.io/badge/spring-6DB33F?style=flat-square&logo=spring&logoColor=white"/></a>
<img src="https://img.shields.io/badge/visualstudiocode-007ACC?style=flat-square&logo=visualstudiocode&logoColor=white"/></a>
<img src="https://img.shields.io/badge/GitHub-181717?style=flat&logo=GitHub&logoColor=white" /><a>
<img src="https://img.shields.io/badge/intellijidea-000000?style=flat-square&logo=intellijidea&logoColor=white"/></a>

:heavy_check_mark: **ETC :** 
<img src="https://img.shields.io/badge/notion-007ACC?style=flat-square&logo=notione&logoColor=white"/></a>
<img src="https://img.shields.io/badge/slack-4A154B?style=flat-square&logo=slacke&logoColor=white"/></a>
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
![메인화면](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/8a2c58e0-561e-4fba-9863-cbfc35e9b7aa)
![동물병원안내](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/d2e30749-4dbf-4f1b-9fa1-afad5757afbd)
![산책날씨예보](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/006adee9-4ba5-4c58-aca8-bdc3987897bb)
![펫라운지모금함](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/69a64d76-7b2d-4b56-bc3a-0d5bbae43f07)
![메인화면 메뉴](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/b4c7d497-c105-4b22-be0f-a4a403f8b4b2)
<br><br>

### 2. 동물 병원 안내
![동물병원안내](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/81edb17e-e6ac-47e0-b30a-f20b8975b6cc)
![동물병원검색](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/9577b73a-4f32-4cc7-a63b-f257fbdebef1)
<br>
**로그인 시 (즐겨찾기)**
![동물병원안내-로그인시](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/82ed135a-cfaf-4b45-a600-5da0ec63d10a)
<br>
**길찾기**
![동물병원안내-길찾기](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/d976c76f-705a-4208-9ae8-616bf363b38b)
<br><br>

### 2-1. 동물 병원 안내 - 상세 조회
![동물병원안내-상세조회](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/e92cf0cf-1da6-47a1-a1a7-2c452a4348b2)
![동물병원안내-후기수정](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/51cd00ca-7025-4576-87e7-2138e0a1f2cf)
<br>
**로드뷰**
![동물병원안내-로드뷰](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/0b3ca2f4-27c0-4a98-a15f-0412b5162616)

### 3. 산책 날씨 예보
![01  날씨페이지](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/59b97fe5-e019-43b5-af49-8353d8d043fc)
![02  TMI리스트](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/853c383b-ca11-4e3a-a4ef-2973be77c5ac)

### 4. 펫 라운지 모금함
![목록 건강 모금률 높은 순](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/f48c8e08-8818-4e9a-9806-c9b29236f5f4)
![후원 등록](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/53aa33bf-f70a-4aa2-875b-78cdab040f6d)
![후원 수정](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/59fe2ea2-df03-487b-9250-ca803de65c15)

### 4-1. 펫 라운지 모금함 - 상세 페이지
![상세페이지 댓글](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/d1a83eb4-ce05-44b2-91ba-f8056817ce62)
![상세페이지 후원내역](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/1e4b69c9-d27a-4cbf-9e69-3b93ecfe43e1)
**후원 결제**
![결제 페이지](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/c00322dd-ca65-4713-bd32-beaa3d26acf7)
![결제창 카카오페이](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/5408379b-faec-4035-b8bb-becfc60f21d7)
![결제창 신용카드](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/15e5a393-06a8-401c-b35f-59b91058295c)
![결제 완료](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/1c037bdc-a970-4b7a-b2cf-92630aede024)
![후원내역 메일](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/131c0dfe-0148-482a-8fcf-bf58a7088118)

### 5. 공지사항
![공지사항_목록 조회](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/f7b7a9a0-2955-4e45-965c-17c21608e8a3)
![공지사항_게시글 검색](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/2ed36bcd-32ac-47b1-8543-81f4c61562ce)
![공지사항_게시글 등록](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/4f97ced7-8209-4da1-a7e4-06f789ee4af0)
![공지사항_게시글 수정](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/d39c9073-8d0f-4cef-9aa7-3765b21e6788)
![공지사항_게시글 삭제](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/dc3b0e35-f28d-43b8-a3f9-e9f7d156d83b)
![공지사항_게시글 상세조회](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/29dfffda-2542-48b6-bc5d-0dae80a599de)

### 6. FAQ
![03  FAQ 목록 조회](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/1130a4e5-1662-473f-938a-5833adacf0b5)
**관리자**
![04  FAQ 목록 조회 - 관리자](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/cc78c99c-5740-4250-a6b1-47629e350867)

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
![관리자페이지_통계관리](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/b2744a41-494a-4448-8d27-ea6cc3840058)
![관리자페이지_회원관리](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/683b49c1-d0a5-418f-bb1d-b52859873c1f)
![관리자페이지 후원관리](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/efd628f9-7b01-4b18-82f3-2f9fc8b3dc13)
![관리자페이지 후원관리 2](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/4e4abac3-9d69-4c43-8032-3f76022ebc25)

### 13. 에러 페이지
![펫라운지-에러페이지](https://github.com/2305PublicDataWebApp/PetLounge/assets/134674257/e2e45566-9692-4e94-9478-acacb692acd9)
