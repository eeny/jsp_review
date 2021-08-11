<%@page import="com.company.FDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	int idx = Integer.parseInt(request.getParameter("idx"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	FDao dao = new FDao();
	int result = dao.updateBoard(idx, title, content);
	if(result > 0) {
		response.sendRedirect("fread.jsp?idx=" + idx);
	} else {
%>
		<script>
			alert("문제 발생");
			location.href = "fread.jsp?idx=" + idx;
		</script>
<%			
	}
%>