<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디, 패스워드로 삭제하기</title>
</head>
<body>
<%
	String memberid = request.getParameter("id");
	if(memberid == null) {
		memberid = "";
	}
%>
	<form action="Ex3-2.jsp">
		아이디<input type="text" name="memberid" value="<%= memberid%>"><br>
		패스워드<input type="text" name="password"><br>
		<input type="submit" value="삭제">
	</form>
</body>
</html>