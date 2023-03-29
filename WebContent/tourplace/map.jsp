<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="map" class="mt-3"
	style="width: 80%; height: 400px; margin: 0 auto; border-radius: 20px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1bf9d21ba0c43359bc262d6d369d6e58"></script>
<script>
	var positions; // marker 배열.
	// 카카오지도
	var mapContainer = document.getElementById("map"); // 지도를 표시할 div
	var mapOption = {
		center : new kakao.maps.LatLng(37.500613, 127.036431), // 지도의 중심좌표
		level : 3, // 지도의 확대 레벨
	};
	
	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption);
	let markerInfo;
	
    function makeList() {
    	positions = [];
    	

        <c:forEach items="${tourList}" var="t">
        	markerInfo = {
        			title: "${t.title}",
                    latlng: new kakao.maps.LatLng("${t.latitude}", "${t.longitude}"),
                  };
                  positions.push(markerInfo);
        
        </c:forEach>
        displayMarker();
    }
	

	function displayMarker() {
		// 마커 이미지의 이미지 주소입니다
		document.getElementById("map").style.visibility = "visible";
		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

		for (var i = 0; i < positions.length; i++) {
			// 마커 이미지의 이미지 크기 입니다
			var imageSize = new kakao.maps.Size(24, 35);

			// 마커 이미지를 생성합니다
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				map : map, // 마커를 표시할 지도
				position : positions[i].latlng, // 마커를 표시할 위치
				title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
				image : markerImage, // 마커 이미지
			});
		}

		// 첫번째 검색 정보를 이용하여 지도 중심을 이동 시킵니다
		map.setCenter(positions[0].latlng);
	}

	function moveCenter(lat, lng) {
		map.setCenter(new kakao.maps.LatLng(lat, lng));
		map.setLevel(3);
	}
	
</script>