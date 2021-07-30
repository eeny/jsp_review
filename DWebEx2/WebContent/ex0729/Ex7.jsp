<%@page import="com.company.CookieUtil"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%-- <%
		String key = request.getParameter("key");
	
		Cookie[] cookies = request.getCookies();
		if (cookies != null && cookies.length > 0) {
	
			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getName().equals(key)) {
			Cookie cookie = new Cookie(cookies[i].getName(), "");// 내용을 초기화
			// 하지만 아직까지 이쿠키는 살아 있다.
			cookie.setMaxAge(0);
			// 쿠키는 물리적으로 지우는 방법은 가능하나, 
			// 특정 쿠키를 delete 같은 형태로 지울 수는 없다.
			// 그래서 유지시간을 0으로 설정해 주면 알아서 지워진다. 
	
			// 쿠키는 설정한 시간 이후에 지워진다. 이 메서드가 시간 설정 하는 부분
			// 0 이니까 0초  => 이 쿠키가 유지되는 전체 시간을 0으로 바꾼다.
			response.addCookie(cookie);
			out.println("삭제됨");
			break;
				}
			}
		}
	%> --%>
	<!-- CookieUtil.java로 메서드화시켰다 -->
	
	<%
		String key = request.getParameter("key");
		// 자바에서는 request, response가 없다!
		// 따라서 request, response의 값들이 필요하다면
		// 이 객체들을 반드시 자바에 매개변수로 던져줘야한다!
		out.println(CookieUtil.deleteCookie(key, request, response));
	%>
	<a href="Ex6.jsp">돌아가기</a>
</body>
</html>