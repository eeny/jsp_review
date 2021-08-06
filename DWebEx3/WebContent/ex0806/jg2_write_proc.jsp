<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="jg2_include_iud.jspf" %> 
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
			response.sendRedirect("jg2_main.jsp");
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













