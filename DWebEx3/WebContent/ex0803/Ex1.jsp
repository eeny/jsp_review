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
입력<br>
<form action="Ex1-2.jsp">
	아이디<input type="text" name="id"><br>
	비밀번호<input type="text" name="pw"><br>
	이름<input type="text" name="name"><br>
	이메일<input type="text" name="email"><br>
	<input type="submit">
</form>
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

	MEMBER 테이블의 내용 <br>
	<%
		Connection conn = null; // 연결 통로
		Statement stmt = null; // 쿼리 실행기(select~~, insert~~ 같은 DB코드를 쿼리라고 한다!)
		ResultSet rs = null; // "select"한 결과를 담는 객체 - 오직 select만!!!
							// select가 아니라면 결과는 무조건 int(내부적으로 실행됐을 때 몇 개가 영향을 받았는가)이다!!!
		
		// 1.JDBC 드라이버 로딩
		try {
			//Class.forName("com.mysql.jdbc.Driver"); // 옛날 방식
			// com.mysql.jdbc.Driver <== 결국엔 Driver 클래스이다.
			// 위와 같은 클래스를 찾아서 실제 클래스로 등록한다.
			// ==> Class.forName()메서드를 통해서 로딩될 때 자동으로 드라이버가 등록된다!
			Class.forName("com.mysql.cj.jdbc.Driver"); // 요즘 방식 - Mac에서는 안된다!
		} catch(ClassNotFoundException cnfe) {
			System.out.println("로딩할 드라이버 클래스가 없습니다.");
		}
		
		// 2. 데이터베이스 커넥션 생성 - 자바랑 DB를 연결하는 통로
		// 필요한 작업 - DB 연결 세팅을 우선 해야한다!
		try {
			String jdbcDriver = "jdbc:mysql://localhost:3306/jspdb"; // 데이터베이스 이름 써야한다
			// 혹시나 한글이 깨질까 걱정될 때 주소 뒤에 ?useUnicode=true&characterEncoding=utf8을 적어주자!
			// com.mysql.cj.jdbc.Driver를 쓸 경우 타임존 설정을 필요로 하는 경우가 있다!
			// String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC"; 를 쓰면 된다!
			
			// 주소형식은 http처럼 사용한다! jdbc:mysql://db연결주소:포트/db명?옵션=x&옵션=y
			// setTimezone, useUnicode, characterEncoding
			// 타임존 설정		유니코드 사용		문자 포맷 타입
			
			String dbUser = "root";
			String dbPass = "1234";
							
			// 세팅 정보로 DB에 연결하는 통로를 구한다 => conn
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass); 
			// 여기까지 DB연결 완료!
			
			// 3. Statement(쿼리를 보내기 위한 실행기) 생성 & 쿼리 준비 - DB에서 사용하는 구문(질의)
			String query = "select * from member order by memberid";
			stmt = conn.createStatement();				
			
			// 4. 쿼리 실행 - 이때 rs에는 select한 결과가 담긴다!
			rs = stmt.executeQuery(query); // 실행기에 쿼리를 담아서 보내면
			// rs(ResultSet) - 결과의 덩어리 - DB의 결과인 테이블 형태라고 이해하자!
			
			// select의 결과는 rs - 실행은 executeQuery()
			// insert, update, delete 의 결과는 int - 실행은 executeUpdate()
			
			// 5. 쿼리 실행 결과 출력 - rs에 담겨 있으니까 하나씩 꺼내야 한다!
			// 몇 개가 있는지를 모르므로 while을 사용한다.
			while(rs.next()) { // while(enum.hasNextElement())~ 처럼 한 줄 씩 결과가 있는 동안 실행
				// 결과를 한 줄 씩 가져온다. (컬럼이 여러개다) - 컬럼 이름으로 가져오기
				String memberid = rs.getString("memberid");
				String password = rs.getString("password");
				String name = rs.getString("name");
				String email = rs.getString("email");
				
				/* out.println(memberid + "/");
				out.println(password + "/");
				out.println(name + "/");
				out.println(email + "<br>"); */		

	%>
		<a href="../Ex2-3.jsp?id=<%= memberid%>"><%= memberid%></a>
		/<%= password%>/<%= name%>/<a href="../Ex3.jsp?email=<%= email%>&id=<%= memberid%>"><%= email%></a><br>	
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
</body>
</html>