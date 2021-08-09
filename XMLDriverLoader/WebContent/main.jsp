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
<%
	// 이미 java파일로 실행시 자동으로 Driver가 로딩되므로 Class.forName(~~)이 필요없다!
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspdb", "root", "1234");
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("SELECT * FROM guestbook");
	
	// 시작은 데이터가 있는 위치가 아니다. 그래서 데이터가 있는 위치로 가야한다! -> rs.next();
	
	rs.next();// 다음 줄로 가라 = 다음 줄이 있으면 true 없으면 false
			// 근데 값이 없으면 에러가 발생하니까 if()로 감싸야한다!
	rs.getInt("idx");
	rs.getString("name");
	
	while(rs.next()) { // 다음 줄이 있으면 이라는 뜻과 같다.
		// 일단 다음 줄로 내려가서 있으면 treu, 없으면 false
		// 따라서 결과적으로 있을 때까지 반복된다!
		
		out.println(rs.getInt("idx"));
		out.println(rs.getString("name"));
	}
%>
</body>
</html>