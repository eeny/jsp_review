<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<jsp:useBean id="member" class="com.company.Ex1Dto" />
<jsp:setProperty property="*" name="member" />
<!-- property에 name만 적는 경우에는 name의 값만 가져온다! 나머지는 null, 0이다 -->
<jsp:setProperty property="id" name="member" value="ididid" />
<!-- set이라서~ value로 받아오는 값을 직접 수정해서 넣을 수도 있다! -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	usebean를 이용해서 가져온것
	<br> 
	아이디 : <%=member.getId()%><br> 
	비밀번호 : <%=member.getPw()%><br> 
	이름 : <jsp:getProperty property="name" name="member"/><br>
	<!-- 이렇게 쓸 수도 있지만 너무 길고 불편해서 안쓰인다! -->
	이름 : <%=member.getName() %><br>
	<!-- 이것이 기준이다! -->
	이름 : ${member.name }<br>
	<!-- 표현식(EL)을 사용하면 훨씬 편리하다!(특정상황에서 작동 안될 수도 있음) -->
	이메일 : <%=member.getEmail()%><br> 
	나이 : <%=member.getAge()%>
</body>
</html>