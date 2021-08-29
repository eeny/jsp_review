<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	셀렉트 페이지<br><br>
	<table border="1">
		<tr>
			<td>번호</td>
			<td>아이디</td>
			<td>비밀번호</td>
			<td>삭제</td>
		</tr>
		<c:forEach var="dto" items="${requestScope.data }">
		<tr>
			<td>${dto.idx }</td>
			<td>${dto.id }</td>
			<td>${dto.pw }</td>
			<td><a href="DeleteDs?idx=${dto.idx }">삭제</a></td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>