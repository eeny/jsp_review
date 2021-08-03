<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>p325 fmt:formatNumber 예제</title>
</head>
<body>
	<c:set var="price" value="10000"/>
	<fmt:formatNumber value="${price }" type="number" var="numberType"/>
	<br>
	통화 : <fmt:formatNumber value="${price }" type="currency" currencySymbol="원"/>
	<br>
	퍼센트 : <fmt:formatNumber value="${price }" type="percent" groupingUsed="false"/>
	<br>
	숫자 : ${numberType }
	<br>
	패턴 : <fmt:formatNumber value="${price }" pattern="00000000.00"/>
</body>
</html>