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
<title>Insert title here</title>
</head>
<body>
	<%
		// INSERT
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
		Connection conn = null;
		Statement stmt = null;
		int result = 0;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String dbid = "root";
			String dbpw = "1234";
			String dburl = "jdbc:mysql://localhost:3306/jspdb?characterEncoding=utf8";
			
			conn = DriverManager.getConnection(dburl, dbid, dbpw);
			
			String sql = "INSERT INTO member VALUES ('"+id+"', '"+pw+"', '"+name+"', '"+email+"')";
			stmt = conn.createStatement();
			result = stmt.executeUpdate(sql);
			
			if(result > 0) {
				//out.println("입력 완료");
	%>
				<script>
					alert("입력완료");
					location.href = "Ex1.jsp";
					// 만약 history.back()의 경우에는?
					// 이전에 저장된 페이지로 돌아가는 거라서
					// 입력했던 내용이 그대로 있고, 페이지 갱신이 안 된 상태이다!
				</script>
	<%
			} else {
				//out.println("에러");
	%>
				<script>
					alert("에러");
					location.href = "Ex1.jsp";
				</script>
	<%
			}
		} catch(SQLException se) {
			se.printStackTrace();
		} finally {
			if(stmt != null) {stmt.close();}
			if(conn != null) {conn.close();}
		}
	%>
</body>
</html>