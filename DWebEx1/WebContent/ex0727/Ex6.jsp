<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	데이터를 보낸다<br>
	보낼 부분을 form으로 감싼다.<br>
	form안에는 name을 가진 input들이 있다.<br>
	값을 입력한 이후에 submit()을 이용해 다음 페이지로 전송한다.<br>
	
	<form action="Ex6-2.jsp">
		아이디 <input type="text" name="id"><br>
		비밀번호 <input type="text" name="pw"><br>
		<input type="submit" value="로그인">
	</form>
	
	<br><br><br>
	한글 처리<br>
	GET 방식 - form의 method로, 기본이 GET방식이다. = 주소줄에 내용이 다 보인다.
	1) 보내는 곳에 encoding을 UTF-8로 설정
	2) 받는 쪽에서 request를 통한 인코딩 - 반드시 request.getParameter 이전에 작성해야 한다!!!
</body>
</html>