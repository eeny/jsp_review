<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
인서트 페이지<br>
<form action="InsertMemberProc" method="post">
<table border="1">
	<tr>
		<td>아이디</td>
		<td><input type="text" name="id"></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="text" name="pw"></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><input type="text" name="name"></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><input type="text" name="email"></td>
	</tr>
</table>
	<input type="submit"> <input type="button" value="목록으로" onclick="location.href='SelectMember'">
</form>
</body>
</html>