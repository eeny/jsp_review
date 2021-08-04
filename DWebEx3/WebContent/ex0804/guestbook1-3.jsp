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
<title>방명록 만들기 - 수정 입력창</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		// select한 내용들
		String name = "";
		String email = "";
		String content = "";
		
		try {
			String jdbcDriver = "jdbc:mysql://localhost:3306/jspdb?characterEncoding=utf8";
			String dbUser = "root";
			String dbPass = "1234";
			
			String sql = "SELECT * FROM guestbook WHERE idx = " + idx;
			
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);	
			
			if(rs.next()) {
				name = rs.getString("name");
				email = rs.getString("email");
				content = rs.getString("content");
			}
		} finally {
			try {
				if(rs != null) {rs.close();}
				if(stmt != null) {stmt.close();}
				if(conn != null) {conn.close();}
			} catch(SQLException ex) {}
		}	
	%>
	
	<form action="guestbook1-4.jsp?idx=<%= idx%>">
		<input type="hidden" value="<%= idx%>" name="idx">
		<table border="1" cellspacing="0" cellpadding="3">
			<tr><td>이름</td><td><input type="text" name="name" size="10" value="<%= name %>" required></td></tr>
			<tr><td>패스워드</td><td><input type="password" name="pw" size="10" required></td></tr>
			<tr><td>이메일</td><td><input type="email" name="email" value="<%= email %>" required></td></tr>
			<tr><td colspan="2"><textarea rows="10" cols="50" name="content" required><%=content %></textarea></td></tr>
			<tr><td colspan="2"><input type="submit" value="글 수정"></td></tr>
		</table>
	</form>
</body>
</html>