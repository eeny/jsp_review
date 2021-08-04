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
	<!-- 389페이지 -->
	<%
		request.setCharacterEncoding("utf-8");
	
		String memberID = request.getParameter("id");
		String memberName = request.getParameter("name");
		
		Connection conn = null; 
		Statement stmt = null; 
		int result = 0; // int인 이유는 몇 행이 영향을 받아서 실행되었나? 0이면? 조건에 맞는 업데이트가 할 게 없었다!
		
		// 1.JDBC 드라이버 로딩
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // 요즘 방식 - Mac에서는 안된다!
		} catch(ClassNotFoundException cnfe) {
			System.out.println("로딩할 드라이버 클래스가 없습니다.");
		}
		
		// 2. 데이터베이스 커넥션 생성 - 자바랑 DB를 연결하는 통로
		try {
			String jdbcDriver = "jdbc:mysql://localhost:3306/jspdb?characterEncoding=utf8"; // 데이터베이스 이름 써야한다
			
			String dbUser = "root";
			String dbPass = "1234";
							
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass); 
			// 여기까지 DB연결 완료!
			
			// 3. Statement(쿼리를 보내기 위한 실행기) 생성 & 쿼리 준비 - DB에서 사용하는 구문(질의)
			String query = "UPDATE member SET name = '"+ memberName +"' WHERE memberid = '" + memberID + "'";
			stmt = conn.createStatement();	
			
			System.out.println(query);
			
			// 4. 쿼리 실행 - 이때 result에는 update한 결과가 담긴다!
			result = stmt.executeUpdate(query);
			
			// 5. 쿼리 실행 결과 출력
			if(result < 1) {
				//out.println("수정된 게 없음");
	%>
				<script>
					alert("수정된 게 없음");
					location.href = "ex0803/Ex1.jsp";
				</script>
	<%
			} else {
				//out.println(memberName + "으로 수정됨");
	%>
				<script>
					alert("수정완료");
					location.href = "ex0803/Ex1.jsp";
				</script>
	<%
			}
			
		} finally {
			// 6. 사용한 Statement 종료 - 열었던 순서대로 닫아줘야 한다!
			try {
				if(stmt != null) {stmt.close();}
				// 7. 커넥션 종료 - 통로 닫고 종료하기
				if(conn != null) {conn.close();}
				
			} catch(SQLException ex) {}
		}
	%>
</body>
</html>