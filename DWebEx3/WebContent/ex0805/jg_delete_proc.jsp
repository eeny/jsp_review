<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 내가 줄인 방식 -->
<%-- <%
	request.setCharacterEncoding("UTF-8");

	String idx = request.getParameter("idx");
	String pw = request.getParameter("pw");
	
	String query = "DELETE FROM guestbook WHERE idx = " + idx + " AND pw = '" + pw + "'";
%>
<jsp:include page="jg_mdcommon_proc.jsp" flush="false">
	<jsp:param value="<%=query %>" name="query"/>
</jsp:include> --%>

<!-- 선생님 코드 -->
<%@ include file="jg_include_iud.jspf" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	String idx = request.getParameter("idx");
	String pw = request.getParameter("pw");
	// 드라이버 로딩/변수설정/connection 가져오기
	
	try{
		String sql = "delete from guestbook where idx = ? and pw = ?";		
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(idx));
		pstmt.setString(2, pw);
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
%>
		<%-- <%@ include file="/jg_include_iud_close.jspf" %>  --%>
<%		
	}	
%>
</body>
</html>