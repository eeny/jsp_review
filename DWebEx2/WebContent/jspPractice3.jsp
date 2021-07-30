<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션을 이용해 자동로그아웃 만들기 - 로그인</title>
</head>
<body>
	<h1>로그인</h1>
	<%
		if(session.getAttribute("idinfo") == null) {
	%>		
			<form action="jspPractice3-2.jsp">
				ID : <input type="text" name="id"><br>
				PW : <input type="password" name="pw"><br>
				<input type="submit" value="로그인">
			</form>
	<%		
		} else {
			String idinfo = (String)session.getAttribute("idinfo");
	%>
			<%=idinfo %>님이 로그인하셨습니다.
			<a href="jspPractice3-3.jsp">로그아웃</a><br>
		<%
			Date time = new Date();
			SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			time.setTime(session.getLastAccessedTime());
		%>
			세션 최근 접근시간 : <%= fmt.format(time) %> (5초뒤 로그아웃)
		<script type="text/javascript">
			setTimeout(logout, 5000); // 5초
			
			function logout() {
				alert("개인정보 보호를 위해 5초 동안 서비스 이용이 없어서 자동 로그아웃 되었습니다.");
				location.href = "jspPractice3-3.jsp"; // 로그아웃 페이지
			}
		</script>
	<%			
		}
	%>
	
</body>
</html>