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
	�Ѿ�� ������<br>
	<table>
		<tr>
			<td>����</td>
			<td><%=request.getParameter("nick") %></td>
		</tr>
		<tr>
			<td>�ּ�</td>
			<td><%=request.getParameter("addr") %></td>
		</tr>
	</table>
	<a href="encFilterForm.jsp">�ٽ� �ѹ�</a>
</body>
</html>