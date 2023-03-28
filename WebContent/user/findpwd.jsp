<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <%@ include file="/include/head.jsp" %>
    <link rel="stylesheet" href="../assets/css/main.css" />

    <link rel="stylesheet" href="../assets/css/login.css" />

    <script src="../assets/js/login.js"></script>
  </head>
  <body>
    <div class="allContainer">
      <%@ include file="/include/nav.jsp" %>
      <!-- NavBar end -->
      <!-- main start -->
      <div
        class="bgContainer"
        style="background: url(../assets/img/originBG.png); background-size: cover; height: 100%"
      >
        <main class="main-container">
          <div class="login-page">
            <form class="form" action="${root }/user" method="POST">
              <div class="roof">비밀번호 찾기</div>
              <input type="text" placeholder="이름" id="name" name="userName" />
              <input type="text" placeholder="ID" id="id" name="userId" />
              <input type="text" placeholder="휴대폰번호" id="phone" name="userPhone" />
              <div class="message"></div>
              <button class="login-btn" onclick="searchPw()">다음</button>
              <input type="hidden" name="action" value="findpw">
              <div class="sub-btn-container" style="display: flex; justify-content: flex-end">
                <div class="sub-btn">
                  <a href="login.html">로그인 하기</a>
                </div>
              </div>
            </form>
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
