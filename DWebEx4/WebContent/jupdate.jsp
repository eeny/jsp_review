<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/main.css">
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	String idx = request.getParameter("idx");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String content = request.getParameter("content");
%>
	<form action="jupdate_proc.jsp">
		<input type="hidden" value="<%= idx%>" name="idx">
		<table>
			<tr>
				<td style="width: 70px;">이름</td>
				<td><input type="text" name="name" value="<%=name %>" required></td>
				<td style="width: 70px;">비밀번호</td>
				<td><input type="password" name="pw" required></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td colspan="3"><input type="text" value="<%=email %>" name="email"></td>			
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="3"><textarea name="content"><%=content %></textarea></td>
			</tr>
			<tr>
				<td colspan="4"><input type="submit" value="수정"></td>
			</tr>
		</table>
	</form>
</body>
</html>