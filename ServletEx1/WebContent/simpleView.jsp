<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	결과 : ${result } <== 이게 이미 request.getAttribute("result");랑 같은 말
	
	<hr>
	모델2 방식에서 View에서 해야하는 일은 결과 출력이다!<br>
	보내야하는 내용 또는 페이지가 있다면 무조건 Controller로 보내면 된다!<br>
	<hr>
	모델2(MVC) 방식에서는 일단 View에서 할 일이 거의 없다고 보면 된다.
	
</body>
</html>