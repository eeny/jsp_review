<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		
		Connection conn = null;
		Statement stmt = null; 
		ResultSet rs = null;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch(ClassNotFoundException cnfe) {
			System.out.println("로딩할 드라이버 클래스가 없습니다.");
		}
		try {
			String jdbcDriver = "jdbc:mysql://localhost:3306/jspdb"; // 데이터베이스 이름 써야한다
			
			String dbUser = "root";
			String dbPass = "1234";
							
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass); 
			stmt = conn.createStatement();				
			
			String sql = "SELECT * FROM member WHERE memberid='"+id+"'";
			rs = stmt.executeQuery(sql); 
			
			if(rs.next()) { // 결과는 한 줄 밖에 없을거니까 조건문으로!
	%>
				<form action="Ex2-4.jsp">
					아이디<input type="text" name="id" value="<%= id%>" readonly><br>
					비밀번호<input type="text" name="pw" value="<%= rs.getString("password")%>"><br>
					이름<input type="text" name="name" value="<%= rs.getString("name")%>"><br>
					이메일<input type="text" name="email" value="<%= rs.getString("email")%>"><br>
					<input type="submit">
				</form>
	<%			
			}
			
		} catch(SQLException ex) {
			out.println(ex.getMessage());
			ex.printStackTrace(); 
			
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