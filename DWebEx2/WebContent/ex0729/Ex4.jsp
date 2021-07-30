<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>p209 쿠키 읽어오기 예제</title>
</head>
<body>
	쿠키 목록<br>
	<%
		// 모든 쿠키가 다 들어있다! - 쿠키는 하나하나 들고올 수 없다!
		Cookie[] cookies = request.getCookies();
		if(cookies != null && cookies.length > 0) {
			for(int i=0; i<cookies.length; i++) {
	%>
			<%= cookies[i].getName() %> = 
			<!-- URLDecoder는 한글이 넘어올 때 처리하기 위한 것 -->
			<%= URLDecoder.decode(cookies[i].getValue(), "utf-8") %><br>
			
			out.println(cookies[i].getName() + "=" + cookies[i].getValue() + "<br>");
	<%		
		}
	} else {
	%>
		쿠키가 존재하지 않습니다.
	<%	
	}
	%>
	
	쿠키는 (키, 값)으로 이루어져있다.
	키가 중복되면 자동으로 새로운 쿠키를 생성할 때, 원래 있던 쿠키의 값이 변경된다.(값이 덮어씌워진다)
</body>
</html>