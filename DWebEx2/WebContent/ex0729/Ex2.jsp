<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<jsp:useBean id="member" class="com.company.Ex1Dto" />
<jsp:setProperty property="*" name="member" />
<!-- property�� name�� ���� ��쿡�� name�� ���� �����´�! �������� null, 0�̴� -->
<jsp:setProperty property="id" name="member" value="ididid" />
<!-- set�̶�~ value�� �޾ƿ��� ���� ���� �����ؼ� ���� ���� �ִ�! -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	usebean�� �̿��ؼ� �����°�
	<br> 
	���̵� : <%=member.getId()%><br> 
	��й�ȣ : <%=member.getPw()%><br> 
	�̸� : <jsp:getProperty property="name" name="member"/><br>
	<!-- �̷��� �� ���� ������ �ʹ� ��� �����ؼ� �Ⱦ��δ�! -->
	�̸� : <%=member.getName() %><br>
	<!-- �̰��� �����̴�! -->
	�̸� : ${member.name }<br>
	<!-- ǥ����(EL)�� ����ϸ� �ξ� ���ϴ�!(Ư����Ȳ���� �۵� �ȵ� ���� ����) -->
	�̸��� : <%=member.getEmail()%><br> 
	���� : <%=member.getAge()%>
</body>
</html>