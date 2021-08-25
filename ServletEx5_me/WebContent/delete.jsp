<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${requestScope.data lt 1 }">
			<script type="text/javascript">
				alert("에러 발생!");
				history.back();
			</script>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
				alert("회원정보가 삭제되었습니다.");
				location.href = "Select";
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>