<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	1)<br>
	<c:forTokens var="telNum" items="${param.tel }" delims="-">
		${telNum }<br>
	</c:forTokens>
	<hr>
	
	2)${param.gugu } 단 출력<br>
	<c:forEach var="gugudan" begin="1" end="9" varStatus="status">
		${param.gugu } X ${status.count } = ${param.gugu * status.count }<br>
	</c:forEach>
	<hr>
	
	3)1부터 ${param.num } 까지의 합<br>
	<c:forEach var="total" begin="1" end="${param.num }">
		<c:set var="sum" value="${sum = sum + total }"/>
	</c:forEach>
	${sum }
</body>
</html>