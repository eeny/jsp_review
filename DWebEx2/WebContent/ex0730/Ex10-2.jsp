<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String save = request.getParameter("save"); // true라는 문자열(boolean 아님!)
	%>
	
	<%=id %>/<%=pw %>/<%=save %>
	
	<%
		if(save == null && id.equals("idid") && pw.equals("pwpw")) { // 값이 null이 될 수 있다면 무조건 가장 먼저 비교해야 한다!
			Cookie cookie = new Cookie("saveid", id);
			cookie.setMaxAge(0); // 쿠키 지우기
			response.addCookie(cookie);	
			response.sendRedirect("Ex10.jsp");
		} else if(save!=null && save.equals("true") && id.equals("idid") && pw.equals("pwpw")) {
			Cookie cookie = new Cookie("saveid", id);
			cookie.setMaxAge(60*60*24); // 하루
			response.addCookie(cookie);	
			response.sendRedirect("Ex10.jsp");
		} else { // 아이디, 비번 틀렸을 때
	%>
			<script>
				alert("아이디 또는 비번 틀림");
				location.href = "Ex10.jsp";
			</script>
	<%
		}
	%>
</body>
</html>