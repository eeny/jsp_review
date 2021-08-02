<%@page import="com.company.CookieUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키를 이용해 아이디 기억하기</title>
</head>
<body>
	현재 쿠키 : <%= CookieUtil.getCookieValue("remID", request) %><br>

	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String chk = request.getParameter("chk");
		
		if(id.equals("idid") && pw.equals("pwpw")) {
			out.print("로그인 성공");
			
			if(chk.equals("true")) {
				Cookie cookie = new Cookie("remID", id);
				cookie.setMaxAge(60); // 1분
				response.addCookie(cookie);
				response.sendRedirect("jspPractice1.jsp");
			}
		} else {
	%>
			잘못된 아이디 또는 비밀번호<br>
			<a href="jspPractice1.jsp">이전 페이지</a>
	<%
		}
	%>
</body>
</html>