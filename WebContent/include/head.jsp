<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- jstl 사용하기 위한 코드 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 프로젝트의 context 경로를 편하게 사용하기 위한 코드 --%>
<c:set var="root" value="<%=request.getContextPath() %>"/>

<meta charset="UTF-8">
<title>tourmate</title>

<%-- 부트스트랩 사용을 위한 코드 --%>
<!-- CSS only -->
<link
  href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
  rel="stylesheet"
  integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
  crossorigin="anonymous"
/>



<%-- request 객체에 msg가 들어있을 때 해당 내용 알림창 띄우기 --%>
<!-- <script> -->
<%-- // 	<c:if test="${!empty msg}"> --%>
<%-- // 		alert("${msg}"); --%>
<%-- // 	</c:if> --%>
<!-- </script> -->