<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원가입</h1>
	<form action="InsertProc" method="post">
		<table border="1" cellspacing="0">
			<tr>
				<td>아이디</td><td><input type="text" name="id" required></td>
			</tr>
			<tr>
				<td>비밀번호</td><td><input type="text" name="pw" required></td>
			</tr>
			<tr>
				<td>이름</td><td><input type="text" name="name" required></td>
			</tr>
			<tr>
				<td>이메일</td><td><input type="text" name="email"></td>
			</tr>
		</table>
		<input type="submit" value="가입"> <input type="button" value="목록으로" onclick="history.back()">
	</form>
</body>
</html>