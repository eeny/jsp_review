<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %><!-- 페이지소스 공백 제거 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	기본 형식은 HTML처럼 사용할 수 있도록 써놨다.
	
	<%= new Date() %> 출력식에는 ;세미콜론을  쓰지 않는다!
	<%
		System.out.print("이것은 출력이다.");
	%>
	
	주로 발생하는 에러들 : 500에러 / 404에러
	500에러는 코드를 잘못 쓴 것!
	404에러는 파일이 없을 때!
</body>
</html>