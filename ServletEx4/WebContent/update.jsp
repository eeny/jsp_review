<%@page import="com.test.ServletDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		ServletDto dto = (ServletDto)request.getAttribute("data");
	%>
	<form action="UpdateProc" method="post">
	<table border="1">
		<tr>
			<td>번호</td>
			<td><%=dto.getIdx()%></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" value="<%=dto.getName()%>"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="text" name="pw" value="<%=dto.getPw()%>"></td>
		</tr>		
		<tr>
			<td>글제목</td>
			<td><input type="text" name="title" value="<%=dto.getTitle()%>"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea name="content"><%=dto.getContent()%></textarea></td>
		</tr>
	</table>
	<br>
		<input type="hidden" name="idx" value="<%=dto.getIdx() %>">
		<input type="submit">
		<input type="button" value="취소" onclick="history.back()">
	</form>
</body>
</html>