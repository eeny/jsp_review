<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page buffer="1kb" autoFlush="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>p103, 104 autoFlush 속성값 true/false 예제</title>
</head>
<body>
	<%
		for(int i=0; i<1000; i++) {
	%>
			1234
	<%		
		}
	%>
</body>
</html>