<%@page import="com.member.MemberDto"%>
<%@page import="java.util.Vector"%>
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
		<c:when test="${empty sessionScope.userInfo }">
			<form action="Login" method="post">
				아이디<input type="text" name="id"><br>
				비밀번호<input type="text" name="pw"><br>
				<input type="submit" value="로그인">
			</form>		
		</c:when>
		<c:otherwise>
			${sessionScope.userInfo.name }님 반갑습니다!
			<a href="Logout">로그아웃</a>
		</c:otherwise>
	</c:choose>
		
	<h4><a href="Insert">회원가입하기</a></h4>
	<h1>회원목록</h1>
	<table border="1" cellspacing="0">
		<tr>
			<th>회원번호</th><th>아이디</th><th>이름</th><th>이메일</th><th>비고</th>
		</tr>
		<c:choose>
			<c:when test="${requestScope.data.size() lt 1 || requestScope.data eq null}">
				<%-- 
					${requestScope.data}는
					Vector<MemberDto> v = request.getAttribute("data"); 와 같다!
				 --%>
				<tr>
					<td colspan="5">등록된 회원이 없습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="dto" items="${requestScope.data }">
				<%-- 
					따로 begin/end를 설정하지 않아서 items의 사이즈만큼 반복된다!
					${requestScope.data}에는 결과인 v가 담겨있고, 
					하나씩 빼온 것을 dto라는 변수에 담았다! v.get(i) == dto
				 --%>
					<tr>
						<td>${dto.idx }</td>
						<td>${dto.id }</td>
						<td>${dto.name }</td>
						<td>${dto.email }</td>
						<td><a href="Delete?idx=${dto.idx }">삭제</a></td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</body>
</html>