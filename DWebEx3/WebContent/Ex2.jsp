<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 입력받아서 이름 수정하기</title>
</head>
<body>
	<%
		String id=request.getParameter("id");
		if(id==null){
			id="";
		}
	%>
	<form action="Ex2-2.jsp">
		아이디<input type="text" name="id" value="<%=id%>"><br>
		이름<input type="text" name="name"><br>
		<input type="submit">
	</form>
</body>
</html>