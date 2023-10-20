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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
        <!-- 카카오맵 API services와 clusterer 라이브러리 불러오기 -->
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e9674da3ceea3cb3a1acdb7044a416e8&libraries=services,clusterer"></script>
        <title>${ hOne.hName } 상세 안내</title>
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
                font-variation-settings:
                'FILL' 0,
                'wght' 400,
                'GRAD' 0,
                'opsz' 24
            }

            .bookmark-icon-fill, .camera-icon, .road-icon, .list-icon {
                font-variation-settings:
                'FILL' 1,
                'wght' 400,
                'GRAD' 0,
                'opsz' 24
            }

            .bookmark-icon-fill, .bookmark-icon-none {
                font-size: 3em;
                cursor: pointer;                
            }
            
            .camera-icon {
            	font-size: 2.8em;
            	cursor: pointer;
            	color: #a3a3a3;
            }
            
            .road-icon {
            	font-size: 2.8em;
            	cursor: pointer;
            	color: #2d79ef;
            }
            
            .list-icon {
            	font-size: 2.8em;
            	cursor: pointer;
            	color: #FFD370;
    			vertical-align: text-bottom;
            }
            
            .
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
							번호정보없음
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
	                    <div>
		                    <span class="material-symbols-outlined list-icon" data-tooltip-text="돌아가기" onclick="goBacktoList();">
								list	
							</span>
	                    </div>
	                    <div>
		                    <span class="material-symbols-outlined road-icon" data-tooltip-text="길찾기" onclick="getRoad();">
								directions
							</span>
							<span class="material-symbols-outlined camera-icon" data-tooltip-text="로드뷰 보기" onclick="getRoadView();">
								camera_video
							</span>
	                    	<c:if test="${ hBookmark eq 1 }">
							    <span id="bookmark-icon" class="material-symbols-outlined bookmark-icon-fill" data-tooltip-text="즐겨찾기" style="color: #FFD370;" onclick="hosBookmark(${ hOne.hNo });">
							        bookmark
							    </span>
							</c:if>
							<c:if test="${ hBookmark eq 0 }">
							    <span id="bookmark-icon" class="material-symbols-outlined bookmark-icon-none" data-tooltip-text="즐겨찾기" style="color: #FFD370;" onclick="hosBookmark(${ hOne.hNo });">
							        bookmark
							    </span>
							</c:if>
	                    </div>
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
            <!-- 후기 리스트 -->
            <section id="hospital-review-section">
                <div id="review-title">
                    <h3 id="review-title-text">다른 사용자들에게 <span style="color: #FFD370;">도움</span>이 될 <span style="color: #FFD370;">후기</span>를 공유해 주세요</h3>
                </div>
                <!-- 등록 -->
                <div id="review-create-div">
                    <input type="text" name="hRContent" id="review-create-content" placeholder="후기 내용을 작성해주세요" required>
                    <button id="review-create-btn" onclick="hohReviewInsert(${ hOne.hNo });">등록</button>
                </div>
                <!-- 리스트 -->
                <div id="review-list-div">
                    <table id="review-table">
						<colgroup>
							<col style="width: 5%;">
							<col style="width: 80%;">
							<col style="width: 15%;">
						</colgroup>
					    <tr>
					        <td></td>
					        <td></td>
					        <td></td>
					    </tr>
					</table>
						<div id="page-navigation">
						    <ul id="pagination" class="pagination pagination-sm"></ul>
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
<!--                                     <div style="width: 50px; height: 50px; background-color: #FFD370; border-radius: 100%; margin-right: 20px;"></div> -->
									<img src="" class="review-modify-profile-img" style="border-radius: 100%; border: 2px solid #FFD370; width:50px; height:50px; margin-right: 20px;">
                                    <span class="user-nickname modify-user-nickname">
                                    </span>
                                </div>
                                <div id="review-modify-div">
                                   	<input type="hidden" name="hRNo" class="h-r-no">
                                    <input type="text" name="hRContent" class="review-modify-content" placeholder="후기 내용을 수정해 주세요">
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn modal-modify-btn" onclick="modifyReview();">수정</button>
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
		   	var imageSrc = "/resources/images/hospital/hospitalMarker.png"; 
			
			// 마커 이미지의 이미지 크기 입니다
		    var imageSize = new kakao.maps.Size(55, 55); 
		    
		    // 마커 이미지를 생성합니다    
		    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
		    
		    var marker = new kakao.maps.Marker({
		    	map: map, // 마커를 표시할 지도
		        position: new kakao.maps.LatLng(lat, lng), // 마커를 표시할 위치
		        image : markerImage // 마커 이미지 
		    });
		    
