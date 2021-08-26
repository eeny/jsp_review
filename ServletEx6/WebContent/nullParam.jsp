<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	id 파라미터 : <%= request.getParameter("id") %> 필터에 있음<br>
	name 파라미터 : <%= request.getParameter("name") %> 필터에 있음<br>
	member 파라미터 : <%= request.getParameter("member") %> 필터에 없음!<br>	
</body>
</html>