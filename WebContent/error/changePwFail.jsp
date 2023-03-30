<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		alert("현재 비밀번호가 일치하지 않습니다.");
		location.href = "<%=request.getContextPath() %>/user?action=mypage";
	</script>
</body>
</html>