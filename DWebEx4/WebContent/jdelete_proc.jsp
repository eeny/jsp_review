<%@page import="com.company.JDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String idx = request.getParameter("idx");
	String pw = request.getParameter("pw");
	JDao dao = new JDao();
	boolean result = dao.pwChk(idx, pw); // 결과는 맞으면 true, 틀리면 false
	if(result) { // result == true 랑 같은 말
		dao.delete(idx);
		response.sendRedirect("jmain.jsp");
	} else {
%>
		<script>
			alert("비번틀림");
			history.back();
		</script>
<%		
	}
%>
</body>
</html>