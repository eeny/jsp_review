<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		/* 
			int result = (int)request.getAttribute("data");
			여기에는 이제 result 값인 1 또는 0이 들어있다.
			=> ${ requestScope.data }
			
			lt 또는 <
			gt 또는 >
		*/
	%>
	
	<c:choose>
		<c:when test="${ requestScope.data lt 1}">
			<script>
				alert("오류발생!");
				history.back();
			</script>		
		</c:when>
		<c:otherwise>
			<script>
				alert("삭제되었습니다.");
				location.href="SelectMember";
			</script>
		</c:otherwise>
	</c:choose>
	
	
</body>
</html>