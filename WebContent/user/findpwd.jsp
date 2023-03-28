<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <%@ include file="/include/head.jsp" %>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
      crossorigin="anonymous"
    />
    <script src="./assets/js/searchPwd.js"></script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
      crossorigin="anonymous"
    ></script>
  </head>
  <body>
    <div class="allContainer">
      <%@ include file="/include/nav.jsp" %>
      <!-- NavBar end -->
      <!-- main start -->
      <div
        class="bgContainer"
        style="background: url(./assets/img/originBG.png); background-size: cover; height: 100%"
      >
        <main class="main-container">
          <div class="login-page">
            <div class="form">
              <div class="roof">비밀번호 찾기</div>
              <input type="text" placeholder="이름" id="name" />
              <input type="text" placeholder="ID" id="id" />
              <input type="text" placeholder="휴대폰번호" id="phone" />
              <div class="message"></div>
              <button class="login-btn" onclick="searchPw()">다음</button>
              <div class="sub-btn-container" style="display: flex; justify-content: flex-end">
                <div class="sub-btn">
                  <a href="login.html">로그인 하기</a>
                </div>
              </div>
            </div>
          </div>
        </main>
      </div>
      <!-- main end -->
      <!-- footer start -->
      <%@ include file="/include/footer.jsp" %>
      <!-- footer end -->
    </div>
  </body>
</html>
