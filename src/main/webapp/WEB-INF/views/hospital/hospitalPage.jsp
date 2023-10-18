<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <jsp:include page="../include/importSource.jsp"></jsp:include>
        <link rel="stylesheet" href="/resources/css/hospital/hospitalPage.css">
        <link rel="stylesheet" href="/resources/css/hospital/hosMap.css">        
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
        <!-- 카카오맵 API services와 clusterer 라이브러리 불러오기 -->
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e9674da3ceea3cb3a1acdb7044a416e8&libraries=services,clusterer"></script>
        <title>동물병원 안내</title>
        <style>
            .call-icon, .location-icon, .home-icon, .search-icon {
                margin-right: 10px;
                font-size: 20px;
                font-variation-settings:
                'FILL' 1,
                'wght' 400,
                'GRAD' 0,
                'opsz' 24
            }

            .bookmark-icon-none {
                margin-right: 10px;
                margin-bottom: 5px;
                font-size: 24px;
                font-variation-settings:
                'FILL' 0,
                'wght' 400,
                'GRAD' 0,
                'opsz' 24
            }

            .bookmark-icon-fill {
                margin-right: 10px;
                margin-bottom: 5px;
                font-size: 24px;
                font-variation-settings:
                'FILL' 1,
                'wght' 400,
                'GRAD' 0,
                'opsz' 24
            }
            
            .road-icon {
            	cursor: pointer;
            	font-size: 1.8em;
            	color: #2d79ef;
                font-variation-settings:
                'FILL' 1,
                'wght' 400,
                'GRAD' 0,
                'opsz' 24
            }
        </style>

    </head>
    <body>
        <jsp:include page="../include/header.jsp"></jsp:include>

        <main>
            <!-- 페이지 타이틀 -->
            <section id="title-section">
                <h1>동물병원 안내</h1>
                <div id="line"></div>
            </section>

            <!-- 지도 -->
            <section id="map-section">
                <!-- 검색창 -->
				<div id="search-div">
					<c:if test="${ hSearchKeyword ne null }">
						<input type="search" value="${ hSearchKeyword }" name="hSearchKeyword" id="h-search-keyword" class="search-input" placeholder="찾고자 하는 주소 또는 동물 병원의 이름을 입력하세요">                     	
					</c:if>
					<c:if test="${ hSearchKeyword eq null }">
						<input type="search" name="hSearchKeyword" id="h-search-keyword" class="search-input" placeholder="찾고자 하는 주소 또는 동물 병원의 이름을 입력하세요">                     	
					</c:if>
