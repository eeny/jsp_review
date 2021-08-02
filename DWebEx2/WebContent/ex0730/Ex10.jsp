<%@page import="com.company.CookieUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	쿠키는 웹 브라우저에 저장된다.
	= 모든 서버(우리가 접속하는 모든 웹사이트)에서 공용으로 사용이 가능하다.
	
	<%
		String val = CookieUtil.getCookieValue("saveid", request);
		if(val == null) {
			val = "";
		}
	%>
	
	<form action="Ex10-2.jsp">
		아이디 <input type="text" name="id" value="<%=val %>"><br>
		비밀번호 <input type="text" name="pw"><br>
		<input type="submit" value="로그인"><br>
		아이디 저장 <input type="checkbox" name="save" value="true"><br>
		<!-- checkbox에 value 지정안하면 체크시:on 체크안함:null 값이 넘어간다! -->
	</form>
</body>
</html>