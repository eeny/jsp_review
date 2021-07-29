<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>p76 & p78 37번째줄 작성(출력창)</title>
</head>
<body>
	<b>request.getParameterMap() 메서드 사용</b>
	<%
		request.setCharacterEncoding("utf-8");
	
		Map parameterMap = request.getParameterMap();
		String[] nameParam = (String[])parameterMap.get("name");
		if(nameParam != null) {
	%>
			name = <%=nameParam[0] %>
	<%	
		}
	%>
</body>
</html>