<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>p235 세션정보 예제</title>
</head>
<body>
	<%
		Date time = new Date();
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	%>
	세션ID : <%= session.getId() %><br>
	<%
		time.setTime(session.getCreationTime());
	%>
	세션 생성시간 : <%= fmt.format(time) %><br>
	<%
		time.setTime(session.getLastAccessedTime());
	%>
	최근 접근시간 : <%= fmt.format(time) %>
</body>
</html>