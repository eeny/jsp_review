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
	<table border="1">
		<tr>
			<td>번호</td>
			<td><%=dto.getIdx()%></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><%=dto.getName()%></td>
		</tr>
		<tr>
			<td>날짜</td>
			<td><%=dto.getReg_date()%></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><%=dto.getPw()%></td>
		</tr>
		<tr>
			<td>글제목</td>
			<td><%=dto.getTitle()%></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><%=dto.getContent()%></td>
		</tr>
		<tr>
			<td>파일</td>
			<td><%=getServletContext().getRealPath("/upload")%>/<%=dto.getMyfile() %></td>
		</tr>
	</table>
	<br>
	<a href="Select">목록으로</a> 
	<a href="Update?idx=<%=dto.getIdx()%>">수정</a> 
	<a href="Delete?idx=<%=dto.getIdx()%>">삭제</a>
	<a href="Insert">글쓰기</a> 
</body>
</html>