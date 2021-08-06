<%@page import="java.net.URLEncoder"%>
<%@page import="com.company.JDto"%>
<%@page import="java.util.Vector"%>
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
	String name = "";
	String email = "";
	String content = "";
	
	JDao dao = new JDao(); 
	boolean result = dao.pwChk(idx, pw); 
	if(result) {
		Vector<JDto> v = dao.getSelectIdx(Integer.parseInt(idx));
		name = URLEncoder.encode(v.get(0).getName());
		email = URLEncoder.encode(v.get(0).getEmail());
		content = URLEncoder.encode(v.get(0).getContent());
		
		response.sendRedirect("jupdate.jsp?name=" + name + "&email=" + email + "&content=" + content+ "&idx=" + idx);
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