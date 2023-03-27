<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Tourmate</title>

    <link rel="stylesheet" href="../assets/css/main.css" />

    <link rel="stylesheet" href="../assets/css/login.css" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
      crossorigin="anonymous"
    />
    <script src="../assets/js/login.js"></script>
  </head>
  <body>
    <div class="allContainer">
      <!-- nav start -->
      <nav
        class="navbar navbar-expand-lg nav-bg fw-bold"
        style="position: relative; background-color: #d8d8d8"
      >
        <div class="container">
          <a class="navbar-brand link-light fw-bold fs-2" href="<%=request.getContextPath() %>/index.jsp"
            ><img src="../assets/img/logo.png" style="width: 120px; height: 40px" alt="logo"
          /></a>
        </div>
      </nav>
      <!-- NavBar end -->
      <!-- main start -->
      <div
        class="bgContainer"
        style="background: url(../assets/img/originBG.png); background-size: cover; height: 100%"
      >
        <main class="main-container">
          <div class="login-page">
            <form class="form" action="<%=request.getContextPath() %>/user" method="post">
              <div class="roof">로그인</div>
              <input type="text" placeholder="ID" id="id" name="userId" onchange="idConfirm()" />
              <input type="password" placeholder="password" name="userPw" id="password" />
              <div class="message"></div>
              <button class="login-btn" onclick="tryLogin()">로그인</button> 
              <input type="hidden" name="action" value="login" />
              <div class="sub-btn-container">
                <div class="sub-btn"><a href="register.html">회원가입</a></div>
                <div class="sub-btn"><a href="findPwd.html">비밀번호 찾기</a></div>
              </div>
            </form>
          </div>
        </main>
      </div>
      <!-- main end -->
      <!-- footer start -->
      <div class="container">
        <ul class="footer mb-2 mt-4" style="display: flex; padding: 0">
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
  </body>
</html>
