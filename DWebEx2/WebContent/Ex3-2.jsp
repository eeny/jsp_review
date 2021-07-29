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
		
		if(id.equals("idid") && pw.equals("pwpw")) {
			// 쿠키 생성하기
			Cookie cookie = new Cookie("idinfo", id);// 키와 밸류
										// 뒤의 value값인 id는 실제 입력한 id값
			response.addCookie(cookie);			
			
			out.println("추가완료");
		} else {
	%>
			<script>
				alert("아이디 비번 틀림");
				history.back(); // input창 입력내용 남아있음
				//history.go(-1);
				//location.href = "Ex3.jsp"; // input창 다 지워짐
			</script>
	<%
		}
	%>
</body>
</html>