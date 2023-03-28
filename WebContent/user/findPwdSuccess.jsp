<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/include/head.jsp" %>
    <link rel="stylesheet" href="../assets/css/main.css" />

    <link rel="stylesheet" href="../assets/css/login.css" />

    <script src="../assets/js/login.js"></script>
</head>
<body>
	<script type="text/javascript">
		alert("${requestScope.userPwInfo.username}님의 비밀번호는 ${requestScope.userPwInfo.pw}입니다.");
		location.href = "${root}/user?action=login";
	</script>
</body>
</html>