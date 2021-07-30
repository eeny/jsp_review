<%@page import="com.company.CookieUtil"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String key = request.getParameter("key");
	
		// idid - 키를 넣으면 값을 가져오는 메서드
		out.print(CookieUtil.getCookieValue(key, request));		
		// jsp에서는 기본으로 request를 들고 있다!
		// 하지만 java에는 request가 없다.
		// 그래서 java에서 request를 사용하려면 반드시 매개변수로 전달해야 한다!
	%>
</body>
</html>