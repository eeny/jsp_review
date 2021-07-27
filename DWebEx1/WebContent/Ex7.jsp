<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="Ex7-2.jsp">
		아이디 <input type="text" name="id"><br>
		비밀번호 <input type="password" name="pw"><br>
		성별
			<select name="gender">
				<option value="남">남자</option>
				<option value="여">여자</option>
			</select>
		<br>
		나이 <input type="text" name="age"><br>
		광고수신 : t<input type="radio" name="ad" value="t">
				f<input type="radio" name="ad" value="f"><br>
		과일 : 오렌지<input type="checkbox" name="fruits" value="orange">
			사과<input type="checkbox" name="fruits" value="apple">
			포도<input type="checkbox" name="fruits" value="grape">
		<br>
		<input type="submit" value="가입">
	</form>
</body>
</html>