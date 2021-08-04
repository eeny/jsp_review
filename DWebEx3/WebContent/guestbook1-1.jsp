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
<title>방명록 만들기 - 수정/삭제 선택창</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String pwd = null; // select해서 가져온 비번
		
		try {
			String jdbcDriver = "jdbc:mysql://localhost:3306/jspdb?characterEncoding=utf8";
			String dbUser = "root";
			String dbPass = "1234";
			
			String sql = "SELECT * FROM guestbook WHERE idx = " + idx;
			
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);	
			
			if(rs.next()) {
				pwd = rs.getString("pw");
			}
		} finally {
			try {
				if(rs != null) {rs.close();}
				if(stmt != null) {stmt.close();}
				if(conn != null) {conn.close();}
			} catch(SQLException ex) {}
		}		
	%>
	
	
	패스워드를 입력 : <input type="password" id="pwd">
	<button class="mod">수정</button>
	<button class="del">삭제</button>
	
	<script>
		$(function() {
			$(".mod").click(function() {
				if($("#pwd").val() == <%= pwd %>) {
					location.href = "guestbook1-3.jsp?idx=" + <%= idx%>;					
				} else {
					alert("패스워스가 틀렸습니다!");
					location.href = "guestbook1.jsp";
				}
			});
			$(".del").click(function() {
				if($("#pwd").val() == <%= pwd %>) {
					location.href = "guestbook1-5.jsp?idx=" + <%= idx%>;					
				} else {
					alert("패스워스가 틀렸습니다!");
					location.href = "guestbook1.jsp";
				}
			});
		});
	</script>
</body>
</html>