<!-- 					<span class="material-symbols-outlined search-icon" onclick="searchHos();" style="font-size: 3em; color: #FFD370; cursor: pointer; margin-left: 10px;"> -->
					<span class="material-symbols-outlined search-icon" id="search-icon" style="font-size: 3em; color: #FFD370; cursor: pointer; margin-left: 10px;">
				        search
				    </span>
				</div>
                <div id="map-div">
                    <!-- 기본 주소로 돌아가기 -->
                    <div>
                        <span class="material-symbols-outlined home-icon" data-tooltip-text="기본 주소로 이동" style="font-size: 3em; color: #FFD370; cursor: pointer;" onclick="defaultLatLng();">
                            home_pin
                        </span>
                        <span class="material-symbols-outlined gps-icon" data-tooltip-text="현위치로 이동" style="font-size: 2.5em; cursor: pointer;" onclick="myGps();">
							my_location
						</span>
                    </div>
                    <!-- 지도 -->
                    <div id="map" style="position:relative;overflow:hidden;">
	                    <!-- 지도타입 컨트롤 div 입니다 -->
					    <div class="custom_typecontrol radius_border">
					        <span id="btnRoadmap" class="selected_btn" onclick="setMapType('roadmap')">지도</span>
					        <span id="btnSkyview" class="btn" onclick="setMapType('skyview')">스카이뷰</span>
					    </div>
					    <!-- 지도 확대, 축소 컨트롤 div 입니다 -->
					    <div class="custom_zoomcontrol radius_border"> 
					        <span onclick="zoomIn()"><img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_plus.png" alt="확대"></span>  
					        <span onclick="zoomOut()"><img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_minus.png" alt="축소"></span>
					    </div> 
                    </div>
                </div>
            </section>

       		<!-- 동물병원 리스트 -->
			<section id="hospital-list-section">
				<div>
				    <table>
				        <colgroup>
				            <col style="width: 5%;">
				            <col style="width: 23%;">
				            <col style="width: 22%;">
				            <col style="width: 50%;">
				        </colgroup>
				        <thead>
				            <th colspan="5">내 주변 동물병원</th>
				        </thead>
				        <tbody id="hospital-list-body">
				        </tbody>
				    </table>
				</div>
		        <div id="page-navigation">
				    <ul id="pagination" class="pagination pagination-sm"></ul>
				</div>
			</section>
        </main>
        
		<jsp:include page="../include/footer.jsp"></jsp:include>

		<!-- 카카오맵 API 지도 스크립트 -->
		<script>
			var lat;
			var lng;
			var positions = [];
			var markers = [];
			var marker;
			var overlays = [];
			var overlay;
			
			if(${sessionScope.uId eq null}) {
				// ************************* 비회원 기본 주소 *****************************			
				lat = 37.5679212;
				lng = 126.9830358;
				createMap(lat, lng);
			} else {
				// ************************* 회원가입 시 받은 주소로 기본 주소 *****************************
				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();
				
				// 주소로 좌표를 검색합니다
				const userAddr = '${ user.uAddr }'; // 회원의 주소
				geocoder.addressSearch(userAddr, function(result, status) {
				
				     if (status === kakao.maps.services.Status.OK) { // 정상적으로 검색이 완료됐으면 
				    	lat = result[0].y;
				    	lng = result[0].x;
				    } else { // 정상적으로 검색이 완료되지 않았으면 비회원 기본주소와 동일
				    	lat = 37.5679212;
						lng = 126.9830358;
				    }
			        createMap(lat, lng);
				});  
			}			
			
			// 지도를 생성하는 함수
			function createMap(lat, lng) {
				var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
				var options = { //지도를 생성할 때 필요한 기본 옵션
					center: new kakao.maps.LatLng(lat, lng), //지도의 중심좌표 (기본주소)
					level: 6 //지도의 레벨(확대, 축소 정도)
				};
		
				map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
				getHospitalList(map, lat, lng);
				moveLocation(map);
			}
			
			// 리스트를 불러오는 ajax
			function getHospitalList(map, lat, lng) {
				$.ajax ({
					 url: "/hospital/getHospitalList.pet",
					 type: "GET",
					 dataType: "json",
					 data: {
						latitude: lat,
				        longitude: lng
					 },
					 success: function(data) {
						showListFunc(data);
						
						var hospitalListTitle = document.querySelector('th[colspan="5"]');
						hospitalListTitle.innerHTML = '내 주변 동물병원';
					 },
					 error: function(){
						 alert("동물병원 리스트 호출 오류. 관리자에게 문의 바랍니다.");
					 }
				 });
			}
			
			// 리스트 매핑 함수
			function showListFunc(hList) {
				positions = [];
				for(let i = 0; i < hList.length; i++){
					var position = {
						no: hList[i].hNo,
						name: hList[i].hName,
						roadAddr: hList[i].hRoadAddr,
						phone: hList[i].hPhone,
						latlng: new kakao.maps.LatLng(hList[i].hLat, hList[i].hLng)
					};
					positions.push(position);
				}
				
				if(hList.length > 0) {
					makeMarkerAndOverlay(map, positions); // 마커 표시
				} else { // 검색결과가 없을 때, 마커 표시 안함
					for (var i = 0; i < markers.length; i++) {
		                markers[i].setMap(null);
		                overlays[i].setMap(null);
		            }
				}
				
				loadHospitalList(hList); // 리스트 표시
			}
			
			// 마커와 커스텀 오버레이 생성
			function makeMarkerAndOverlay(map, positions) {
	   			// 마커와 커스텀 오버레이 초기화
				for (var i = 0; i < markers.length; i++) {
	                markers[i].setMap(null);
	                overlays[i].setMap(null);
	            }
	   			markers = [];
	   			overlays = [];
			            
			    // 새로운 마커 생성
				for (var i = 0; i < positions.length; i ++) {			    
				    marker = new kakao.maps.Marker({
				        map: map, // 마커를 표시할 지도
				        title : positions[i].name, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
				        position: positions[i].latlng // 마커를 표시할 위치
				    });
				    
				    markers.push(marker);
				    
				    var nameToShow = positions[i].name.length > 14 ? positions[i].name.substring(0, 13) + '...' : positions[i].name; // 이름이 13자가 넘어가면 ... 처리
				    
					// 커스텀 오버레이 컨텐츠를 DOM 방식으로 생성
					var content = document.createElement('div');
					content.className = 'wrap';
					
					var infoDiv = document.createElement('div');
					infoDiv.className = 'info';
					
					var titleDiv = document.createElement('div');
					titleDiv.className = 'title';
					
					// 이름 요소
					var nameElement = document.createTextNode(nameToShow);
					titleDiv.appendChild(nameElement);
					
					var closeBtn = document.createElement('div');
					closeBtn.className = 'close';
					closeBtn.title = '닫기';
					
					titleDiv.appendChild(closeBtn);
					infoDiv.appendChild(titleDiv);
					
					var bodyDiv = document.createElement('div');
					bodyDiv.className = 'body';
					
					var descDiv = document.createElement('div');
					descDiv.className = 'desc';
					
					// 도로 주소 요소
					var roadAddrElement = document.createElement('div');
					roadAddrElement.className = 'ellipsis';
					roadAddrElement.appendChild(document.createTextNode(positions[i].roadAddr));
					descDiv.appendChild(roadAddrElement);
					
					var subInfoDiv = document.createElement('div');
					subInfoDiv.className = 'sub-info';
					
					// 전화번호 링크
					var telLink = document.createElement('a');
					telLink.href = 'tel:' + positions[i].phone;
					telLink.className = 'h-tel';
					telLink.appendChild(document.createTextNode(positions[i].phone ? positions[i].phone : '번호정보없음'));
					
					// 상세보기 링크
					var detailLink = document.createElement('a');
					detailLink.href = '/hospital/detail.pet?hNo=' + positions[i].no;
					detailLink.className = 'h-detail';
					detailLink.appendChild(document.createTextNode('상세보기'));
					
					subInfoDiv.appendChild(telLink);
					subInfoDiv.appendChild(detailLink);
					
					descDiv.appendChild(subInfoDiv);
					bodyDiv.appendChild(descDiv);
					infoDiv.appendChild(bodyDiv);
					content.appendChild(infoDiv);
					            
					// 마커 위에 커스텀오버레이를 표시합니다
					// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
					overlay = new kakao.maps.CustomOverlay({
					    content: content,
					    map: null,      
// 					    map: map,      
					    position: positions[i].latlng     
					});
					
					overlays.push(overlay);
					
					var searchKeyword = document.getElementById('h-search-keyword').value;
				    if (searchKeyword.trim() !== '') {
						map.setCenter(positions[0].latlng); // 첫 검색 결과의 좌표로 중앙 좌표 이동			
				    }
				    					
					markers[i].setMap(map); // 지도 위에 마커 표시
					
			 		// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
					(function (marker, overlay) {
				        kakao.maps.event.addListener(marker, 'click', function () {
				            if (overlay.getMap()) {
				                overlay.setMap(null); // 열려있으면 닫아라
				            } else {
				                overlay.setMap(map); // 닫혀있으면 열어라
				            }
				        });
				        
				        var closeBtn = overlay.getContent().querySelector('.close');
			            closeBtn.addEventListener('click', function () {
			                overlay.setMap(null); // 클릭 시 overlay를 닫음
			            });
				    })(marker, overlay);
				}
				overlays[0].setMap(map); // 첫번째 결과만 우선 표시
			}
			
			// 리스트 표시 함수
			function loadHospitalList(hList) {
			    var hospitalListBody = document.getElementById('hospital-list-body');
			    hospitalListBody.innerHTML = '';

			    if (hList.length === 0) {
			        var noResultRow = document.createElement('tr');
			        noResultRow.className = 'search-list-none';
			        var noResultCell = document.createElement('td');
			        noResultCell.colSpan = 5;
			        noResultCell.style.color = 'lightgray';
			        noResultCell.style.textAlign = 'center';
			        noResultCell.textContent = '검색 결과가 없습니다';
			        noResultRow.appendChild(noResultCell);
			        hospitalListBody.appendChild(noResultRow);
			    } else {
			        for (var i = 0; i < hList.length; i++) {
			            var row = document.createElement('tr');

			            // 중심 좌표 이동
			            row.onclick = (function (lat, lng, index) {
			                return function () {
			                    changeCenter(lat, lng, index);
			                };
			            })(hList[i].hLat, hList[i].hLng, i);

			            var bookmarkCell = document.createElement('td');
			            var bookmarkDiv = document.createElement('div');
			            var bookmarkIcon = document.createElement('span');
			            if(hList[i].hBookmark == null) {
				            bookmarkIcon.className = 'material-symbols-outlined bookmark-icon-none';			            	
			            } else {
				            bookmarkIcon.className = 'material-symbols-outlined bookmark-icon-fill';			            	
			            }
			            bookmarkIcon.style.color = '#FFD370';
			            bookmarkIcon.textContent = 'bookmark';
			            bookmarkDiv.appendChild(bookmarkIcon);
			            bookmarkCell.appendChild(bookmarkDiv);
			            
			            // 즐겨찾기
						bookmarkIcon.addEventListener('click', (function (index) {
						    return function () {
						        var bookmarkHNo = hList[index].hNo;
						        addToHBookmark(bookmarkHNo, this);
						    };
						})(i));

			            var nameCell = document.createElement('td');
			            nameCell.textContent = hList[i].hName;

			            var phoneCell = document.createElement('td');
			            var phoneDiv = document.createElement('div');
			            var phoneIcon = document.createElement('span');
			            phoneIcon.className = 'material-symbols-outlined call-icon';
			            phoneIcon.style.color = '#56b983';
			            phoneIcon.textContent = 'call';
			            var phoneText = document.createTextNode(hList[i].hPhone ? hList[i].hPhone : '번호정보없음');
			            phoneDiv.appendChild(phoneIcon);
			            phoneDiv.appendChild(phoneText);
			            phoneCell.appendChild(phoneDiv);

			            var addressCell = document.createElement('td');
			            var addressDiv = document.createElement('div');
			            var addressIcon = document.createElement('span');
			            addressIcon.className = 'material-symbols-outlined location-icon';
			            addressIcon.style.color = '#e54242';
			            addressIcon.textContent = 'location_on';
			            var addressText = document.createTextNode(hList[i].hRoadAddr);
			            addressDiv.appendChild(addressIcon);
			            addressDiv.appendChild(addressText);
			            addressCell.appendChild(addressDiv);
			            
						var roadCell = document.createElement('td');
						var roadDiv = document.createElement('div');
			            var roadIcon = document.createElement('span');
			            roadIcon.className = 'material-symbols-outlined road-icon';
						roadIcon.textContent = 'directions';
						roadDiv.appendChild(roadIcon);
						roadCell.appendChild(roadDiv);
						
						roadIcon.addEventListener('click', (function (index) {
						    return function () {
						        var url = "https://map.kakao.com/link/to/" + hList[index].hName + "," + hList[index].hLat + "," + hList[index].hLng;
						        window.open(url, '_blank');
						    };
						})(i));

			            row.appendChild(bookmarkCell);
			            row.appendChild(nameCell);
			            row.appendChild(phoneCell);
			            row.appendChild(addressCell);
			            row.appendChild(roadCell);

			            hospitalListBody.appendChild(row);
			        }
			    }
			}
			
			// 지도가 이동, 확대, 축소로 인해 중심좌표가 변경되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록
			// 이동이 끝났을 때의 좌표를 가지고 넘어옴 (idle)
			// 실시간 변화값은 center_changed 사용함
			function moveLocation(map) {
				kakao.maps.event.addListener(map, 'idle', function() {
				    // 지도의 중심좌표를 얻어옵니다
				    var latlng = map.getCenter();
				    var searchKeyword = document.getElementById('h-search-keyword').value.trim(); // 검색
				
				    if (searchKeyword === '') { // 검색하지 않았을 때만 동작
				    	$("#pagination").html('');
				        $.ajax({
				            url: '/hospital/moveLocation.pet',
				            type: 'GET',
				            data: {
				                latitude: latlng.getLat(), // 업데이트된 위도 값
				                longitude: latlng.getLng() // 업데이트된 경도 값
				            },
				            success: function(data) {
				                getHospitalList(map, latlng.getLat(), latlng.getLng());
				            },
				            error: function() {
								alert("지도 이동 이벤트 오류. 관리자에게 문의 바랍니다.");
				            }
				        });
				    }
				});
			}
			
			// 지도타입 컨트롤의 지도 또는 스카이뷰 버튼을 클릭하면 호출되어 지도타입을 바꾸는 함수
			function setMapType(maptype) { 
			    var roadmapControl = document.getElementById('btnRoadmap');
			    var skyviewControl = document.getElementById('btnSkyview'); 
			    if (maptype === 'roadmap') {
			        map.setMapTypeId(kakao.maps.MapTypeId.ROADMAP);    
			        roadmapControl.className = 'selected_btn';
			        skyviewControl.className = 'btn';
			    } else {
			        map.setMapTypeId(kakao.maps.MapTypeId.HYBRID);    
			        skyviewControl.className = 'selected_btn';
			        roadmapControl.className = 'btn';
			    }
			}

			// 지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수
			function zoomIn() {
			    map.setLevel(map.getLevel() - 1);
			}

			// 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수
			function zoomOut() {
			    map.setLevel(map.getLevel() + 1);
			}
			
			// 지도 중심좌표 부드럽게 이동시키기
			function defaultLatLng() {
			    var moveLatLng = new kakao.maps.LatLng(lat, lng);
			    map.panTo(moveLatLng);            
			    getHospitalList(map, lat, lng);
			    document.getElementById('h-search-keyword').value = '';
			    $("#pagination").html('');
			}        
			
			// 리스트 클릭 시 중심좌표 부드럽게 이동
			function changeCenter(lat, lng, count) {
			    var moveLatLon = new kakao.maps.LatLng(lat, lng);
                for(var i = 0; i < overlays.length; i++){
				    overlays[i].setMap(null); 
                }
                overlays[count].setMap(map); // 클릭한 리스트의 오버레이만 표시
			    map.panTo(moveLatLon);
			}
			
			// 현위치로 중심좌표 이동
			function myGps() {
				// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
				if (navigator.geolocation) {
				    
				    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
				    navigator.geolocation.getCurrentPosition(function(position) {
				        
				        latitude = position.coords.latitude, // 위도
				        longitude = position.coords.longitude; // 경도
				        	
						map.panTo(new kakao.maps.LatLng(latitude, longitude));
						getHospitalList(map, latitude, longitude);
				      });
				    
				} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
				    alert('현위치를 가져올 수 없습니다...');
				    map.panTo(new kakao.maps.LatLng(lat, lng)); 
				}
				
				document.getElementById('h-search-keyword').value = '';
				$("#pagination").html('');
			}
			
			// 즐겨찾기 ajax
			function addToHBookmark(bookmarkHNo, bookmark) {
		        $.ajax({
		            url: '/hospital/addToHBookmark.pet',
		            type: 'POST',
		            data: {
		                hNo: bookmarkHNo
		            },
		            success: function (data) {
		            	if(data == "insert"){
// 		            		alert("북마크 등록 성공");
		            		bookmark.classList.remove('bookmark-icon-none');
		                    bookmark.classList.add('bookmark-icon-fill');
		            	} else if(data == "delete") {
// 		            		alert("북마크 등록 삭제");
		            		bookmark.classList.remove('bookmark-icon-fill');
		                    bookmark.classList.add('bookmark-icon-none');
		            	} else if(data == "loginFail") {
			                alert("로그인이 필요한 서비스입니다.");
			                location.href="/user/login.pet";
		            	} 
		            },
		            error: function () {
		            	alert("동물병원 즐겨찾기 오류. 관리자에게 문의 바랍니다.");
		            }
		        });
		    }
			
			
			
			<!-- 페이징 처리된 검색결과 조회 -->
			// 검색결과 페이징 
			let currentPage = 1; // 현재 페이지 
			let recordCountPerPage = 5; // 페이지당 검색결과 수 
			let naviCountPerPage = 5; // 한 그룹당 페이지 수
			let totalPages = 0; // 총 페이지 수
			
			document.getElementById("search-icon").addEventListener("click", function() {
			    currentPage = 1;
			    searchHos(currentPage, "");
			});
			
			// 동물병원 검색 ajax
			function searchHos(currentPage, keyword) {
				var searchKeyword = document.getElementById('h-search-keyword').value;
				if(keyword != "" && keyword != searchKeyword) {
					searchKeyword = keyword;
				}
				if (searchKeyword.trim() !== '') {
			    	$.ajax ({
			    		 url: "/hospital/search.pet",
			    		 type: "GET",
			    		 dataType: "json",
			    		 data: {
			    			latitude: lat,
				            longitude: lng,
				            hSearchKeyword: searchKeyword,
				            currentPage: currentPage, 
							recordCountPerPage: recordCountPerPage 
			    		 },
			    		 success: function(data) {
		    			 	totalPages = data.totalPages; // 총 페이지 수
			    			showListFunc(data.hList);
		    			 	createPagination(totalPages, data.searchKeyword);
			    			
							var hospitalListTitle = document.querySelector('th[colspan="5"]');
							hospitalListTitle.innerHTML = '<span style="color: #FFD370;">' + searchKeyword + '</span> 검색 결과';
			    		 },
			    		 error: function(){
			    			 alert("동물병원 검색 오류. 관리자에게 문의 바랍니다.");
			    		 }
			    	 });
			    	
				} else {
					createMap(lat, lng);
					$("#pagination").html('');
				}
			}
			
			// 페이지 만들기 
			const createPagination = (totalPages, keyword) => {
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
			            goToPreviousGroup(keyword);
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
			            changePage(i, keyword);
			        });
			        paginationUl.append(li);
			    }
				// "다음" 버튼 추가
			    if (currentGroup < numGroups) {
			        const nextLi = $('<li class="page-item"><a class="page-link" href="javascript:void(0)"><i class="bi bi-caret-right-fill"></i></a></li>');
			        nextLi.click(() => {
			            goToNextGroup(keyword);
			        });
			        paginationUl.append(nextLi);
			    }
			}
			
			// 페이지 변경 시 호출되는 함수
			const changePage = (newPage, keyword) => {
			    currentPage = newPage;
			    searchHos(currentPage, keyword);
			}
			
			// 그룹 변경 시 호출되는 함수
			const changeGroup = (newGroup, keyword) => {
			    currentPage = (newGroup - 1) * naviCountPerPage + 1;
			    searchHos(currentPage, keyword);
			}
	
			// 이전 그룹으로 이동할 때 호출 
			const goToPreviousGroup = (keyword) => {
			    const currentGroup = Math.ceil(currentPage / naviCountPerPage);
			    if (currentGroup > 1) {
			        const lastPageOfPreviousGroup = (currentGroup - 1) * naviCountPerPage;
			        changePage(lastPageOfPreviousGroup, keyword);
			    }
			}
	
			// 다음 그룹으로 이동할 때 호출
			const goToNextGroup = (keyword) => {
			    const numGroups = Math.ceil(totalPages / naviCountPerPage);
			    const currentGroup = Math.ceil(currentPage / naviCountPerPage);
			    if (currentGroup < numGroups) {
			        changeGroup(currentGroup + 1, keyword);
			    }
			}
			
			$(function(){
				var hSearchKeyword = "${hSearchKeyword }";
				setTimeout(function() {
					searchHos(1, hSearchKeyword);	
				}, 150);
				// setInterval(getReviewList, 1000); // 1초 단위로 getReviewList가 호출되어 검색결과 실시간 조회
			})
		</script>
		<!-- 동물병원 검색 (input search) -->
		<script>
			document.getElementById('h-search-keyword').addEventListener('keypress', function (event) {
			    if (event.key === 'Enter') {
// 			        searchHos();
			    	currentPage = 1;
				    searchHos(currentPage, "");
			    }
			});
        </script>
    </body>
</html>