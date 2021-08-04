<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>p389 입력받은 아이디와 이름으로 DB 처리하기</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		String memberID = request.getParameter("memberID");
		String name = request.getParameter("name");
		
		int updateCount = 0;
		
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection conn = null;
		Statement stmt = null;
		
		try {
			String jdbcDriver = "jdbc:mysql://localhost:3306/jspdb?characterEncoding=utf8";
			String dbUser = "root";
			String dbPass = "1234";
			
			String query = "UPDATE member SET name = '"+ name +"' WHERE memberid = '" + memberID + "'";
			
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			stmt = conn.createStatement();
			updateCount = stmt.executeUpdate(query);
		} finally {
			try {
				if(stmt != null) {stmt.close();}
				if(conn != null) {conn.close();}
			} catch(SQLException ex) {}
		}
	%>
	<% if(updateCount > 0) { %>
	<%= memberID %>의 이름을 <%= name %>(으)로 변경
	<% } else { %>
	<%= memberID %> 아이디가 존재하지 않음
	<% } %>
</body>
</html>