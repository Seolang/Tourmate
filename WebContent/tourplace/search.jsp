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
				makeList();
			}
	      };
	</script>
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
			<%@ include file="/tourplace/map.jsp" %>
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
	                <a href="#" class="btn btn-primary" onclick="moveCenter(${t.latitude}, ${t.longitude});">위치보기</a>
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
      
     </script>
  </body>
</html>
