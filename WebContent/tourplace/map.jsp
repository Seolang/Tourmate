<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
</style>

<div id="map" class="mt-3"
	style="width: 80%; height: 400px; margin: 0 auto; border-radius: 20px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1bf9d21ba0c43359bc262d6d369d6e58"></script>
<script>
	var positions = []; // marker 배열.
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
	        			image: "${t.imageURL}",
	                    addr1: "${t.addr1}",
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
			
			var content = '<div class="wrap">' + 
            '    <div class="info">' + 
            '        <div class="title">' + 
            positions[i].title + 
            '        </div>' + 
            '        <div class="body">' + 
            '            <div class="img">' +
            '                <img src="'+positions[i].image+'" width="73" height="70">' +
            '           </div>' + 
            '            <div class="desc">' + 
            '                '+positions[i].addr1 +
            '            </div>' + 
            '        </div>' + 
            '    </div>' +    
            '</div>';
			
		    // 마커에 표시할 인포윈도우를 생성합니다 
		    var infowindow = new kakao.maps.InfoWindow({
		    	content: content
		    });

		    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
		    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
		    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
		    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
		    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
		}

		// 첫번째 검색 정보를 이용하여 지도 중심을 이동 시킵니다
		map.setCenter(positions[0].latlng);
	}

	function moveCenter(lat, lng) {
		map.setCenter(new kakao.maps.LatLng(lat, lng));
		map.setLevel(3);
	}
	
	// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
	function makeOverListener(map, marker, infowindow) {
	    return function() {
	        infowindow.open(map, marker);
	    };
	}

	// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
	function makeOutListener(infowindow) {
	    return function() {
	        infowindow.close();
	    };
	}
	
</script>