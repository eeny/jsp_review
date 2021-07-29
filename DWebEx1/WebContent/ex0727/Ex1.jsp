<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	div {
		color: red;
		background-color: pink;
		font-size: 24px;
	}
</style>
</head>
<body>
<%
	// 스크립트릿
	// 여기에는 자바 코드를 사용할 수 있다.
	String str = "hello";

	String result = "";
	for(int i=1; i<=10; i++) {
		result += i + "<br>";
	}
%>

	<div>
		실행은 ctrl + f11
		안녕하세요
		<!-- 자바코드 출력하는 방법 2가지(스크립트릿 & 출력식) -->
		<%
			out.println(str);
		%>
		<br>
		<%= str %> <!-- 이 부분은 out.println 짧은 버전 (표현식 또는 출력식) -->
		<br>
		<!-- for문으로 1 ~ 10까지 한 줄씩 출력하는 방법들 -->
		<%= result %>
		
		<%
			for(int i=1; i<=10; i++) {
				out.println(i + "<br>");
			}
			for(int i=1; i<=10; i++) {
				out.print(i + "<br>");
			}
		%>
		
		<%
			for(int i=1; i<=10; i++) {
		%>
			<%=i %><br>
		<%} %>
	</div>
</body>
</html>