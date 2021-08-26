<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
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
				location.href="SelectAjax";
			</script>
		</c:otherwise>
	</c:choose>

</body>
</html>