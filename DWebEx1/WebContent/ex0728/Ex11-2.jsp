<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		if(id.equals("")) {
	%>
		<script>
			alert("아이디 비었음");
			
			//history.back();
			// 브라우저의 뒤로 가기 버튼이랑 같다.
			
			//location.href = "Ex11.jsp";
			// 페이지를 바꿔버린다!
			// 원래 페이지로 갈 필요가 없을 때 사용한다.
			
			<% response.sendRedirect("Ex11.jsp?id=aaa"); %>
			// 무조건 자바코드가 우선이다! 스크립트를 무시한다.
			// 그래서 alert()이 실행되지 않는다!
			// GET방식으로 주소줄에 값을 넣을 수도 있다.
			
			// 3개의 차이점을 반드시 확인하고 필요에 따라서 사용하자!
		</script>
	<%
			out.print("값없음");
		}
	%>
</body>
</html>