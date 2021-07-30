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
		Cookie cookie = new Cookie("ad","1");
		cookie.setMaxAge(60);// 60초 = 1분 - 생명주기 - 60초 있다가 지워져라
		//	cookie.setMaxAge(60초 x 60분 x 24시간); - 하루 24시간을 초로 계산	
		response.addCookie(cookie);
		response.sendRedirect("cookiePop.jsp");
		// 자바스크립트에서 location.href랑 같다!
		
		// 제이쿼리 $.cookie('pop1', 'true', {expires : 1});
		// 1은 1일을 의미함
	%>
</body>
</html>