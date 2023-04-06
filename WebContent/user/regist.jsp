<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <%@ include file="/include/head.jsp" %>
    <link rel="stylesheet" href="../assets/css/main.css" />

    <link rel="stylesheet" href="../assets/css/login.css" />
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
        <main class="main-container" style="padding-bottom: 0px">
          <div class="login-page">
            <form class="form" id="regist-form" action="<%=request.getContextPath() %>/user" method="post">
              <div class="roof">회원가입</div>
              <input type="text" placeholder="사용하실 ID를 입력해주세요" id="id" name="userId" />
              <input type="password" placeholder="사용하실 비밀번호를 입력해주세요" id="pwd" name="userPw" />
              <input type="password" placeholder="비밀번호 확인" id="pwdConfirm" />
              <input type="text" placeholder="이름" id="name" name="userName" />
              <input type="tel" placeholder="휴대폰 번호" id="tel" name="userPhone"/>
              <div class="message"></div>
              <button class="regist-btn" type="button" onclick="checkRegist()">회원 등록</button>
              <input type="hidden" name="action" value="register" />
              <div class="sub-btn-container">
                이미 회원이신가요? <a href="${root }/user?action=login">로그인 하기</a>
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
    <script>
	    const checkRegist = () => {
	    	  let id = document.querySelector("#id").value;
	    	  let pwd = document.querySelector("#pwd").value;
	    	  let pwdConfirm = document.querySelector("#pwdConfirm").value;
	    	  let name = document.querySelector("#name").value;
	    	  let tel = document.querySelector("#tel").value;
	    	  let msg = document.querySelector(".message");
	
	    	  if (id.length === 0) {
	    	    msg.innerHTML = "ID를 입력해주세요";
	    	  } else if (id.length < 4) {
	    	    msg.innerHTML = "ID 길이가 너무 짧습니다";
	    	  } else if (pwd.length === 0) {
	    	    msg.innerHTML = "비밀번호를 입력해 주세요";
	    	  } else if (pwd !== pwdConfirm) {
	    	    msg.innerHTML = "비밀번호를 다시 확인해 주세요";
	    	  } else if (name.length === 0) {
	    	    msg.innerHTML = "이름을 입력해 주세요";
	    	  } else if (tel.length === 0) {
	    	    msg.innerHTML = "휴대폰번호를 입력해 주세요";
	    	  } else if (isNaN(tel) || tel.length !== 11) {
	    	    msg.innerHTML = "휴대폰번호를 정확히 입력해 주세요";
	    	  } else {
	    	    msg.innerHTML = "";
	    	    document.querySelector("#regist-form").submit();
	    	  }
	    	};
    </script>
  </body>
</html>
