<%@page import="com.company.CookieUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- <%
		String key = request.getParameter("key");
		String val = request.getParameter("val");
		Cookie cookie = new Cookie(key, val);
		response.addCookie(cookie);
		out.println("입력완료");
	%> --%>
	<!-- CookieUtil.java로 메서드화시켰다 -->
	
	<%
		String key = request.getParameter("key");
		String val = request.getParameter("val");
		out.println(CookieUtil.insertCookie(key, val, response));
	%>
	입력완료
	<a href="Ex6.jsp">돌아가기</a>
</body>
</html>