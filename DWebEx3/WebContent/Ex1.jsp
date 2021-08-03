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
<title>p380 회원 목록 예제</title>
</head>
<body>
<!-- 
	JDBC 프로그램의 전형적인 실행 순서
	1. 드라이버 로딩
	2. 커넥션 구하기
	3. 쿼리 준비
	4. 쿼리 실행
	5. 결과 출력
	6. 쿼리 실행기 종료
	7. 커넥션 종료
-->

	MEMBER 테이블의 내용
	<table width="100%" border="1">
		<tr>
			<td>이름</td><td>아이디</td><td>이메일</td>
		</tr>
		<%
			Connection conn = null; // 연결 통로
			Statement stmt = null; // 쿼리 실행기(select~~, insert~~ 같은 DB코드를 쿼리라고 한다!)
			ResultSet rs = null; // "select"한 결과를 담는 객체 - 오직 select만!!!
								// select가 아니라면 결과는 무조건 int(내부적으로 실행됐을 때 몇 개가 영향을 받았는가)이다!!!
			
			// 1.JDBC 드라이버 로딩
			Class.forName("com.mysql.jdbc.Driver"); // 대소문자 구분해야 함!
			
			try {
				String jdbcDriver = "jdbc:mysql://localhost:3306/jspdb"; // 데이터베이스 이름 써야한다
				// 혹시나 한글이 깨질까 걱정될 때 주소 뒤에 ?useUnicode=true&characterEncoding=utf8을 적어주자!
				String dbUser = "root";
				String dbPass = "1234";
								
				// 2. 데이터베이스 커넥션 생성 - 자바랑 DB를 연결하는 통로
				// 필요한 작업 - DB 연결 세팅을 우선 해야한다!
				// 세팅 정보로 DB에 연결하는 통로를 구한다 => conn
				conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass); // 여기까지 DB연결 완료!
				
				// 3. Statement 생성
				String query = "select * from member order by memberid";
				stmt = conn.createStatement(); // 쿼리를 보내기 위한 실행기				
				
				// 4. 쿼리 실행 - 이때 rs에는 select한 결과가 담긴다!
				rs = stmt.executeQuery(query); // 실행기에 쿼리를 담아서 보내면
				
				// 5. 쿼리 실행 결과 출력 - rs에 담겨 있으니까 하나씩 꺼내야 한다!
				// 몇 개가 있는지를 모르므로 while을 사용한다.
				while(rs.next()) { // while(enum.hasNextElement())~ 처럼 한 줄 씩 결과가 있는 동안 실행
					// 결과를 한 줄 씩 가져온다. (컬럼이 여러개다) - 컬럼 이름으로 가져오기
					String memberid = rs.getString("memberid");
					String password = rs.getString("password");
					String name = rs.getString("name");
					String email = rs.getString("email");
					
					out.println(memberid + "/");
					out.println(password + "/");
					out.println(name + "/");
					out.println(email + "<br>");
		%>
		<tr>
			<td><%= rs.getString("name") %></td>
			<td><%= rs.getString("memberid") %></td>
			<td><%= rs.getString("email") %></td>
		</tr>
		<%			
				}	
				
			} catch(SQLException ex) {
				out.println(ex.getMessage());
				ex.printStackTrace(); // 발생하는 에러 그대로 출력하기
				
			} finally {
				// 6. 사용한 Statement 종료 - 열었던 순서대로 닫아줘야 한다!
				try {
					if(rs != null) {rs.close();}
					if(stmt != null) {stmt.close();}
					// 7. 커넥션 종료 - 통로 닫고 종료하기
					if(conn != null) {conn.close();}
					
				} catch(SQLException ex) {}
			}
		%>
	</table>
</body>
</html>