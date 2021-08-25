<%@page import="com.test.ServletDto"%>
<%@page import="java.util.Vector"%>
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
	Vector<ServletDto> v = (Vector<ServletDto>)request.getAttribute("data");
%>
<a href="Insert">글쓰기 페이지로 가기</a><br>
 <!--  /ServletEx1_work/ + Insert   -->
select 페이지<br>
<table border="1">
	<tr>
		<td>번호</td>
		<td>이름</td>
		<td>글제목</td>
		<td>날짜</td>
	</tr>
<% for(int i=0;i<v.size();i++){ %>
	<tr>
		<td><%=v.get(i).getIdx() %></td>
		<td><%=v.get(i).getName() %></td>
		<td><a href="Read?idx=<%=v.get(i).getIdx() %>"><%=v.get(i).getTitle() %></a></td>
		<td><%=v.get(i).getReg_date() %></td>
	</tr>	
<% } %>	
</table>
</body>
</html>