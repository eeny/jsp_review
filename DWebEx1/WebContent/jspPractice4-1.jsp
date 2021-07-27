<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 정보 출력하기(출력창)</title>
</head>
<body>
	<h1>환영합니다!</h1>
	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String repw = request.getParameter("repw");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
	%>
	입력한 아이디 : <%= id %> <br>
	입력한 비밀번호 : <%= pw %> <br>
	입력한 이름 : <%= name %> <br>
	입력한 이메일 : <%= email %>
	<hr>
    <button onclick="location.href='jspPractice4.jsp'">처음으로 돌아가기</button>
</body>
</html>