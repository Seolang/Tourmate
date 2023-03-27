<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Tourmate</title>
    <link rel="stylesheet" href="./assets/css/main.css" />

    <link rel="stylesheet" href="./assets/css/login.css" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
      crossorigin="anonymous"
    />
    <script src="./assets/js/register.js"></script>
  </head>
  <body>
    <div class="allContainer">
      <!-- nav start -->
      <nav
        class="navbar navbar-expand-lg nav-bg fw-bold"
        style="position: relative; background-color: #d8d8d8"
      >
        <div class="container">
          <a class="navbar-brand link-light fw-bold fs-2" href="main.html"
            ><img src="./assets/img/logo.png" style="width: 120px; height: 40px" alt="logo"
          /></a>
        </div>
      </nav>
      <!-- NavBar end -->
      <!-- main start -->
      <div
        class="bgContainer"
        style="background: url(./assets/img/originBG.png); background-size: cover; height: 100%"
      >
        <main class="main-container" style="padding-bottom: 0px">
          <div class="login-page" style="padding: 70px 0px 0px">
            <div class="form">
              <div class="roof">회원가입</div>
              <input type="text" placeholder="사용하실 ID를 입력해주세요" id="id" />
              <input type="password" placeholder="사용하실 비밀번호를 입력해주세요" id="pwd" />
              <input type="password" placeholder="비밀번호 확인" id="pwdConfirm" />
              <input type="text" placeholder="이름" id="name" />
              <input type="tel" placeholder="휴대폰 번호" id="tel" />
              <div class="message"></div>
              <button class="regist-btn" onclick="checkRegist()">회원 등록</button>
              <div class="sub-btn-container">
                이미 회원이신가요? <a href="login.html">로그인 하기</a>
              </div>
            </div>
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
