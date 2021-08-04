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
<title>방명록 만들기 - 삭제</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection conn = null;
		Statement stmt = null;
		int result = 0;
		
		try {
			String jdbcDriver = "jdbc:mysql://localhost:3306/jspdb?characterEncoding=utf8";
			String dbUser = "root";
			String dbPass = "1234";
			
			String sql = "DELETE FROM guestbook WHERE idx = " + idx;
			
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			stmt = conn.createStatement();
			result = stmt.executeUpdate(sql);	
			
			if(result > 0) {
	%>
				<script>
					alert("글 삭제 완료!");
					location.href = "guestbook1.jsp";
				</script>
	<%			
			} else {
	%>
				<script>
					alert("글 삭제 실패...");
					location.href = "guestbook1.jsp";
				</script>
	<%
			}
		} finally {
			try {
				if(stmt != null) {stmt.close();}
				if(conn != null) {conn.close();}
			} catch(SQLException ex) {}
		}	
	%>
</body>
</html>