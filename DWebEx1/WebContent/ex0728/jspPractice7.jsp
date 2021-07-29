<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>p126 예제  - 로그 메시지 기록</title>
</head>
<body>
	<%
		//application.log("로그 메시지 기록");
		log("로그 메시지 기록2");
		log("로그로그");
	%>
	<% System.out.println("시스템 출력"); %>
	로그 메시지를 기록합니다.
	
	<!-- 이클립스랑 톰캣이랑 설정이 안맞아서 파일에 글자가 안나타난다! -->
</body>
</html>