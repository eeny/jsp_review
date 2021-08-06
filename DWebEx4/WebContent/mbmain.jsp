<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="com.company.MyDto"%> 
<%@page import="java.util.Vector"%>
<%@page import="com.company.MyDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 메인화면	</title>
<style>
	table {
		width: 800px;
		border-collapse: collapse;
		text-align: center;
	}
	th {
		border: 1px solid black;
		background-color: skyblue;
	}
	td {
		border: 1px solid black;
	}
	tr td:FIRST-CHILD {
		width: 10%;
	}
	tr td:NTH-CHILD(3) {
		width: 20%;
	}
	tr td:LAST-CHILD {
		width: 30%;
	}
</style>
</head>
<body>
	<h1>내 게시판</h1>
	<table>
		<tr>
			<th>번호</th><th>제목</th><th>작성자</th><th>작성일</th>
		</tr>
<%
	MyDao dao = new MyDao();
	
	Vector<MyDto> v = dao.getSelectAll();
	
	for(int i=0; i<v.size(); i++) {
		/* SimpleDateFormat df = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
		Date d = v.get(i).getWdate();
		String date = df.format(d); */
%>
		<tr>
			<td><%=v.get(i).getIdx() %></td><td><%=v.get(i).getTitle() %></td><td><%=v.get(i).getWriter() %></td><td><%=v.get(i).getWdate() %></td>
		</tr>
<%
	}
	
%>				
	</table>
</body>
</html>