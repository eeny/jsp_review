<%@page import="com.company.FDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bean" class="com.company.FDto"/>
<jsp:setProperty property="*" name="bean"/>

${bean.id}/${bean.pw}/${bean.name}/${bean.email}

<%
	FDao dao = new FDao();
	int result = dao.fregist(bean);
	if(result > 0) {
		response.sendRedirect("fmain.jsp");
	} else {
%>
		<script type="text/javascript">
			alert("문제발생");
			location.href="fregist.jsp";
		</script>
<%		
	}
%>





