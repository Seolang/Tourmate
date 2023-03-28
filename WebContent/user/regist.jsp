<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <%@ include file="/include/head.jsp" %>
    <link rel="stylesheet" href="../assets/css/main.css" />

    <link rel="stylesheet" href="../assets/css/login.css" />

    <script src="../assets/js/register.js"></script>
  </head>
  <body>
    <div class="allContainer">
      <!-- nav start -->
<!--       <nav -->
<!--         class="navbar navbar-expand-lg nav-bg fw-bold" -->
<!--         style="position: relative; background-color: #d8d8d8" -->
<!--       > -->
<!--         <div class="container"> -->
<%--           <a class="navbar-brand link-light fw-bold fs-2" href="<%=request.getContextPath() %>/index.jsp" --%>
<!--             ><img src="../assets/img/logo.png" style="width: 120px; height: 40px" alt="logo" -->
<!--           /></a> -->
<!--         </div> -->
<!--       </nav> -->
	<%@include file="/include/nav.jsp" %>
      <!-- NavBar end -->
      <!-- main start -->
      <div
        class="bgContainer"
        style="background: url(../assets/img/originBG.png); background-size: cover; height: 100%"
      >
        <main class="main-container" style="padding-bottom: 0px">
          <div class="login-page" style="padding: 70px 0px 0px">
            <form class="form" action="<%=request.getContextPath() %>/user" method="post">
              <div class="roof">회원가입</div>
              <input type="text" placeholder="사용하실 ID를 입력해주세요" id="id" name="userId" />
              <input type="password" placeholder="사용하실 비밀번호를 입력해주세요" id="pwd" name="userPw" />
              <input type="password" placeholder="비밀번호 확인" id="pwdConfirm" />
              <input type="text" placeholder="이름" id="name" name="userName" />
              <input type="tel" placeholder="휴대폰 번호" id="tel" name="userPhone"/>
              <div class="message"></div>
              <button class="regist-btn" onclick="checkRegist()">회원 등록</button>
              <input type="hidden" name="action" value="register" />
              <div class="sub-btn-container">
                이미 회원이신가요? <a href="login.html">로그인 하기</a>
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
