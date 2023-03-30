<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
<!-- 	<div class="allContainer"> -->
      <!-- header start -->
      <!-- NavBar start-->

<nav class="navbar navbar-expand-lg nav-bg fw-bold" style="position: relative; background-color: #d8d8d8">
        <div class="container">
          <!-- </div> -->
          <a class="navbar-brand link-light fw-bold fs-2" href="${root }/index.jsp">
            <img src="${root }/assets/img/logo.png" style="width: 120px; height: 40px" alt="logo"
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
	<c:choose>
		<%-- session에 userInfo 객체 없는 경우(로그인 X) --%>
		<c:when test="${empty userInfo}">
			<ul class="navbar-nav mb-2 mb-lg-0" id="before-login">
              <li class="nav-item">
				<a class="nav-link active link-dark" href="${root }/user?action=login">로그인</a>
              </li>
              <li class="nav-item">
              	<a class="nav-link active link-dark" href="${root }/user?action=register">회원가입</a>
              </li>
            </ul>
		</c:when>
		<%-- session에 userInfo 객체 있는 경우(로그인 O) --%>
		<c:otherwise>
			<ul class="navbar-nav mb-2 mb-lg-0" id="after-login">
				<li class="nav-item">
					<a class="nav-link disabled">${userInfo.username}(${userInfo.id })님 반갑습니다.</a>
				</li>
            	<li class="nav-item">
              		<a class="nav-link active link-dark fw-bold" href="${root }/user?action=logout" onclick="setLogout()">로그아웃</a>
            	</li>
           		<li class="nav-item">
              		<a class="nav-link active link-dark fw-bold" href="${root }/user?action=mypage">마이페이지</a>
            	</li>
          	</ul>
		</c:otherwise>
	</c:choose>
	</div>
</nav>