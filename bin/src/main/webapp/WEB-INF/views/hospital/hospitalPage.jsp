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
        <!-- 카카오맵 API services와 clusterer 라이브러리 불러오기 -->
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e9674da3ceea3cb3a1acdb7044a416e8&libraries=services,clusterer"></script>
        <title>동물병원 안내</title>
        <style>
            .star-icon-fill, .call-icon, .location-icon, .home-icon, .search-icon {
                margin-right: 10px;
                font-size: 20px;
                font-variation-settings:
                'FILL' 1,
                'wght' 400,
                'GRAD' 0,
                'opsz' 24
            }

            .star-icon-none {
                margin-right: 10px;
                font-size: 20px;
                font-variation-settings:
                'FILL' 0,
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
                <form action="/hospital/search.pet" method="post" id="search-hospital-form">
                    <div id="search-div">
                    	<c:if test="${ hSearchKeyword ne null }">
	                        <input type="search" value="${ hSearchKeyword }" name="hSearchKeyword" id="h-search-keyword" class="search-input" placeholder="찾고자 하는 주소 또는 동물 병원의 이름을 입력하세요">                     	
                    	</c:if>
                    	<c:if test="${ hSearchKeyword eq null }">
	                        <input type="search" name="hSearchKeyword" id="h-search-keyword" class="search-input" placeholder="찾고자 하는 주소 또는 동물 병원의 이름을 입력하세요">                     	
                    	</c:if>
                        <span class="material-symbols-outlined search-icon" onclick="searchHospital();" style="font-size: 3em; color: #FFD370; cursor: pointer; margin-left: 10px;">
                            search
                        </span>
                    </div>
                </form>
                <div id="map-div">
                    <!-- 기본 주소로 돌아가기 -->
                    <div>
                        <span class="material-symbols-outlined home-icon" style="font-size: 3.5em; color: #FFD370; cursor: pointer;" onclick="defaultLatLng();">
                            home_pin
                        </span>
                        <p class="home-info-box">기본 주소로 이동</p>
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
				<table>
					<colgroup>
<%-- 						<col style="width: 5%;"> --%>
<%-- 						<col style="width: 20%;"> --%>
<%-- 						<col style="width: 20%;"> --%>
<%-- 						<col style="width: 50%;"> --%>
<%-- 						<col style="width: 5%;"> --%>
						<col style="width: 5%;">
						<col style="width: 23%;">
						<col style="width: 22%;">
						<col style="width: 50%;">
					</colgroup>
					<thead>
						<th colspan="4">내 주변 동물병원</th>
					</thead>
					<tbody>
						<!-- 검색 결과 없음 -->
						<c:if test="${ empty hList }">
							<tr>
								<td colspan="4">
									검색 결과 없음
								</td>
							</tr>
						</c:if>
						<c:if test="${ !empty hList }">
							<!-- 기본 주소 리스트 -->
							<c:forEach var="hosList" items="${ hList }" end="5">
<!-- 								<tr onclick="location.href='/hospital/detail.pet'"> -->
								<tr onclick="changeCenter(${ hosList.hLat }, ${ hosList.hLng });">
									<td class="">
										<!-- <span class="material-symbols-outlined star-icon-fill" style="color: #FFD370;">
			                                    star
			                                </span> --> <span
										class="material-symbols-outlined star-icon-none"
										style="color: #FFD370;"> star </span>
									</td>
									<td class="">
										<!-- 동물병원 이름 --> 
										${ hosList.hName }
									</td>
									<td class="">
										<div>
											<span class="material-symbols-outlined call-icon"
												style="color: #56b983;"> call </span>
											<!-- 	                                    <a href="tel:">전화번호</a> -->
											<!-- 전화번호 -->
											<c:if test="${ hosList.hPhone eq null }">
												-
											</c:if>
											<c:if test="${ hosList.hPhone ne null }">
												${ hosList.hPhone }
											</c:if>
										</div>
									</td>
									<td class="">
										<div>
											<span class="material-symbols-outlined location-icon"
												style="color: #e54242;"> location_on </span>
											<!-- 주소 -->
											${ hosList.hRoadAddr }
										</div>
									</td>
<!-- 									<td class=""> -->
<!-- 										<span class="material-symbols-outlined arrow-icon"> -->
<!-- 											navigate_next  -->
<!-- 										</span> -->
<!-- 									</td> -->
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</section>
        </main>
        
		<jsp:include page="../include/footer.jsp"></jsp:include>
		
		<!-- 카카오맵 API 지도 스크립트 -->
		<!-- 마커와 커스텀 오버레이 생성  -->
		<script>
			function makeMarkerAndOverlay() {
				// 마커를 표시할 위치와 name 객체 배열입니다 
			    var positions = [
			        <c:forEach items="${ hList }" var="hos" varStatus="loop">
			            {
			            	no: '${ hos.hNo }',
			            	name: '${ hos.hName }',
			            	roadAddr: '${ hos.hRoadAddr }',
			            	phone: '${ hos.hPhone }',
					        latlng: new kakao.maps.LatLng('${ hos.hLat }', '${ hos.hLng }')
			            }<c:if test="${!loop.last}">,</c:if>
			        </c:forEach>
			    ];
				
				for (var i = 0; i < positions.length; i ++) {			    
				    // 마커를 생성합니다
				    var marker = new kakao.maps.Marker({
				        map: map, // 마커를 표시할 지도
				        title : positions[i].name, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
				        position: positions[i].latlng // 마커를 표시할 위치
				    });
				    
				    var nameToShow = positions[i].name.length > 14 ? positions[i].name.substring(0, 13) + '...' : positions[i].name; // 이름이 13자가 넘어가면 ... 처리
				    
					// 커스텀 오버레이 컨텐츠
					var content = '<div class="wrap">' + 
					            '    <div class="info">' + 
					            '        <div class="title">' + 
					            				nameToShow + 
					            '            <div class="close" onclick="closeOverlay();" title="닫기"></div>' + 
					            '        </div>' + 
					            '        <div class="body">' + 
					            '            <div class="desc">' + 
					            '                <div class="ellipsis">' +
					            					positions[i].roadAddr + 
					            '				 </div>' + 
					            '                <div class="sub-info">' + 
					            '					<a href="tel:' + positions[i].phone + '" class="h-tel">' +
					            						positions[i].phone + 
					            '					</a>' + 
					            '					<a href="/hospital/detail.pet?hNo=' + positions[i].no + '" class="h-detail">' +
					            '						상세보기' +
					            '					</a>' + 
					            '				</div>' +
					            '            </div>' + 
					            '        </div>' + 
					            '    </div>' +    
					            '</div>';
					            
					// 마커 위에 커스텀오버레이를 표시합니다
					// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
					var overlay = new kakao.maps.CustomOverlay({
					    content: content,
					    map: map,      
					    position: positions[i].latlng     
					});
					
					
					var searchKeyword = document.getElementById('h-search-keyword').value;
				    if (searchKeyword.trim() !== '') {
						map.setCenter(positions[0].latlng); // 첫 검색 결과의 좌표로 중앙 좌표 이동			
				    }
				}
				
				marker.setMap(map); // 지도 위에 마커 표시
				// marker.setMap(null); // 마커 제거
			}
		</script>
		<script>
			if(${sessionScope.userId eq null}) {
				// ************************* 비회원 기본 주소 *****************************				
				var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
				var options = { //지도를 생성할 때 필요한 기본 옵션
					center: new kakao.maps.LatLng(37.5679212, 126.9830358), //지도의 중심좌표 (기본주소)
					level: 6 //지도의 레벨(확대, 축소 정도)
				};
		
				var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
				
			    makeMarkerAndOverlay(); // 마커와 커스텀 오버레이 생성
				
				// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
				kakao.maps.event.addListener(marker, 'click', function() {
					if(overlay.getMap()){ // 열려있으면 닫아라
						overlay.setMap(null);  
					} else { // 닫혀있으면 열어라
						overlay.setMap(map);					
					}
				});
				
				// 커스텀 오버레이를 닫기 위해 호출되는 함수
				function closeOverlay() {
					overlay.setMap(null);  
				}	

				
			} else {
				// ************************* 회원가입 시 받은 주소로 기본 주소 *****************************
				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();
				
				// 주소로 좌표를 검색합니다
				const userAddr = '${ user.userAddr }'; // 회원의 주소
				geocoder.addressSearch(userAddr, function(result, status) {
				
				    // 정상적으로 검색이 완료됐으면 
				     if (status === kakao.maps.services.Status.OK) {
				
				        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				
	// 			        // 결과값으로 받은 위치를 마커로 표시합니다
	// 			        var marker = new kakao.maps.Marker({
	// 			            map: map,
	// 			            position: coords
	// 			        });
				
	// 			        // 인포윈도우로 장소에 대한 설명을 표시합니다
	// 			        var infowindow = new kakao.maps.InfoWindow({
	// 			            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
	// 			        });
	// 			        infowindow.open(map, marker);
				
				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				        map.setCenter(coords);
				    } 
				});  
				
				// 마커를 표시할 위치와 title 객체 배열입니다 
			    var positions = [
			        <c:forEach items="${ hList }" var="hos" varStatus="loop">
			            {
			            	title: '${ hos.hName }',
					        latlng: new kakao.maps.LatLng('${ hos.hLat }', '${ hos.hLng }')
			            }<c:if test="${!loop.last}">,</c:if>
			        </c:forEach>
			    ];

				
				for (var i = 0; i < positions.length; i ++) {			    
				    // 마커를 생성합니다
				    var marker = new kakao.maps.Marker({
				        map: map, // 마커를 표시할 지도
				        position: positions[i].latlng, // 마커를 표시할 위치
				        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
				    });
				}
			}
			
			
			// 지도가 이동, 확대, 축소로 인해 중심좌표가 변경되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록
			kakao.maps.event.addListener(map, 'center_changed', function() {
			
			    // 지도의  레벨을 얻어옵니다
			    var level = map.getLevel();
			
			    // 지도의 중심좌표를 얻어옵니다 
			    var latlng = map.getCenter(); 
			
			    $.ajax({
			        url: '/hospital/page.pet', 
			        type: 'POST',
			        data: {
			        	level: level, // 업데이트된 레벨 값
			            latitude: latlng.getLat(), // 업데이트된 위도 값
			            longitude: latlng.getLng() // 업데이트된 경도 값
			        },
			        success: function(response) {
			            // 성공적으로 응답을 받은 경우 처리할 내용을 추가
			            console.log('Coordinates updated successfully.');
			        },
			        error: function(error) {
			            // 오류가 발생한 경우 처리할 내용을 추가
			            console.error('Error updating coordinates: ' + error);
			        }
			    });
			});
			
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
			    var moveLatLng = new kakao.maps.LatLng(37.5679212, 126.9830358); // KH 종로
			    map.panTo(moveLatLng);            
			}        
		</script>
		<!-- 리스트 클릭 시 중심좌표 부드럽게 이동 -->
		<script>
			function changeCenter(lat, lng) {
			    var moveLatLon = new kakao.maps.LatLng(lat, lng);
			    map.panTo(moveLatLon);
			}
		</script>
		<!-- 동물병원 검색 -->
		<script>
            function searchHospital() {
                var form = document.getElementById('search-hospital-form');
                form.submit();
            }
        </script>
    </body>
</html>