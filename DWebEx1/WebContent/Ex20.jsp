<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	하이
	<%-- <jsp:forward page="Ex18.jsp">
		<jsp:param value="home" name="val"/>
	</jsp:forward> --%>
	
	<!-- 실행하면 Ex18.jsp 페이지가 바로 뜨고, 뒤로가기/앞으로가기 버튼이 비활성화 상태이다! -->
	<!-- POST 방식으로 전송되므로 주소줄에 넘기는 값이 안보인다! -->
	
	<%
		response.sendRedirect("Ex18.jsp?val=home");
	%>
	
	<!-- 왜 이런 걸 굳이 쓰느냐?
		우리가 지금 하는 것은 jsp이다!
		jsp에서는 굳이 java코드를 쓰고싶지 않다!
		어차피 html이랑 코드가 유사하니까 그냥 java코드에서 있는 기능들을 
		jsp전용 코드로 바꿔서 사용하기 위해서 
		response~ 이런거보다 jsp:forward 이런걸 쓴다! -->
</body>
</html>