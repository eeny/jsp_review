<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 페이지에서 include를 해서~ -->
<%@ include file="valiable.jspf" %>
<%-- 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 바로 변수를 사용할 수 있다! -->
	<%= PI %>
</body>
</html> 
--%>

<%@ include file="inctop.jspf"%>

안녕하세요
<%= PI %>/<%= PAGE_SIZE %>

<%@ include file="incfoot.jspf"%>