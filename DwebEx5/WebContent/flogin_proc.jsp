<%@page import="com.company.FDto"%>
<%@page import="com.company.FDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bean" class="com.company.FDto"/>
<jsp:setProperty property="*" name="bean"/>

<%
	FDao dao = new FDao();
	FDto dto = dao.flogin(bean); // 로그인이 문제 없다면 dto에 값이 담긴다. 
	
	if(dto.getIdx() != 0) {
		// 세션 처리
		session.setAttribute("logindata", dto);
		response.sendRedirect("fmain.jsp");		
	} else {
%>
		<script type="text/javascript">
			alert("아이디 비번 틀림!");
			location.href="fmain.jsp";
		</script>
<%			
	}
	
%>