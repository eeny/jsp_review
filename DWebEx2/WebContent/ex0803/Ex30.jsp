<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- <fmt:setLocale value="en" /> --%>
<!-- 현재 지역 세팅 - 없으면 기본 윈도우 OS의 지역을 따라간다! -->

<fmt:requestEncoding value="utf-8" />
<!-- request.setCharacterEncoding("UTF-8")이랑 같다! -->

<fmt:setBundle basename="resource.message" var="msg"/>
<!-- Bundle 파일을 불러와서 msg 변수에 담는다 -->

	<fmt:message bundle="${msg }" key="TITLE" var="title" />
	<!-- key안의 값을 var에 담는다 -->

<html>
<head>
<title>${title}</title>
</head>
<body>
	<fmt:message bundle="${msg }" key="GREETING" />
	<!-- properties의 key안의 값을 그대로 출력하기 -->
	<br>
	<c:if test="${! empty param.id}">
		<fmt:message bundle="${msg }" key="VISITOR">
			<fmt:param value="${param.id}" /> <!-- properties의 {0} -->
			<fmt:param value="${param.pw}" /> <!-- properties의 {1} -->
			<!-- fmt:message를 통해서 값을 가져오고 fmt:param을 통해서 값을 전달한다! -->
		</fmt:message>
	</c:if>
</body>
	</html>