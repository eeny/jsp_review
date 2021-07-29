<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	Enumeration // 열거형 - 값 덩어리 타입
	안에 몇 개가 있는지 모를 때 사용한다!
	<br>
	<%
		// 값덩어리 타입으로 가져온다.
		Enumeration headerEnum = request.getHeaderNames();
		// 값이 있으면 없을 때까지 하나씩 들고와라~
		while(headerEnum.hasMoreElements()) {
						// 객체들을 더 가지고 있다면~
			String headerName = (String)headerEnum.nextElement(); // 하나씩 가져오기
								// Object타입이라서 형변환해야 한다!
			// 이름(변수)를 가지고 그 안에 있는 value 가져오기
			// request.getParameter("네임-이름-name")
			String headerValue = request.getParameter(headerName);
			
			out.println(headerName + ":" + headerValue + "<br>");
		}
	%>
</body>
</html>