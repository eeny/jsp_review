<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션을 이용해 자동로그아웃 만들기 - 로그아웃</title>
</head>
<body>
	<%
		session.invalidate();
		response.sendRedirect("jspPractice3.jsp");
	%>
</body>
</html>