<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>p169 include 디렉티브 예제</title>
</head>
<body>
	<%
		int number = 10;
	%>
	
	<%@ include file="/jspPractice11.jspf" %>
	<!-- include 디렉티브를 통해 다른 JSP에 포함되는 JSP 파일의 경우
		일반 JSP파일과 구분하기 위해 확장자로 jspf를 사용한다.
		JSP의 소스 코드 조각이다!
		그냥, 분리해서 보기위해 적은 것일 뿐 jsp로 해도 상관 없다!
	 -->
	공통변수 DATAFOLDER = "<%= dataFolder %>"
</body>
</html>