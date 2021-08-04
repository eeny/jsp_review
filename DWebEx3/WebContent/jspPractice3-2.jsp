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
		request.setCharacterEncoding("utf-8");
	
		String memberid = request.getParameter("memberid");
		
		Connection conn = null;
		Statement stmt = null;
		int result = 0;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch(ClassNotFoundException ex) {
			System.out.println("로딩할 드라이버 없음");
		}
		
		try {
			String url = "jdbc:mysql://localhost:3306/jspdb?characterEncoding=utf8"; // 데이터베이스 이름 써야한다
			
			String id = "root";
			String pw = "1234";
			
			conn = DriverManager.getConnection(url, id, pw);
			
			String query = "DELETE FROM member WHERE memberid = '"+memberid+"'";
			stmt = conn.createStatement();
			result = stmt.executeUpdate(query);
			
			System.out.println(query); // 쿼리 확인하기
			
			if(result > 0) {
				out.println("데이터가 삭제되었습니다.");
	%>
				<a href="ex0803/Ex1.jsp">SELECT 페이지로</a>
	<%			
			} else {
				out.println("데이터를 삭제할 수 없습니다.");
	%>
				<a href="jspPractice3.jsp">이전 페이지로</a>
	<%
			}
		} catch(SQLException se) {
			out.println("데이터를 삭제할 수 없습니다.");
	%>
			<a href="jspPractice3.jsp">이전 페이지로</a>
	<%
		} finally {
			if(stmt != null) {stmt.close();}
			if(conn != null) {conn.close();}
		}
	%>
</body>
</html>