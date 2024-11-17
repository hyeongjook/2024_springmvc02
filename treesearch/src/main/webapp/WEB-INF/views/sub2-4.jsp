<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공원 이야기</title>
<link rel="icon" type="image/x-icon" href="resources/images/favicon.png">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
	integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<link rel="stylesheet" href="resources/css/common.css" />
<link rel="stylesheet" href="resources/css/sub2-4.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="resources/js/menu.js"></script>
</head>
<body>
	<div id="sub_main_container">
		<main>
			<div id="sub_container">
				<ul class="contents_box">
					<li class="textcenter">
						<h2 class="great_title">가로수길 수목조회</h2>
						<p class="subheading_title">원하는 수목이 있는 가로수길을 찾아보세요</p>

						<div class="categories">
							<ul>
								<li>
									<figure class="category_icon">
										<img src="/resources/images/garosu_category_icon01.png"
											alt="벚나무">
									</figure> <span class="category"> <a
										href="/treesearch?category=벚나무">벚나무</a>
								</span>
								</li>
								<li>
									<figure class="category_icon">
										<img src="/resources/images/garosu_category_icon02.png"
											alt="은행나무">
									</figure> <span class="category"> <a
										href="/treesearch?category=은행나무">은행나무</a>
								</span>
								</li>
								<li>
									<figure class="category_icon">
										<img src="/resources/images/garosu_category_icon03.png"
											alt="단풍나무">
									</figure> <span class="category"> <a
										href="/treesearch?category=단풍나무">단풍나무</a>
								</span>
								</li>
								<li>
									<figure class="category_icon">
										<img src="/resources/images/garosu_category_icon04.png"
											alt="자작나무">
									</figure> <span class="category"> <a
										href="/treesearch?category=자작나무">자작나무</a>
								</span>
								</li>
								<li>
									<figure class="category_icon">
										<img src="/resources/images/garosu_category_icon05.png"
											alt="메타세콰이어">
									</figure> <span class="category"> <a
										href="/treesearch?category=메타">메타세콰이어</a>
								</span>
								</li>
							</ul>
						</div> <!-- 지도 -->
						<div id="map" style="width: 100%; height: 400px;"></div> <!-- 가나다순 공원 목록 (초기 4개) -->
						<section class="contents2">
							<ul class="region_scroll_ul total_search_mg" id="roadList">
								<!-- 초기 4개 공원이 나오는 곳 -->
								<li class="region_list">
									<ul class="scroll_list_ul">
										<c:forEach var="tree" items="${trees}">
											<li class="region_list">
														<ul class="scroll_list">

															<li class="category"><span> 
											<c:choose>
    <c:when test="${not empty tree.r_ce_ad and fn:substring(tree.r_ce_ad, 0, 2) == '경기'}">경기도</c:when>
    <c:when test="${not empty tree.r_ce_ad and fn:substring(tree.r_ce_ad, 0, 2) == '광주'}">전라도</c:when>
    <c:when test="${not empty tree.r_ce_ad and fn:substring(tree.r_ce_ad, 0, 2) == '서울'}">서울</c:when>
    <c:when test="${not empty tree.r_ce_ad and fn:substring(tree.r_ce_ad, 0, 2) == '부산'}">부산</c:when>
    <c:when test="${not empty tree.r_ce_ad and fn:substring(tree.r_ce_ad, 0, 2) == '강원'}">강원도</c:when>
    <c:when test="${not empty tree.r_ce_ad and fn:substring(tree.r_ce_ad, 0, 2) == '대전'}">대전</c:when>
    <c:when test="${not empty tree.r_ce_ad and fn:substring(tree.r_ce_ad, 0, 2) == '제주'}">제주도</c:when>
    <c:when test="${not empty tree.r_ce_ad and fn:substring(tree.r_ce_ad, 0, 2) == '충청'}">충청도</c:when>
    <c:when test="${not empty tree.r_ce_ad and fn:substring(tree.r_ce_ad, 0, 2) == '인천'}">인천</c:when>
    <c:when test="${not empty tree.r_ce_ad and fn:substring(tree.r_ce_ad, 0, 2) == '전북'}">전라도</c:when>
    <c:when test="${not empty tree.r_ce_ad and fn:substring(tree.r_ce_ad, 0, 2) == '울산'}">울산</c:when>
    <c:when test="${not empty tree.r_ce_ad and fn:substring(tree.r_ce_ad, 0, 2) == '경상'}">경상도</c:when>
    <c:when test="${not empty tree.r_ce_ad and fn:substring(tree.r_ce_ad, 0, 2) == '대구'}">대구</c:when>
</c:choose>
															</span></li>
															<li class="content">
																<h4>${tree.r_na}</h4>
																<p class="text">${tree.r_sto}</p>
																<p class="address">${tree.r_rsec}</p>
															</li>
														</ul>
											</li>
										</c:forEach>
									</ul>
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
		</main>
	</div>

	<!-- 카카오 맵 API -->
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bf89de22bd35e32edd59edcd3baf74da"></script>
	<script>
		var mapContainer = document.getElementById('map'), mapOption = {
			center : new kakao.maps.LatLng(37.5665, 126.9780), // 서울시청 좌표
			level : 4
		};
		var map = new kakao.maps.Map(mapContainer, mapOption);
		
		// 공원 목록 업데이트 함수
		function updateRoadList(trees) {
			var roadListContainer = $('#roadList'); // 변수명 수정
			roadListContainer.empty();

			var treesToShow = trees.slice(0, 4);

			treesToShow.forEach(function(tree) {
				var listItem = '<li><ul class="scroll_list"><li class="category"><span>지역</span></li>'
					+ '<li class="content"><h4>'
					+ tree.r_na
					+ '</h4><p>'
					+ tree.r_sto
					+ '</p><p>'
					+ tree.r_rsec + '</p></li></ul></li>';
				roadListContainer.append(listItem);
			});
		}

		// 지도에 핀을 찍는 함수
		function updateMapWithPins(trees) {
			var markers = [];
			trees.forEach(function(tree) {
				var position = new kakao.maps.LatLng(tree.latitude, tree.longitude);
				var marker = new kakao.maps.Marker({ position: position });
				markers.push(marker);
				marker.setMap(map);
			});
		}
	</script>
</body>
</html>