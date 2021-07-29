<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	여기서는 넘어온 값들(100% 문자열)을 받아서 변수에 담고 사용한다.<br>
	받을 때 쓰는 것이 request이다.<br><br><br>
	<%
		request.setCharacterEncoding("UTF-8");// 한글 처리
	
		String id = request.getParameter("id");// name
		String pw = request.getParameter("pw");// name
		// 웹페이지에 입력한 값을 다음페이지에서 자바로 가져올 수 있다.
		// 같은 페이지에서는 자바로 절대 가져올 수 없다!
		
		if(id == null || id.length()<2) {
			out.println("잘못된 아이디 입니다.");
		}
	%>
	
	<%= id %>/<%= pw %><br><br><br>
	넘어온 값들을 자바에서 DB에 넣거나 잘못 입력한 값들을 필터링하는 등<br>
	넘어온 값을 이용해서 자바에서 모든 작업을 할 수 있다!
</body>
</html>