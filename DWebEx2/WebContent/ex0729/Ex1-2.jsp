<%@page import="com.company.Ex1Dto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<jsp:useBean id="member" class="com.company.Ex1Dto" />
<jsp:setProperty property="*" name="member" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<% 
		// useBean�ϴ� �Ͱ� ���� �۾�
		Ex1Dto dto = new Ex1Dto();
		// setProperty�� ���� �۾�
		dto.setId(request.getParameter("id"));
		dto.setPw(request.getParameter("pw"));
		dto.setName(request.getParameter("name"));
		dto.setEmail(request.getParameter("email"));
		dto.setAge(Integer.parseInt(request.getParameter("age")));
   %>
	usebean�� �̿��ؼ� �����°�
	<br> 
	���̵� :<%=member.getId()%><br> 
	��й�ȣ :<%=member.getPw()%><br> 
	�̸� :<%=member.getName()%><br> 
	�̸��� :<%=member.getEmail()%><br> 
	���� :<%=member.getAge()%><br>
	<br>
	<br>
	<br> dto�� �̿��ؼ� �����°�
	<br> 
	���̵� :<%=dto.getId()%><br> 
	��й�ȣ :<%=dto.getPw()%><br> 
	�̸� :<%=dto.getName()%><br> 
	�̸��� :<%=dto.getEmail()%><br> 
	���� :<%=dto.getAge()%><br>
	<br>
	<br>
	<br> request�� �̿��ؼ� �����°�
	<br> 
	���̵� :<%=request.getParameter("id") %><br> 
	��й�ȣ :<%=request.getParameter("pw") %><br> 
	�̸� :<%=request.getParameter("name") %><br> 
	�̸��� :<%=request.getParameter("email") %><br> 
	���� :<%=request.getParameter("age") %><br>
</body>
</html>