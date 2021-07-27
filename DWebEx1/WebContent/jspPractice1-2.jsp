<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 만들기(출력창)</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String gender = request.getParameter("gender");
		int age = Integer.parseInt(request.getParameter("age")) + 2;
	%>
	아이디 : <%= id %> <br>
	비밀번호 : <%= pw %> <br>
	성별 : <%= gender %> <br>
	나이 : <%= age %>
</body>
</html>