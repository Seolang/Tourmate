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
      <!-- nav start -->
      <%@ include file="/include/nav.jsp" %>
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
              <button class="login-btn">로그인</button> 
              <input type="hidden" name="action" value="login" />
              <div class="sub-btn-container">
                <div class="sub-btn"><a href="${root }/user?action=register">회원가입</a></div>
                <div class="sub-btn"><a href="${root }/user?action=findpwd">비밀번호 찾기</a></div>
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
