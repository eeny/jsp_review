<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 만들기(입력창)</title>
</head>
<body>
	<form action="jspPractice1-2.jsp">
		아이디<input type="text" name="id"> <br>
		비밀번호<input type="text" name="pw"> <br>
		성별
		<select name="gender">
			<option value="여자" selected>여자</option>
			<option value="남자">남자</option>
		</select> <br>
		나이<input type="text" name="age"><br>
		<input type="submit" value="전송">
	</form>
</body>
</html>