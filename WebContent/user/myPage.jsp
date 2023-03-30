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
	  <%@include file="/include/nav.jsp" %>
      <!-- NavBar end -->
      <!-- main start -->
      <div
        class="bgContainer"
        style="background: url(../assets/img/originBG.png); background-size: cover; height: 800px;"
      >
        <main class="main-container" >
          <div class="login-page">
            <form class="form" action="<%=request.getContextPath() %>/user" method="post">
              <div class="roof">비밀번호 변경</div>
              <input type="text" placeholder="아이디 입력" id="id" name="userId" />
              <input type="password" placeholder="기존 비밀번호 확인" id="pwd" name="nowPw" />
              <input type="password" placeholder="변경할 비밀번호 입력" id="changepwd" name="changePw" />
              <input type="password" placeholder="변경할 비밀번호 확인" id="checkpwd" name="changePwCheck" />
              <div class="message"></div>
              <button class="regist-btn" onclick="checkRegist()">정보 수정</button>
              <input type="hidden" name="action" value="modify" />
              <div class="sub-btn-container">
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
