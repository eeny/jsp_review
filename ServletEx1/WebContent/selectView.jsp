<%@page import="com.command.FDto"%>
<%@page import="java.util.Vector"%>
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
		Vector<FDto> v = (Vector)request.getAttribute("result");
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