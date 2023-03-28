<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>

<html lang="en">
  <head>
	<%@ include file="/include/head.jsp" %>
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
      <%@ include file="/include/nav.jsp" %>
      <!-- NavBar end -->
      <!-- header end -->
      <!-- main start -->
      <!-- main-first start -->
      <div class="bgContainer">
        <div class="mb-4">
          <h1 style="color: #dfdfdf">Tourmate와 함께 원하는 관광지를 찾아보세요!</h1>
        </div>
        <a href="${root }/tour?action=search"
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
	  <%@ include file="/include/footer.jsp" %>
      <!-- footer end -->
      
    </div>
    <script src="./assets/js/main.js" type="text/javascript"></script>
  </body>
</html>