// 		    var marker = new kakao.maps.Marker({
// 		        map: map, // 마커를 표시할 지도
// 		        position: new kakao.maps.LatLng(lat, lng) // 마커를 표시할 위치
// 		    });
		    
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
			telLink.appendChild(document.createTextNode('${ hOne.hPhone }' ? '${ hOne.hPhone }' : '번호정보없음'));
			
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

			// 길찾기
			function getRoad() {
				var url = "https://map.kakao.com/link/to/" + '${ hOne.hName }' + "," + '${ hOne.hLat }' + "," + '${ hOne.hLng }';
				window.open(url, '_blank');
			}
			
			// 로드뷰
			function getRoadView() {
				var url = "https://map.kakao.com/link/roadview/" + '${ hOne.hLat }' + "," + '${ hOne.hLng }';
				window.open(url, '_blank');
			}
		</script>
		<!-- 즐겨찾기 -->
		<script>
		    function hosBookmark(bookmarkHNo) {
		        var bookmark = document.getElementById('bookmark-icon');
		
		        $.ajax({
		            url: '/hospital/addToHBookmark.pet',
		            type: 'POST',
		            data: {
		                hNo: bookmarkHNo
		            },
		            success: function (data) {
		                if (data == "insert") {
		                    bookmark.classList.remove('bookmark-icon-none');
		                    bookmark.classList.add('bookmark-icon-fill');
		                } else if (data == "delete") {
		                    bookmark.classList.remove('bookmark-icon-fill');
		                    bookmark.classList.add('bookmark-icon-none');
		                } else if (data == "loginFail") {
		                    alert("로그인이 필요한 서비스입니다.");
		                    location.href="/user/login.pet";
		                } 
		            },
		            error: function () {
		            	alert("동물병원 즐겨찾기 오류. 관리자에게 문의 바랍니다.");
		            }
		        });
		    }
		</script>
		<!-- 후기 -->
		<script>
			// 후기 등록 
			function hohReviewInsert(hNo) {
				const hRContent = $("#review-create-content").val();
				$.ajax({
					url : '/hReview/insert.pet',
					type : 'POST',
					data : { 
						hNo : hNo,
						hRContent : hRContent 
					},
					success : function(data) {
						if(data == "success") {
							$("#review-create-content").val("");
							getReviewList();
						} else if(data == "loginFail") {
							alert("로그인이 필요한 서비스입니다."); 
							location.href="/user/login.pet";
						} else if (data == "empty") {
		                	alert("후기 내용은 비워둘 수 없습니다.");
		                } else {
							alert("동물병원 후기 등록 실패");
						}
					},
					error : function() {
						alert("동물병원 후기 작성 오류. 관리자에게 문의 바랍니다.");
					}
				});
			}
			
			// 후기 수정창 보이기 
			function openModifyView(hRNo, hRNickName, hRContent, hRProfileImg) {
				document.querySelector('.h-r-no').value = hRNo;
				document.querySelector('.modify-user-nickname').innerText = hRNickName;
				document.querySelector('.review-modify-content').value = hRContent;
				document.querySelector('.review-modify-profile-img').src = hRProfileImg;
				let modifyButton = document.querySelector('.modal-modify-btn');
// 				modifyButton.addEventListener('click', function() {
// 					modifyReview();
// 				});	

				console.log(hRProfileImg);
			}
			
			// 후기 수정 
			function modifyReview() {
				let hRNo = document.querySelector('.h-r-no').value;
				let hRContent = document.querySelector('.review-modify-content').value;
				$.ajax({
					url : '/hReview/update.pet',
					type : 'POST',
					data : { 
						hRNo : hRNo,
						hRContent : hRContent 
					},
					success : function(data) {
						if(data == "success") {
							document.querySelector('[data-bs-dismiss="modal"]').click(); // 모달 닫는 버튼이 클릭되어서 닫히게 함 
							getReviewList(); // 후기 목록 새로고침 
						} else if(data == "loginFail") {
							alert("로그인이 필요한 서비스입니다."); 
							location.href="/user/login.pet";
						} else if (data == "empty") {
		                	alert("후기 내용은 비워둘 수 없습니다.");
		                } else {
							alert("동물병원 후기 수정 실패");
						}
					},
					error : function() {
						alert("동물병원 후기 수정 오류. 관리자에게 문의 바랍니다.");
					}
				});
			}
			
			// 후기 삭제 체크 
			function checkDeleteReview(hRNo) {
				if (confirm("후기를 삭제하시겠습니까?")) {
					deleteReview(hRNo);
				}
			}
			
			// 후기 삭제 
			function deleteReview(hRNo) {
				$.ajax({
					url : '/hReview/delete.pet',
					type : 'POST',
					data : { 
						hRNo : hRNo 
					},
					success : function(data) {
						if(data == "success") {
							getReviewList();
						} else {
							alert("동물병원 후기 삭제 실패");
						}
					},
					error : function() {
						alert("동물병원 후기 삭제 오류. 관리자에게 문의 바랍니다.");
					}
				});
			}
			
			// 후기 페이징 
			let currentPage = 1; // 현재 페이지 
			let recordCountPerPage = 5; // 페이지당 후기 수 
			let naviCountPerPage = 5; // 한 그룹당 페이지 수
			let totalPages = 0; // 총 페이지 수
			
			// 날짜 포맷팅 (후기 작성일에 사용)
			function getFormattedDate(dateString) {
			    const options = { year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit'};
			    const formattedDate = new Date(dateString).toLocaleDateString('ko-KR', options);
			    return formattedDate;
			};
			
			// 후기 리스트를 불러오는 ajax Function 
			function getReviewList() {
				let sessionId = '${ sessionScope.uId }';
				const hNo = '${ hOne.hNo }';
				$.ajax({
					url : "/hReview/list.pet",
					type : "GET",
					dataType: "json",
					data : { 
						hNo : hNo, 
						currentPage: currentPage, 
						recordCountPerPage: recordCountPerPage 
					}, // 현재 페이지와 페이지당 후기 수 전달
					success : function(data) {
						const tableBody = $("#review-table tbody");
						tableBody.html('');
						let tr;
						let left;
						let center;
						let right;
						
						const hRList = data.hRList; // 후기 리스트 
				        totalPages = data.totalPages; // 총 페이지 수
						
						if(hRList.length > 0) {
							for(let i in hRList) {
								tr = $("<tr>"); // <tr></tr>
								if(hRList[i].hRProfileImg == null){ // ********************** 프로필 이미지 추후 수정 필요 ******************
// 									left = $("<td class='td'>").html("<div style='width: 50px; height: 50px; background-color: #FFD370; border-radius: 100%;'></div>"); 
									left = $("<td class='td'>").html("<img src='../resources/userUploadFiles/profile.png' width='50px' height='50px' style='border-radius: 100%; border: 2px solid #FFD370;'>");
								} else {
// 									left = $("<td class='td'>").html("<div style='width: 50px; height: 50px; background-img: url(" + hRList[i].hRProfileImg + "); border-radius: 100%;'></div>");
									left = $("<td class='td'>").html("<img src='" + hRList[i].hRProfileImg + "' width='50px' height='50px' style='border-radius: 100%; border: 2px solid #FFD370;'>");
								}
// 								center = $("<td class='td'>").html(
// 										"<div class='user-info-div'><span class='user-nickname'>"+hRList[i].hRNickName+"</span><span class='review-create-date'>"
// 										+ ""+getFormattedDate(hRList[i].hRCreate)+"</span></div><div class='review-content'>"+hRList[i].hRContent+"</div>"); 
								if(hRList[i].hRCreate === hRList[i].hRUpdate) {
									center = $("<td class='td'>").html(
											"<div class='user-info-div'><span class='user-nickname'>"+hRList[i].hRNickName+"</span><span class='review-create-date'>"
											+ ""+getFormattedDate(hRList[i].hRCreate)+"</span></div><div class='review-content'>"+hRList[i].hRContent+"</div>"); 
								} else {
									center = $("<td class='td'>").html(
											"<div class='user-info-div'><span class='user-nickname'>"+hRList[i].hRNickName+"</span><span class='review-create-date'>"
											+ ""+getFormattedDate(hRList[i].hRUpdate)+"&nbsp;(수정됨)</span></div><div class='review-content'>"+hRList[i].hRContent+"</div>");
								}
										
								if(sessionId === hRList[i].uId || sessionId === 'admin') {
									right = $("<td class='td'>").html(
											"<a href='javascript:void(0)' class='review-modify-btn' data-bs-toggle='modal' data-bs-target='#modifyModal' "
											+ "onclick='openModifyView("+hRList[i].hRNo+",\""+hRList[i].hRNickName+"\",\""+hRList[i].hRContent+"\",\"" + hRList[i].hRProfileImg + "\");'>수정</a>"
											+ "<a href='javascript:void(0)' class='review-delete-btn' onclick='checkDeleteReview("+hRList[i].hRNo+");'>삭제</a>"); 
								} else {
									right = $("<td class='td'>").html("");
								}
								
								tr.append(left);
								tr.append(center);
								tr.append(right); 
								tableBody.append(tr); 
								
								// 결과를 받은 후에 페이징을 업데이트
					            createPagination(data.totalPages);
							}
						} else {
							tr = $("<tr class='td'><td class='td'colspan='3'><div style='color: lightgray;'>등록된 후기가 없습니다.</div></td></tr>");
							tableBody.append(tr);
						}
					},
					error : function() {
						alert("동물병원 후기 리스트 호출 오류. 관리자에게 문의 바랍니다.");
					}
				});
			}
			
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
			    getReviewList(currentPage);
			}
			
			// 그룹 변경 시 호출되는 함수
			const changeGroup = (newGroup) => {
			    currentPage = (newGroup - 1) * naviCountPerPage + 1;
			    getReviewList(currentPage);
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
				getReviewList();
				// setInterval(getReviewList, 1000); // 1초 단위로 getReviewList가 호출되어 후기 실시간 조회
			})
		</script>
		<script>
			function goBacktoList() {
				window.history.back();
			}
		</script>
    </body>
</html>