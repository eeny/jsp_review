<%@page import="com.company.MemberDto"%>
<%@page import="java.util.Vector"%>
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

<c:choose>
	<c:when test="${empty sessionScope.userInfo}">
		<form action="LoginMember" method="post">
			아이디<input type="text" name="id"><br>
			비밀번호<input type="text" name="pw"><br>
			<input type="submit" value="로그인"><br>
		</form>	
	</c:when>
	<c:otherwise>
		${ sessionScope.userInfo.name }님 반갑습니다.
		<a href="LogoutMember">로그아웃</a>
		<br><br>
		<a href="InsertMember">글쓰기 페이지로 가기</a><br><br><br>
	</c:otherwise>
</c:choose>
 
select 페이지<br><br>

&lt;&#37;Vector<MemberDto> v = (Vector<MemberDto>)request.getAttribute("data");&#37;&gt; 를 &#36;{requestScope.data}로 바꿀수 있다.
<br><br>


<table border="1">
	<tr>
		<td>번호</td>
		<td>아이디</td>
		<td>비밀번호</td>
		<td>이름</td>
		<td>이메일</td>
		<td>삭제</td>
	</tr>
	<%
	// requestScope.data 에는 결과 v-Vector 가 담겨있다.
	// 하나씩 빼온거를 dto 라는 변수에 담았다. v.get(i) == dto
	%>
	<c:forEach var="dto" items="${ requestScope.data }">
		<tr>
			<td>${ dto.idx }</td>
			<td>${ dto.id }</td>
			<td>${ dto.pw }</td>
			<td>${ dto.name }</td>
			<td>${ dto.email }</td>
			<td><a href="DeleteMember?idx=${ dto.idx }">삭제</a></td>
		</tr>
	</c:forEach>
</table>

	<c:if test="${ requestScope.pageData.nowPage gt 1 }">
		<a href="SelectMember?nowPage=1" style="color: green;">[처음]</a>
		<a href="SelectMember?nowPage=${ requestScope.pageData.nowPage-1 }" style="color: orange;">[이전]</a>
	</c:if>
	
	
	<c:forEach var="i" begin="${ requestScope.pageData.startPage}" end="${ requestScope.pageData.endPage}">
		<c:choose>
			<c:when test="${ requestScope.pageData.nowPage eq i}">
				<span style="color:red">[${ i }]</span>
			</c:when>
			<c:otherwise>
				<a href="SelectMember?nowPage=${ i }" style="color: blue">[${ i }]</a>
			</c:otherwise>
		</c:choose>			
	</c:forEach>
	
	
	<c:if test="${ requestScope.pageData.nowPage lt requestScope.pageData.totalPage }">
		<a href="SelectMember?nowPage=${ requestScope.pageData.nowPage+1 }" style="color: orange">[다음]</a>
		<a href="SelectMember?nowPage=${ requestScope.pageData.totalPage }" style="color: green">[끝]</a>
	</c:if>
	
</body>
</html>






