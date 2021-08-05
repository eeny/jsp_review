<%-- <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 내가 줄인 방식 -->
<%-- <%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String pw = request.getParameter("pw");
	String email = request.getParameter("email");
	String content = request.getParameter("content");
	
	String query = "INSERT INTO guestbook VALUES (NULL, '"+name+"', '"+pw+"', '"+email+"', '"+content+"')";
%>
<jsp:include page="jg_mdcommon_proc.jsp" flush="false">
	<jsp:param value="<%=query %>" name="query"/>
</jsp:include> --%>

<!-- 선생님 코드 -->
<%-- <%
	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("name");
	String pw = request.getParameter("pw");
	String email = request.getParameter("email");
	String content = request.getParameter("content");	
%>
<%
	// insert, update, delete 용
	Connection conn = null;
	Statement stmt = null;
	int result = 0;
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://127.0.0.1/jspdb?characterEncoding=utf8";
		String dbid = "root";
		String dbpw = "1234";
		conn = DriverManager.getConnection(url, dbid, dbpw);//연결끝
	}catch(Exception sqle){
		sqle.printStackTrace();
	}
%>
<%
	try{
		String sql = "insert into guestbook values (null, '"+name+"', '"+pw+"', '"+email+"', '"+content+"')";
		// INSERT INTO guestbook (컬럼명, 컬럼명, ...) VALUES (값, 값, ...) 1대1매칭 필수!
		// 만약 컬럼명 부분 없이 작성한다면 반드시 전부 다 컬럼 순서대로 개수를 맞춰줘야 한다!!!
		
		stmt = conn.createStatement();
		result = stmt.executeUpdate(sql);
		
		if(result>0){// 문제없음
			response.sendRedirect("jg_main.jsp");
		}else{
			out.println("에러 발생!");
		}
	}catch(SQLException sqle){
		sqle.printStackTrace();
	}finally{
		try{
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		}catch(SQLException sqle){
			sqle.printStackTrace();
		}
	}
%> --%>

<!-- 선생님 코드 줄인 버전 -->
<%@ include file="jg_include_iud.jspf" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	request.setCharacterEncoding("UTF-8");
	
	String name = request.getParameter("name");
	String pw = request.getParameter("pw");
	String email = request.getParameter("email");
	String content = request.getParameter("content");
	
	try{
		String sql = "insert into guestbook values (null, ?, ?, ?, ?)";		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, pw);
		pstmt.setString(3, email);
		pstmt.setString(4, content);
		
		result = pstmt.executeUpdate();
		
		if(result>0){// 문제없음
			response.sendRedirect("jg_main.jsp");
		}else{
%>
		<script>
			alert("비밀번호가 틀렸습니다.");
			history.back();
		</script>
<%		
		}
	}catch(SQLException sqle){
		sqle.printStackTrace();
	}finally{
		try{
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}catch(SQLException sqle){
			sqle.printStackTrace();
		}
	}	
%>
</body>
</html>













