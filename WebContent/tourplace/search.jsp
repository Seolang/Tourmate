<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Tourmate</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
      crossorigin="anonymous"
    />
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
      <nav
        class="navbar navbar-expand-lg nav-bg fw-bold"
        style="position: relative; background-color: #d8d8d8"
      >
        <div class="container">
          <!-- </div> -->
          <a class="navbar-brand link-light fw-bold fs-2" href="main.html"
            ><img src="./assets/img/logo.png" style="width: 120px; height: 40px" alt="logo"
          /></a>
          <button
            class="navbar-toggler justify-content-end"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
            <span class="navbar-toggler-icon"></span>
          </button>
          <!-- 로그인 전 -->
          <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
            <ul class="navbar-nav mb-2 mb-lg-0" id="before-login">
              <li class="nav-item">
                <a class="nav-link active link-dark fw-bold" href="login.html">로그인</a>
              </li>
              <li class="nav-item">
                <a class="nav-link active link-dark fw-bold" href="register.html">회원가입</a>
              </li>
            </ul>
          </div>
          <!-- 로그인 후 -->
          <ul class="navbar-nav mb-2 mb-lg-0" id="after-login" style="display: none">
            <li class="nav-item">
              <a class="nav-link active link-dark fw-bold" href="#" onclick="setLogout()"
                >로그아웃</a
              >
            </li>
            <li class="nav-item">
              <a class="nav-link active link-dark fw-bold" href="myPage.html">마이페이지</a>
            </li>
          </ul>
        </div>
      </nav>
      <div class="bgContainer">
        <div style="width: 80%">
          <!-- 관광지 검색 start -->
          <div class="searchBar">
            <div class="col-md-9">
              <div class="alert alert-primary mt-3 text-center fw-bold fs-4" role="alert">
                전국 관광지 검색
              </div>
              <form class="d-flex my-3" onsubmit="return false;" role="search">
                <select id="search-area" class="form-select me-2" style="height: 60px">
                  <option value="0" selected>검색 할 지역 선택</option>
                </select>
                <select id="search-content-id" class="form-select me-2" style="height: 60px">
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
                />
                <button
                  id="btn-search"
                  class="btn btn-light btn-lg"
                  type="button"
                  onclick="search()"
                  style="width: 30%; height: 60px"
                >
                  검색
                </button>
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
          <div class="row mt-5 text-center fw-bold fs-1"><div id="tour-list-head"></div></div>
          <div class="row" id="tour-list-grid"></div>
        </div>
        <!-- main-second end -->
      </div>
      <!-- footer start -->
      <div class="container">
        <ul class="footer mb-2" style="display: flex; padding: 0">
          <li class="footer ms-3 me-3 mb-3">
            <a class="link-dark fw-bold footerA" href="#">&copy SSAFY</a>
          </li>
          <li class="footer ms-3 me-3 mb-2">
            <a class="active link-dark fw-bold footerA" href="#">이용약관</a>
            <a class="link-dark" style="margin-left: 20px">|</a>
          </li>
          <li class="footer ms-3 me-3 mb-2">
            <a class="link-dark fw-bold footerA" href="#">개인정보처리방침</a>
          </li>
        </ul>
      </div>
      <!-- footer end -->
    </div>

    <script>
      window.onload = () => {
        checkLogin();
        let areaUrl =
          "https://apis.data.go.kr/B551011/KorService1/areaCode1?serviceKey=" +
          serviceKey +
          "&numOfRows=20&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=json";

        fetch(areaUrl, { method: "GET" })
          .then((response) => response.json())
          .then((data) => makeOption(data))
          .then(() => {
            let localArea = localStorage.getItem("localArea");
            console.log(localArea);
            if (localArea) {
              localStorage.removeItem("localArea");
              let areaCode = document.getElementById("search-area");
              let contentTypeId = document.getElementById("search-content-id");
              let keyword = document.getElementById("search-keyword");

              areaCode.value = 3;
              keyword.value = localArea;
              search();
            }
          });
      };

      function makeOption(data) {
        console.log(data);
        let areas = data.response.body.items.item;
        let sel = document.getElementById("search-area");
        areas.forEach((area) => {
          let opt = document.createElement("option");
          opt.setAttribute("value", area.code);
          opt.appendChild(document.createTextNode(area.name));

          sel.appendChild(opt);
        });
      }

      // 검색 버튼을 누르면..
      // 지역, 유형, 검색어 얻기.
      // 위 데이터를 가지고 공공데이터에 요청.
      // 받은 데이터를 이용하여 화면 구성.
      const search = () => {
        let searchUrl = `https://apis.data.go.kr/B551011/KorService1/searchKeyword1?serviceKey=${serviceKey}&numOfRows=100&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=json&listYN=Y&arrange=A`;

        let areaCode = document.getElementById("search-area").value;
        let contentTypeId = document.getElementById("search-content-id").value;
        let keyword = document.getElementById("search-keyword").value;

        if (parseInt(areaCode)) searchUrl += `&areaCode=${areaCode}`;
        if (parseInt(contentTypeId)) searchUrl += `&contentTypeId=${contentTypeId}`;
        if (!keyword) {
          alert("검색어 입력 필수!!!");
          return;
        } else searchUrl += `&keyword=${keyword}`;

        fetch(searchUrl)
          .then((response) => response.json())
          .then((data) => makeList(data));
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
