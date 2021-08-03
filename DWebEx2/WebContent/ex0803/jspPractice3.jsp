<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSTL 문제 - 입력</title>
</head>
<body>
	<form action="jspPractice3-2.jsp">
		1) 글자 입력: <input type="text" name="q1"><br>
		2) "bts 버터" 입력: <input type="text" name="q2" value="bts 버터"><br>
		3) "namgu, busan, korea" 전송: <input type="text" name="q3" value="namgu, busan, korea"><br>
		4) "1234-5678" 입력: <input type="text" name="q4" value="1234-5678"><br>
		5) "idid " 입력: <input type="text" name="q5" value="idid "><br>
		6) "#idid" 입력: <input type="text" name="q6" value="#idid"><br>
		7) 5글자만 출력: <input type="text" name="q7"><br>
		<input type="submit" value="전송">
	</form>
</body>
</html>