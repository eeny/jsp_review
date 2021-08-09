<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 	MEMBER 테이블의 내용
	<table width="100%" border="1">
		<tr>
			<td>이름</td><td>아이디</td><td>이메일</td>
		</tr>
		<%
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			
			try {
				String jdbcDriver = "jdbc:apache:commons:dbcp:conname";
				String query = "select * from member order by memberid";
				conn = DriverManager.getConnection(jdbcDriver);
				stmt = conn.createStatement();
				rs = stmt.executeQuery(query);
				while(rs.next()) {
		%>
		<tr>
			<td><%= rs.getString("name") %></td>
			<td><%= rs.getString("memberid") %></td>
			<td><%= rs.getString("email") %></td>
		</tr>
		<%			
				}
			} finally {
				if(rs != null) {
					try {
						rs.close();
					}catch(SQLException e) {
						
					}
				}
				if(stmt != null) {
					try {
						stmt.close();
					}catch(SQLException e) {
						
					}
				}
				if(conn != null) {
					try {
						conn.close();
					}catch(SQLException e) {
						
					}
				}
			}
		%>
	</table> --%>
	
<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String jdbcDriver = "jdbc:apache:commons:dbcp:conname";
	conn = DriverManager.getConnection(jdbcDriver); // 커넥션 가져오기
	// 여기까지가 conn 가져오기 위한 작업
	
	String sql = "select * from guestbook";
	stmt = conn.createStatement();
	rs = stmt.executeQuery(sql);
	while(rs.next()) {
		out.println(rs.getInt("idx") + "/");
		out.println(rs.getString("name") + "<br>");
	}
%>
</body>
</html>














