<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		if(id.equals("idid") && pw.equals("pwpw")) {
			// 아이디 비밀번호가 맞다면 로그인 처리
			session.setAttribute("idinfo", id);
			response.sendRedirect("Ex12.jsp");
		} else {
			response.sendRedirect("Ex12-3.jsp");
		}
	%>
</body>
</html>