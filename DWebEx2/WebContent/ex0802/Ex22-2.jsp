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
	<!-- 
		아이디/패스워드/이메일/나이/몸무게
		몸무게 => 파운드로 바꿔서 출력
		나이 => 만나이로 출력 -2
		아이디/패스워드/이메일은 그대로
		아이디가 idid가 아니면 이전 페이지로 돌아가기 - 자바스크립트 사용하기
		나이도 만 20세 미만이면 alert("성인만 가입가능합니다.") 출력 후 돌아가기 	
	-->
	<%= request.getParameter("id") %>
	
	아이디: 
	<c:choose>
		<c:when test="${param.id ne 'idid'}">
			<script>
				alert("잘못된 아이디");
				history.back();
			</script>
		</c:when>
		<c:otherwise>
			${param.id }<br>
			
			<!-- 조건이 총 2개인데 따로 걸리니까 한번에 조건을 따질 수 있도록 -->
			나이: 
			<c:choose>
				<c:when test="${param.age < 20 }">
					<script>
						alert("성인만 가능");
						history.back();
					</script>
				</c:when>
				<c:otherwise>
					${param.age - 2 }<br>
				</c:otherwise>
			</c:choose>
		</c:otherwise>
	</c:choose>
	
	패스워스: ${param.pw }<br>
	
	이메일: ${param.email }<br>
	
	몸무게: 
	${param.weight * 2.20462 } 파운드(1kg = 2.20462파운드)
	
	<!-- 이렇게 만들었을 때 장점은? 형변환이 필요없다! -->
</body>
</html>