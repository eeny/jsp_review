<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% out.println("내용"); %>
	<%= "내용" %>
	<%= out.getBufferSize() %>
	
	<%
		// jsp에서는 기본적으로 무조건 request가 있으므로 굳이 이렇게 안해도 된다!
		HttpServletRequest req = 
			(HttpServletRequest)pageContext.getRequest();
	
		if(req == request) {
			out.println("같다");
		}
		// page에서 뽑아온 request나 원래 내장된 request나 똑같다!
	%>
	
	application 객체는 이 프로그램 전체의 설정정보를 담고 있으며
	공통된 설정은 web.xml에다가 작성한다.
	
	<%= application.getServerInfo() %>/
	<%= application.getMajorVersion() %>/
	<%= application.getMinorVersion() %>/
</body>
</html>