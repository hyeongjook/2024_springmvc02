<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>다양한 공원 찾기</title>
<!-- css 초기화 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">
<!-- CSS 파일 링크 -->
<link rel="stylesheet" type="text/css" href="/resources/css/common.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/sub1-3.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<!-- fontawesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
<!-- Material icon -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<!-- Kakao Map API SDK -->
<script
	src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=ab07141ee929664c409a80cf396d1118&libraries=services"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
<!-- parkpark.js -->
<script src="/resources/js/parkpark.js"></script>




<script type="text/javascript">
    
//카테고리 클릭 시 공원 목록을 로드하는 함수
function loadParks(category) {
    $.get("/parks", { category: category }, function(data) {
        // 서버에서 받은 공원 리스트 데이터를 updateParkList로 전달
        if (data && data.parks) {
            updateParkList(data.parks);
        } else {
            console.error("데이터를 받지 못했습니다.");
        }
    });
}

// 공원 리스트를 화면에 동적으로 표시하는 함수
function updateParkList(parks) {
    var parkListContainer = $(".scroll_list_ul");
    parkListContainer.empty();  // 기존 목록을 비운다.

    if (parks.length > 0) {
        parks.forEach(function(park) {
            var parkHtml = `
                <li>
                    <ul class="scroll_list">
                        <li class="category">
                            <span>${park.p_ty}</span> <!-- 공원 카테고리 -->
                        </li>
                        <li class="content">
                            <h4>${park.p_na}</h4> <!-- 공원 이름 -->
                            <p class="text">${park.p_ce_na}</p> <!-- 공원 구분 -->
                            <p class="address">${park.p_ad}</p> <!-- 공원 주소 -->
                        </li>
                    </ul>
                </li>
            `;
            parkListContainer.append(parkHtml);
        });

        // 공원 목록을 지도에 마커로 추가
        addMarkers(parks);
    } else {
        parkListContainer.append("<p>검색된 공원이 없습니다.</p>");
    }
}

// 카카오맵 지도에 마커를 표시하는 함수
function addMarkers(parks) {
    var bounds = new kakao.maps.LatLngBounds(); // 마커들이 들어갈 경계 객체 생성
    
    parks.forEach(function(park) {
        var position = new kakao.maps.LatLng(park.p_lat, park.p_lon); // 공원의 위도, 경도
        var marker = new kakao.maps.Marker({
            position: position,
            title: park.p_na // 마커의 제목
        });
        marker.setMap(map); // 지도에 마커 표시
        
        // 마커가 추가될 때마다 경계 객체에 마커의 위치를 포함시킨다.
        bounds.extend(position);
    });

    // 모든 마커가 지도에 표시된 후, 지도에 경계 값을 설정하여 모든 마커가 보이도록 한다.
    map.setBounds(bounds);
}

// 페이지 로드 시 기본 카테고리 '어린이공원'을 로드
$(document).ready(function() {
    // 카카오맵 지도 생성
    var mapContainer = document.getElementById('map'),
        mapOption = {
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

    map = new kakao.maps.Map(mapContainer, mapOption); // 지도 생성
    loadParks('어린이공원'); // '어린이공원' 카테고리의 공원 목록을 로드
});
</script>



</head>

<body>
	<div class="sub1-3">
		<div class="header"></div>
		<div id="sub_container">
			<ul class="contents_box">
				<li class="textcenter">
					<h2 class="great_title">다양한 공원 찾기</h2>
					<p class="subheading_title">특별한 공원, 특별한 경험</p>


					<div class="categories">
						<ul>
							<li>
								<figure class="category_icon">
									<img src="resources/images/category_icon01.png" alt="어린이공원">
								</figure> <span class="category"> <a href="/parks?category=어린이공원">어린이공원</a>
							</span>
							</li>
							<li>
								<figure class="category_icon">
									<img src="resources/images/category_icon02.png" alt="수변공원">
								</figure> <span class="category"> <a href="/parks?category=수변공원">수변공원</a>
							</span>
							</li>
							<li>
								<figure class="category_icon">
									<img src="resources/images/category_icon03.png" alt="근린공원">
								</figure> <span class="category"> <a href="/parks?category=근린공원">근린공원</a>
							</span>
							</li>
							<li>
								<figure class="category_icon">
									<img src="resources/images/category_icon04.png" alt="체육공원">
								</figure> <span class="category"> <a href="/parks?category=체육공원">체육공원</a>
							</span>
							</li>
							<li>
								<figure class="category_icon">
									<img src="resources/images/category_icon05.png" alt="문화공원">
								</figure> <span class="category"> <a href="/parks?category=문화공원">문화공원</a>
							</span>
							</li>
						</ul>
					</div>




					<section class="contents2">
						<ul class="region_scroll_ul total_search_mg">
							<li class="region_list">
								<ul class="scroll_list_ul">
									<!-- 공원 목록이 동적으로 출력됩니다 -->
									<c:forEach var="park" items="${parks}">
										<li>
											<ul class="scroll_list">


													<li class="category"><span>${park.shortPAd}</span> <!-- 공원의 주소에서 앞 2글자만 출력 -->
													</li>

												<li class="content">
													<h4>${park.p_na}</h4> <!-- 공원 이름 -->
													<p class="text">${park.p_ty}</p> <!-- 공원 구분 -->
													<p class="address">${park.p_ad}</p> <!-- 공원 주소 -->
												</li>
											</ul>
										</li>
									</c:forEach>
								</ul>
							</li>
							<li class="region_map">
								<div id="map" style="width: 100%; height: 500px;"></div>
							</li>
						</ul>
					</section>
				</li>
			</ul>
			<div>
				<ul class="paging_num_ul">
					<li class="material-icons prev">keyboard_double_arrow_left</li>
					<li class="material-icons prev">chevron_left</li>
					<li class="active">1</li>
					<li>2</li>
					<li>3</li>
					<li>4</li>
					<li>5</li>
					<li class="material-icons next">chevron_right</li>
					<li class="material-icons next">keyboard_double_arrow_right</li>
				</ul>
			</div>
		</div>

		<footer>
			<h1>common-footer</h1>
		</footer>
	</div>
</body>
</html>