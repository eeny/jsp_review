<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		// 로그아웃 처리 끝
		session.invalidate();
		response.sendRedirect("Ex12.jsp");
	%>
</body>
</html>