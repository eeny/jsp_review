<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %><!-- session을 사용하겠다 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- session은 request, response 처럼 기본적으로 내장되어있다! -->
	<% session.setAttribute("id", "idid"); %>
	<!-- 이런식으로 속성을 설정할 수도 있다! - 로그인이 됐다면~ -->
	<% session.getAttribute("id"); %>
	<!-- 값을 가져올 수도 있다 - 로그인 정보를 확인할 때~ -->
	<% session.invalidate(); %>
	<!-- session 삭제(특정 session만 지울 수는 없다!) - 로그아웃할 때~ -->
</body>
</html>