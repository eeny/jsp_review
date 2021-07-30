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
		// useBean하는 것과 같은 작업
		Ex1Dto dto = new Ex1Dto();
		// setProperty랑 같은 작업
		dto.setId(request.getParameter("id"));
		dto.setPw(request.getParameter("pw"));
		dto.setName(request.getParameter("name"));
		dto.setEmail(request.getParameter("email"));
		dto.setAge(Integer.parseInt(request.getParameter("age")));
   %>
	usebean를 이용해서 가져온것
	<br> 
	아이디 :<%=member.getId()%><br> 
	비밀번호 :<%=member.getPw()%><br> 
	이름 :<%=member.getName()%><br> 
	이메일 :<%=member.getEmail()%><br> 
	나이 :<%=member.getAge()%><br>
	<br>
	<br>
	<br> dto를 이용해서 가져온것
	<br> 
	아이디 :<%=dto.getId()%><br> 
	비밀번호 :<%=dto.getPw()%><br> 
	이름 :<%=dto.getName()%><br> 
	이메일 :<%=dto.getEmail()%><br> 
	나이 :<%=dto.getAge()%><br>
	<br>
	<br>
	<br> request를 이용해서 가져온것
	<br> 
	아이디 :<%=request.getParameter("id") %><br> 
	비밀번호 :<%=request.getParameter("pw") %><br> 
	이름 :<%=request.getParameter("name") %><br> 
	이메일 :<%=request.getParameter("email") %><br> 
	나이 :<%=request.getParameter("age") %><br>
</body>
</html>