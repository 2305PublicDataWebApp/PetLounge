<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <jsp:include page="../include/importSource.jsp"></jsp:include>
        <link rel="stylesheet" href="/resources/css/hospital/hospitalDetail.css">
        <link rel="stylesheet" href="/resources/css/hospital/hosMap.css">        
        <!-- 카카오맵 API services와 clusterer 라이브러리 불러오기 -->
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e9674da3ceea3cb3a1acdb7044a416e8&libraries=services,clusterer"></script>
        <title>${ hOne.hName } 상세 안내</title>
        <style>
            .bookmark-icon-fill, .call-icon, .location-icon, .home-icon, .search-icon {
                margin-right: 10px;
                font-size: 20px;
                font-variation-settings:
                'FILL' 1,
                'wght' 400,
                'GRAD' 0,
                'opsz' 24
            }

            .bookmark-icon-none {
                font-variation-settings:
                'FILL' 0,
                'wght' 400,
                'GRAD' 0,
                'opsz' 24
            }

            .bookmark-icon-fill, .bookmark-icon-none {
                font-size: 3em;
                cursor: pointer;
            }
        </style>
    </head>
    <body>
 		<jsp:include page="../include/header.jsp"></jsp:include>

        <main>
            <!-- 페이지 타이틀 -->
            <section id="title-section">
                <h1>${ hOne.hName }</h1>
                <div id="line"></div>
                <div id="hospital-info">
                    <div>
                        <span class="material-symbols-outlined call-icon" style="color: #56b983;">
                            call
                        </span>
						<c:if test="${ hOne.hPhone eq null }">
							-
						</c:if>
						<c:if test="${ hOne.hPhone ne null }">
							${ hOne.hPhone }
						</c:if>
                    </div>
                    <div>
                        <span class="material-symbols-outlined location-icon" style="color: #e54242;">
                            location_on
                        </span>
                        ${ hOne.hRoadAddr }
                    </div>
                </div>
            </section>

            <!-- 지도 -->
            <section id="map-section">
                <div id="map-div">
                    <!-- 지도 -->
                    <div>
                        <!-- <span class="material-symbols-outlined bookmark-icon-fill" style="color: #FFD370;">
                                    bookmark
                        </span> -->
                        <span class="material-symbols-outlined bookmark-icon-none" style="color: #FFD370;">
                            bookmark
                        </span>
                    </div>
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

            <!-- 리뷰 리스트 -->
            <section id="hospital-review-section">
                <div id="review-title">
                    <h3 id="review-title-text">다른 사용자들에게 <span style="color: #FFD370;">도움</span>이 될 <span style="color: #FFD370;">후기</span>를 공유해 주세요</h3>
                </div>
                <!-- 등록 -->
                <div id="review-create-div">
                    <form action="/hReview/insert.do" method="post">
                    	<input type="hidden" name="hNo" value="${ hOne.hNo }">
                        <textarea name="hRContent" id="review-create-content" placeholder="후기 내용을 작성해주세요" required></textarea>
                        <input type="submit" value="등록" id="review-create-btn">
                    </form>
                </div>
                <!-- 리스트 -->
                <div id="review-list-div">
                    <table>
                        <colgroup>
                            <col style="width: 5%;">
                            <col style="width: 80%;">
                            <col style="width: 15%;">
                        </colgroup>
                        <c:forEach begin="1" end="5">
	                        <tr>
	                            <td>
	                                <div style="width: 50px; height: 50px; background-color: #FFD370; border-radius: 100%;"></div>
	                            </td>
	                            <td>
	                                <div class="user-info-div">
	                                    <span class="user-nickname">
	                                        동숲주민
	                                    </span>
	                                    <span class="review-create-date">
	                                        2023.10.03 19:42
	                                    </span>
	                                </div>
	                                <div class="review-content">
	                                    리뷰 내용
	                                </div>
	                            </td>
	                            <td>
	                                <a href="" class="review-modify-btn" data-bs-toggle="modal" data-bs-target="#modifyModal">수정</a>
	                                <a href="" class="review-delete-btn">삭제</a>
	                            </td>
	                        </tr>
                        </c:forEach>
                    </table>
                    <div id="page-navigation">
                        << <span style="color:#FFD370;">1</span> 2 3 4 5 >>
                    </div>
                </div>
            </section>
        
            <!-- 수정 모달창 -->
            <section>
                <div class="modal fade" id="modifyModal" tabindex="-1" aria-labelledby="modifyModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div class="modify-user-info-div">
                                    <div style="width: 50px; height: 50px; background-color: #FFD370; border-radius: 100%; margin-right: 20px;"></div>
                                    <span class="user-nickname">
                                        동숲주민
                                    </span>
                                </div>
                                <div id="review-modify-div">
                                    <form action="" method="">
                                        <textarea name="" class="review-modify-content" placeholder="후기 내용을 수정해 주세요"></textarea>
                                    </form>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn modal-modify-btn">수정</button>
                            </div>
                        </div>
                    </div>
                </div>      
            </section>
        </main>
        
        <jsp:include page="../include/footer.jsp"></jsp:include>
        
   		<!-- 카카오맵 API 지도 스크립트 -->
		<script>
			var lat = '${ hOne.hLat }';
			var lng = '${ hOne.hLng }';
			
			var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
			var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new kakao.maps.LatLng(lat, lng), //지도의 중심좌표 (기본주소)
				level: 3 //지도의 레벨(확대, 축소 정도)
			};
	
			var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
			
		   	// 마커와 커스텀 오버레이 생성
		    var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: new kakao.maps.LatLng(lat, lng) // 마커를 표시할 위치
		    });
		    
		    var nameToShow = '${ hOne.hName }'.length > 14 ? '${ hOne.hName }'.substring(0, 13) + '...' : '${ hOne.hName }'; // 이름이 13자가 넘어가면 ... 처리
		    
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
			
			//닫기 버튼 클릭 이벤트 핸들러
			closeBtn.addEventListener('click', function () {
			    overlay.setMap(null);
			});
		
			titleDiv.appendChild(closeBtn);
			infoDiv.appendChild(titleDiv);
			
			var bodyDiv = document.createElement('div');
			bodyDiv.className = 'body';
			
			var descDiv = document.createElement('div');
			descDiv.className = 'desc';
			
			// 도로 주소 요소
			var roadAddrElement = document.createElement('div');
			roadAddrElement.className = 'ellipsis';
			roadAddrElement.appendChild(document.createTextNode('${ hOne.hRoadAddr }'));
			descDiv.appendChild(roadAddrElement);
			
			var subInfoDiv = document.createElement('div');
			subInfoDiv.className = 'sub-info';
			
			// 전화번호 링크
			var telLink = document.createElement('a');
			telLink.href = 'tel:' + '${ hOne.hPhone }';
			telLink.className = 'h-tel';
			telLink.appendChild(document.createTextNode('${ hOne.hPhone }'));
			
			subInfoDiv.appendChild(telLink);
			descDiv.appendChild(subInfoDiv);
			bodyDiv.appendChild(descDiv);
			infoDiv.appendChild(bodyDiv);
			content.appendChild(infoDiv);
			            
			// 마커 위에 커스텀오버레이를 표시합니다
			// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
			var overlay = new kakao.maps.CustomOverlay({
			    content: content,
			    map: map,      
			    position: marker.getPosition()    
			});
				    
			// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
			kakao.maps.event.addListener(marker, 'click', function() {
				if(overlay.getMap()){ // 열려있으면 닫아라
					overlay.setMap(null);  
				} else { // 닫혀있으면 열어라
					overlay.setMap(map);					
				}
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
		</script>
    </body>
</html>