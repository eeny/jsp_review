<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	for �� => forEach �� ����Ʈ 12.3 �ۼ� 304������
	<br>
	<hr>

	�׳� ���� ����
	<c:forEach var="i" begin="1" end="100" step="2">
		<c:out value="${i}" />
	</c:forEach>

	<%
		int arr[] = { 11, 22, 33, 44, 55, 66, 77, 88, 99, 100 };
	%>

	�迭���� �� �ٰ�������
	<c:set var="arr" value="<%=arr%>" />

	<c:forEach var="i" items="${arr}" begin="0" end="9" varStatus="status">
      ${status.index} / ${status.count} / ${i}<br>
	</c:forEach>

	<br>
	status.index = �迭�� ��ȣ - 0���� ����
	<br>
	status.count = �迭�� ī��Ʈ �ϴ� ���� - 1���� ����
	<br>
	i = items�� �ִ� for�������� i�� �迭���� ���� ���� �ϳ��� �����´�.
	<%
		// �ڹٿ����� forEach
		for (int x : arr) {// arr�� ����� / int x�� �ϳ��� �����ö� �� ��ü�� ��
			
		}
	%>

	<%
		HashMap map = new HashMap();
		map.put("aaa", "��ȫ��");
		map.put("bbb", "�ڼ���");
		map.put("ccc", "�̻���");
	%>

	map���� ��ü �� ��������
	<c:set var="maps" value="<%=map%>" />
	<c:forEach var="i" items="${maps}">
      ${i.key} = ${i.value}<br>
	</c:forEach>
</body>
</html>




