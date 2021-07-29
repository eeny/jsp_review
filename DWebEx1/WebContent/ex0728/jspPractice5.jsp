<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<%
		String id = request.getParameter("memberID");
		if(id!=null && id.equals("madvirus")) {
			response.sendRedirect("Ex9.jsp");
		} else {
	%>
<html>
<head>
<title>로그인 실패</title>
</head>
<body>
	잘못된 아이디 입니다.
</body>
</html>
	<%		
		}
	%>