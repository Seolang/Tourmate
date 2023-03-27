<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Tourmate</title>
    <link rel="stylesheet" href="assets/css/main.css" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
      crossorigin="anonymous"
    />
  </head>
  <body>
    <div class="allContainer">
      <!-- header start -->
      <!-- NavBar start-->
      <nav
        class="navbar navbar-expand-lg nav-bg fw-bold"
        style="position: relative; background-color: #d8d8d8"
      >
        <div class="container">
          <!-- </div> -->
          <a class="navbar-brand link-light fw-bold fs-2" href="main.html">
            <img src="./assets/img/logo.png" style="width: 120px; height: 40px" alt="logo"
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
                <a class="nav-link active link-dark" href="/user/login.jsp">로그인</a>
              </li>
              <li class="nav-item">
                <a class="nav-link active link-dark" href="/user/regist.jsp">회원가입</a>
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
              <a class="nav-link active link-dark fw-bold" href="#">마이페이지</a>
            </li>
          </ul>
        </div>
      </nav>
      <!-- NavBar end -->
      <!-- header end -->
      <!-- main start -->
      <!-- main-first start -->
      <div class="bgContainer">
        <div class="mb-4">
          <h1 style="color: #dfdfdf">Tourmate와 함께 원하는 관광지를 찾아보세요!</h1>
        </div>
        <a href="search.html"
          ><button type="button" class="btn btn-lg btn-success p-2">관광지 검색하러가기</button></a
        >
      </div>
      <!-- main-first end -->
      <!-- main-second start -->
      <div class="container">
        <div class="row mt-5 text-center fw-bold fs-1"><div>Season Recommend</div></div>
        <div class="row" id="tour-list-grid">
          <div class="col-lg-4 col-md-6 col-sm-12">
            <div class="card mt-5 mb-5 ms-2 me-2 p-2 text-center">
              <img src="./assets/img/sungsimdang.jpg" class="card-img-top" alt="..." />
              <div class="card-body p-3">
                <h5 class="card-title">성심당</h5>
                <p class="card-text">대전광역시 중구 대종로480번길 15</p>
                <a href="search.html" class="btn btn-primary" onclick="setLocalStorage(`성심당`)"
                  >상세보기</a
                >
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 col-sm-12">
            <div class="card mt-5 mb-5 ms-2 me-2 p-2 text-center">
              <img
                src="http://tong.visitkorea.or.kr/cms/resource/70/2661770_image2_1.jpg"
                class="card-img-top"
                alt="..."
              />
              <div class="card-body p-3">
                <h5 class="card-title">한밭수목원</h5>
                <p class="card-text">대전광역시 서구 둔산대로 169</p>
                <a
                  href="search.html"
                  class="btn btn-primary"
                  onclick="setLocalStorage(`한밭수목원`)"
                  >상세보기</a
                >
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 col-sm-12">
            <div class="card mt-5 mb-5 ms-2 me-2 p-2 text-center">
              <img
                src="http://tong.visitkorea.or.kr/cms/resource/05/2794105_image2_1.jpg"
                class="card-img-top"
                alt="..."
              />
              <div class="card-body p-3">
                <h5 class="card-title">대전 엑스포 아쿠아리움</h5>
                <p class="card-text">대전광역시 유성구 엑스포로 1</p>
                <a
                  href="search.html"
                  class="btn btn-primary"
                  onclick="setLocalStorage(`대전 엑스포 아쿠아리움`)"
                  >상세보기</a
                >
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- main-second end -->
      <!-- main end -->
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
      <script src="./assets/js/main.js" type="text/javascript"></script>
      <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"
      ></script>
    </div>
  </body>
</html>
