<%@page import="com.company.CookieUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키를 이용해 아이디 기억하기</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
	<!-- <form action="jspPractice1-2.jsp"> -->
	<%
		String remID = CookieUtil.getCookieValue("remID", request);
		if(remID == null) {
	%>
			ID <input type="text" name="id" value="" id="id"><br>
	<%
		} else {
	%>
			ID <input type="text" name="id" value=<%= remID%>><br>
	<%		
		}
	%>
		PW <input type="password" name="pw" id="pw"><br>
		<input type="button" value="로그인" id="login"><br>
		<input type="checkbox" id="chk">아이디 기억
	<!-- </form> -->
	
	<script>
		$(function() {
			$("#login").click(function() {
				if ($("#chk").is(":checked") == true) {
					location.href = "jspPractice1-2.jsp?id="+ $("#id").val() +"&pw="+ $("#pw").val() +"&chk=true";
				} else {
					location.href = "jspPractice1-2.jsp?id="+ $("#id").val() +"&pw="+ $("#pw").val() +"&chk=false";
				}
			});
		});
	</script>
</body>
</html>