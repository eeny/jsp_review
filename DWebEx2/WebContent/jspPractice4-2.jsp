<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="member" class="com.company.JspPrac4Dto"/>
<jsp:setProperty property="*" name="member"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DTO(Bean) 연습 - 출력페이지</title>
</head>
<body>
	아이디 : <%= member.getId() %><br>
	비밀번호 : <%= member.getPw() %><br>
	이메일 : <%= member.getEmail() %><br>
	나이 : <%= member.getAge() %><br>
	몸무게 : <%= member.getWeight() %>
</body>
</html>