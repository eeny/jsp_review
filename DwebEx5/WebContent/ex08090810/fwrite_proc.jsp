<%@page import="com.company.FDto"%>
<%@page import="com.company.FDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bean" class="com.company.FBDto"/>
<jsp:setProperty property="*" name="bean"/>
<%
	FDto dto = (FDto)session.getAttribute("logindata");

	FDao dao = new FDao();
	// bean은 입력한 게시판 데이터, dto은 회원 데이터
	int result = dao.insertFBoard(dto, bean);
	if(result > 0) {
		response.sendRedirect("fmain.jsp");
	} else {
%>
		<script>
			alert("문제 발생");
			location.href = "fmain.jsp";
		</script>
<%		
	}
%>