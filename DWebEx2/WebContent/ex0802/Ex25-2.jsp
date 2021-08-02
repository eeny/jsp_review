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
	${param.tel }/${param.gugu }/${param.sum }
	
	<!-- 현재 페이지의 java 변수를 jsp 변수로 바꾸기 위해서 필요한 부분 -->
	<%-- 
		<% String str = "1,2,3,4,5"; %>
		<c:set var="str" value="<%=str %>"/> 
	--%>
	<!-- 여기까지가 필요없다! 왜? 이미 값이 jsp변수로 넘어오니까! -->
	
	<c:forTokens var="tk" items="${param.tel }" delims="-">
		${tk }
	</c:forTokens>
	
	<hr>
	<c:forEach var="i" begin="1" end="9">
		${param.gugu } * ${i } = ${param.gugu * i }<br>
	</c:forEach>
	
	<hr>
	<c:forEach var="i" begin="1" end="${param.sum }">
		<c:set var="sum" value="${sum + i }"/>
	</c:forEach>
	${sum }
</body>
</html>