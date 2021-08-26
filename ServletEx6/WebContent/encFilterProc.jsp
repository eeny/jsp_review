<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		//request.setCharacterEncoding("utf-8");
	%>
	넘어온 데이터<br>
	<table>
		<tr>
			<td>별명</td>
			<td><%=request.getParameter("nick") %></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><%=request.getParameter("addr") %></td>
		</tr>
	</table>
	<a href="encFilterForm.jsp">다시 한번</a>
</body>
</html>