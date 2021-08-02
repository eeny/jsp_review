<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션을 이용해 자동로그아웃 만들기 - 세션 확인</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		if(id == null || pw == null || id.equals("") || pw.equals("")) {
	%>
			<script type="text/javascript">
				alert("아이디 또는 비밀번호를 입력하세요");
				location.href = "jspPractice3.jsp";
			</script>
	<%				
		} else {
			session.setAttribute("idinfo", id);
			response.sendRedirect("jspPractice3.jsp");
		}
	%>
</body>
</html>
