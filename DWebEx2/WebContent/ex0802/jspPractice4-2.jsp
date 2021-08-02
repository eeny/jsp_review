<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	입력한 월 : ${param.month }<br>
	<%
		// 2021년 기준으로 미리 값을 만들어 두고 시작
		int[] first_week = {5, 1, 1, 4, 6, 2, 4, 0, 3, 5, 1, 3}; // 0:일 ~ 6:토
		int[] last_Day = {31, 28, 28, 25, 31, 30, 31, 31, 30, 31, 30, 31};
						// 1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12
	%>
	<table border="1px" cellpadding="0" cellspacing="0">
		<%
			for(int i=0; i<6; i++) {
		%>
				<td>
		<%		for(int j=0; j<7; j++) {
		%>
					<td><%=j %><td>
		<%		}
		%>
				</td>
		<%	
			}
		%>
	</table>
</body>
</html>