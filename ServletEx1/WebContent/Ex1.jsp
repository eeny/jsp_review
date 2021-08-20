<%@page import="com.company.FDto"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- ${data } --%>
	
	<hr>
	<%
		Vector<FDto> v = (Vector<FDto>)request.getAttribute("selectResult");
		for(int i = 0; i < v.size(); i++) {
			out.print(v.get(i).getIdx() + "/" +
						v.get(i).getName() + "/" +
						v.get(i).getId() + "/" +
						v.get(i).getMyfile() + "/" + 
						v.get(i).getOfname() + "/" + 
						v.get(i).getSfname() + "<br>");
		}
	%>
</body>
</html>