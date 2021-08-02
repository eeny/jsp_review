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
		if(session.getAttribute("idinfo") == null) {
			// 돌려보내는 방법1 - 오류페이지로 보내기
			response.sendRedirect("Ex12-5.jsp");
	%>
			<!-- 돌려보내는 방법2 -->
			<!-- <script type="text/javascript">
				alert("잘못된 접근입니다. 로그인해야 합니다.");
				location.href = "Ex12.jsp";
			</script> -->
	<%		
		} else {
			String id = (String)session.getAttribute("idinfo");
	%>
			여기는 <%=id %> 로 로그인한 이후 개인정보 확인하는 페이지<br>
			id : xxx <br>
			pw : xxx <br>
			name : xxx <br>
			이런 식이다 <br>
			<a href="Ex12.jsp">돌아가기</a>
	<%		
		}
	%>
</body>
</html>