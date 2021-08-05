<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String query = request.getParameter("query"); 
%>
<%
	// INSERT, UPDATE, DELETE 용 변수
	Connection conn = null;
	Statement stmt = null;
	int result = 0;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		
		String url = "jdbc:mysql://127.0.0.1/jspdb?characterEncoding=utf8";
		String dbid = "root";
		String dbpw = "1234";
		
		conn = DriverManager.getConnection(url, dbid, dbpw); // 연결 끝
	} catch(Exception e) {
		e.printStackTrace();
	}
%>
<%
	try {
		String sql = query;
		
		stmt = conn.createStatement();
		result = stmt.executeUpdate(sql);
		
		if(result > 0) {
			//response.sendRedirect("jg_main.jsp");
			// <jsp:include>를 하면 리다이렉트가 안먹힌다!!!
%>
			<script type="text/javascript">
				location.href = "jg_main.jsp";
			</script>
<%
		} else {
			out.println("에러 발생!");
		}
	} catch(SQLException se) {
		se.printStackTrace();
	} finally {
		if(stmt != null) {stmt.close();}
		if(conn != null) {conn.close();}
	}
%>









