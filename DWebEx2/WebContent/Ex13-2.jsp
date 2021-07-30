<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="member" class="com.company.Ex2Dto" />
<jsp:setProperty property="*" name="member" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%= member.getId()%><br>
	<%= member.getPw()%><br>
	<%= member.getAge()%><br>
	<%= member.getEmail()%><br>
	<%= member.getWeight()%><br> 
	
	위에 내용은 테스트 코드. 나중에 지울것<br>
	데이터의 문제가 없이 넘어왔다는 가정하에<br>
	if문으로 id 비번등등 모든 문제가 없이 값이 넘어왔다면~<br>
	
	<%
		// bean에 member로 저장한 Ex2Dto클래스를 통째로 세션에 저장한다
		session.setAttribute("memberInfo", member);
		response.sendRedirect("Ex13.jsp");
	%>
</body>
</html>