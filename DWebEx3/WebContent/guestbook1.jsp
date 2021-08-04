<%@page import="java.sql.ResultSet"%>
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
<title>방명록 만들기 - 입력 & 확인</title>
</head>
<body>
	<form action="guestbook1-2.jsp">
		<table border="1" cellspacing="0" cellpadding="3">
			<tr><td>이름</td><td><input type="text" name="name" size="10" required></td></tr>
			<tr><td>패스워스</td><td><input type="password" name="pw" size="10" required></td></tr>
			<tr><td>이메일</td><td><input type="email" name="email" required></td></tr>
			<tr><td colspan="2"><textarea rows="10" cols="50" name="content" required></textarea></td></tr>
			<tr><td colspan="2"><input type="submit" value="글 남기기"></td></tr>
		</table>
	</form>
	<h3>방명록</h3>
	<%
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			String jdbcDriver = "jdbc:mysql://localhost:3306/jspdb?characterEncoding=utf8";
			String dbUser = "root";
			String dbPass = "1234";
			
			String sql = "SELECT * FROM guestbook";
			
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) { 
				int idx = rs.getInt("idx");
				String name = rs.getString("name");
				String pw = rs.getString("pw");
				String email = rs.getString("email");
				String content = rs.getString("content");
		%>
			<a href="guestbook1-1.jsp?idx=<%= idx%>"><%= idx %></a> / <%= name %> / <%= content %><br>
		<%
			}

		} finally {
			try {
				if(rs != null) {rs.close();}
				if(stmt != null) {stmt.close();}
				if(conn != null) {conn.close();}
			} catch(SQLException ex) {}
		}
	%>
	
</body>
</html>