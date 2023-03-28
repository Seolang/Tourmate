<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="root" value="${pageContext.request.contextPath}"/>
<html lang="en">
  <head>
    <%@ include file="/include/head.jsp" %>

    <link rel="stylesheet" href="assets/css/main.css" />
    <link rel="stylesheet" href="./assets/css/search.css" />
    <script
      type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1bf9d21ba0c43359bc262d6d369d6e58&libraries=services,clusterer,drawing"
    ></script>
    <script src="./assets/js/main.js"></script>
    <script src="./assets/js/key.js"></script>
  </head>
  <body>
    <div class="allContainer">
      <!-- NavBar start-->
      <%@ include file="/include/nav.jsp" %>
      <div class="bgContainer">
        <div style="width: 80%">
          <!-- 관광지 검색 start -->
          <div class="searchBar">
            <div class="col-md-9">
              <form class="d-flex my-3" id="search-form" action="${root }/tour" method="GET">
              	<input type="hidden" name="action" value="search">
                <select id="search-area" class="form-select me-2" name="areaCode" style="height: 60px">
                  <option value="0" selected>검색 할 지역 선택</option>
                  <c:forEach items="${sidoList }" var="s">
                  	<option value="${s.code }">${s.name }</option>
                  </c:forEach>
                </select>
                <select id="search-content-id" class="form-select me-2" name="contentTypeId" style="height: 60px">
                  <option value="0" selected>관광지 유형</option>
                  <option value="12">관광지</option>
                  <option value="14">문화시설</option>
                  <option value="15">축제공연행사</option>
                  <option value="25">여행코스</option>
                  <option value="28">레포츠</option>
                  <option value="32">숙박</option>
                  <option value="38">쇼핑</option>
                  <option value="39">음식점</option>
                </select>
                <input
                  id="search-keyword"
                  class="form-control me-2"
                  type="search"
                  placeholder="검색어"
                  aria-label="검색어"
                  style="height: 60px"
                  name="keyword"
                />
                <input
                  id="btn-search"
                  type="button"
                  class="btn btn-light btn-lg"
                  style="width: 30%; height: 60px"
                  onclick="javascript:search()"
                  value="검색"
                >
              </form>
            </div>
          </div>
          <!-- 관광지 검색 end -->
          <!-- kakao map start -->
          <div
            id="map"
            class="mt-3"
            style="
              width: 80%;
              height: 400px;
              margin: 0 auto;
              border-radius: 20px;
              visibility: hidden;
            "
          ></div>
          <!-- kakao map end -->
        </div>
      </div>

      <div class="main">
        <!-- main-second start -->
        <div class="tour-list">
          <div class="row mt-5 text-center fw-bold fs-1">
          	<div id="tour-list-head">관광지 검색 결과</div>
          	<c:if test="${empty tourList }">
          		<h1></h1>
          		<h1>검색 결과가 없습니다!!</h1>
          	</c:if>
          </div>
          <div class="row" id="tour-list-grid">
          <c:if test="${not empty tourList }">
          	<c:forEach items="${tourList }" var="t">
	          	<div class="col-lg-4 col-md-6 col-sm-12">
	            <div class="card mt-5 mb-5 ms-2 me-2 p-2 text-center">
	            	<c:if test="${not empty t.imageURL }">
	            		<img src="${t.imageURL }" class="card-img-top" alt="..." />
	            	</c:if>
	            	<c:if test="${empty t.imageURL }">
	            		<img src="${root }/assets/img/noimg.png" class="card-img-top" alt="..." />
	            	</c:if>
	              
	              <div class="card-body p-3">
	                <h5 class="card-title">${t.title}</h5>
	                <p class="card-text">${t.addr1} ${t.addr2}</p>
	                <a href="#" class="btn btn-primary" onclick="moveCenter(${area.mapy}, ${area.mapx});">위치보기</a>
	              </div>
	            </div>
	          </div>
          	</c:forEach>
          </c:if>
          </div>
        </div>
        <!-- main-second end -->
      </div>
      <!-- footer start -->
      <%@ include file="/include/footer.jsp" %>
      <!-- footer end -->
    </div>

    <script>
      window.onload = () => {
		if ('${areaCode}') {
			document.getElementById("search-area").value = '${areaCode}';
		}
		if ('${contentTypeId}') {
			document.getElementById("search-content-id").value = '${contentTypeId}';
		}
		if ("${keyword}") {
			document.getElementById("search-keyword").value = "${keyword}";
		}
		
		if ("${not empty tourList}") {
			
		}
		
      };

      const search = () => {
          let areaCode = document.getElementById("search-area").value;
          let contentTypeId = document.getElementById("search-content-id").value;
          let keyword = document.getElementById("search-keyword").value;

          if (parseInt(areaCode) === 0) {
        	  alert("지역 선택 필수!!!")
        	  return;
          }
          else if (parseInt(contentTypeId) === 0) {
        	  alert("관광지 유형 검색 필수!!!")
        	  return;
          }
          else if (!keyword) {
              alert("검색어 입력 필수!!!");
              return;
          } 
          else document.getElementById("search-form").submit();
      };
        
      var positions; // marker 배열.

      function makeList(data) {
        let trips = data.response.body.items.item;
        let tripList = ``;
        console.log(trips);

        if (!trips) {
          document.getElementById("tour-list-head").innerHTML = "검색 목록이 없습니다";
          document.getElementById("tour-list-grid").innerHTML = "";
          document.getElementById("map").style.visibility = "hidden";
          return;
        }

        positions = [];
        trips.forEach((area) => {
          tripList += `
          <div class="col-lg-4 col-md-6 col-sm-12">
            <div class="card mt-5 mb-5 ms-2 me-2 p-2 text-center">
              <img src="${
                area.firstimage ? area.firstimage : "./assets/img/noimg.png"
              }" class="card-img-top" alt="..." />
              <div class="card-body p-3">
                <h5 class="card-title">${area.title}</h5>
                <p class="card-text">${area.addr1} ${area.addr2}</p>
                <a href="#" class="btn btn-primary" onclick="moveCenter(${area.mapy}, ${
            area.mapx
          });">위치보기</a>
              </div>
            </div>
          </div>`;

          let markerInfo = {
            title: area.title,
            latlng: new kakao.maps.LatLng(area.mapy, area.mapx),
          };
          positions.push(markerInfo);
        });
        displayMarker();
        document.getElementById("tour-list-grid").innerHTML = tripList;
        document.getElementById("tour-list-head").innerHTML = "관광지 검색목록";
      }

      // 카카오지도
      var mapContainer = document.getElementById("map"), // 지도를 표시할 div
        mapOption = {
          center: new kakao.maps.LatLng(37.500613, 127.036431), // 지도의 중심좌표
          level: 3, // 지도의 확대 레벨
        };

      // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
      var map = new kakao.maps.Map(mapContainer, mapOption);

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
            map: map, // 마커를 표시할 지도
            position: positions[i].latlng, // 마커를 표시할 위치
            title: positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
            image: markerImage, // 마커 이미지
          });
        }

        // 첫번째 검색 정보를 이용하여 지도 중심을 이동 시킵니다
        map.setCenter(positions[0].latlng);
      }

      function moveCenter(lat, lng) {
        map.setCenter(new kakao.maps.LatLng(lat, lng));
      }
    </script>
  </body>
</html>
