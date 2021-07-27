<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	div:FIRST-CHILD {
		color: blue;
	}
	div:LAST-CHILD {
		color: red;
	}
</style>
</head>
<body>
	1~100까지 홀수의 합 - 빨간색
	1~100까지 짝수의 합 - 파란색
	<%
		// 내 답안
		int even = 0;
		int odd = 0;
		for(int i=0; i<=100; i++) {
			if(i%2 == 0) {
				even += i;
			} else {
				odd += i;
			}
		}
		out.print("<div>1~100까지 짝수의 합 : "+ even+ "</div>");
		out.print("<div>1~100까지 홀수의 합 : "+ odd+ "</div>");
		
		// 선생님 풀이 1
		int sum1 = 0;
		int sum2 = 0;
		for(int i=1; i<=100; i++) {
			if(i%2==0) {
				sum1+=i;
			} else {
				sum2+=i;
			}
		}
	%>
	
	<div style="color: red"><%=sum1 %></div>
	<div style="color: blue"><%=sum2 %></div>
	
	<!-- 선생님 풀이2 -->
	<%
		for (int i = 1; i <= 100; i++) {
			if (i % 2 == 0) {
	%>
		<div style="color: red"><%=i%></div>
	<%
		} else {
	%>
		<div style="color: blue"><%=i%></div>
	<%
			}
		}
	%>

</body>
</html>