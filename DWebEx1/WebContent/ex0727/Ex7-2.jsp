<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String gender = request.getParameter("gender");
		// null값 또는 공백(빈값)이 넘어오면 500에러 발생하므로 처리해줘야 한다!
		// 나중에 자바스크립트로 처리를 하면 이렇게 자바 코드가 안길어져도 된다!
		int age = 0;
		if(request.getParameter("age") != null && !request.getParameter("age").equals("")) {
			age = Integer.parseInt(request.getParameter("age")) + 2;				
		}	
		String ad = request.getParameter("ad");
		// String fruits = request.getParameter("fruits");
		// 이건 값을 한 개만 받아온다.
		String[] fruits;
		if(request.getParameterValues("fruits") != null) {
			fruits = request.getParameterValues("fruits");	
			// getParameterValues는 선택한 값만큼만 배열로 가져온다
			for(int i=0; i<fruits.length; i++) {
				out.println(fruits[i] + ":");
			}
		}
	%>
	<!-- checkbox에서 선택한 것의 순서가 0부터이다! -->
	<%= id %>/<%= pw %>/<%= gender %>/<%= age %>/<%= ad %>/
</body>
</html>