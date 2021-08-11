<%@page import="com.company.FBDto"%>
<%@page import="com.company.FDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="bean" class="com.company.FBDto"/>
<jsp:setProperty property="idx" name="bean"/>  
<jsp:include page="ftop.jsp" />
<%
	//int idx = Integer.parseInt(request.getParameter("idx"));
	//FDao dao = new FDao();
	// 이 페이지는 idx를 가지고 select한 결과를 출력하는 페이지
	// 무조건 1줄이다! idx는 유일키니까
%>
<c:set var="dto" value="<%=new FDao().getContent(bean.getIdx()) %>"/>
<c:choose>
	<c:when test="${dto ne null }">
		<table border="1">
			<tr>
				<td>${dto.idx }</td>
				<td>${dto.title }</td>
				<td>${dto.fmember_name }(${dto.fmember_id })</td>
				<td>${dto.regdate }</td>
			</tr>
			<tr>
				<td colspan="4">${dto.content }</td>
			</tr>
		</table>
		<!-- 글쓴이 -->
		<c:if test="${sessionScope.logindata.id eq dto.fmember_id}">
			<a href="fupdate.jsp?idx=${dto.idx }">수정</a>
			<a href="fdelete_proc.jsp?idx=${dto.idx }">삭제</a>			
		</c:if>
		<!-- 관리자 -->
		<c:if test="${sessionScope.logindata.lv eq 10 }">
			<a href="fupdate.jsp?idx=${dto.idx }">수정</a>
			<a href="fdelete_proc.jsp?idx=${dto.idx }&fid=${dto.fmember_id}">삭제</a>
		</c:if>
		<a href="fmain.jsp">처음으로</a>
	</c:when>
	<c:otherwise>
		<script>
			alert("잘못된 접근입니다.");
			location.href = "fmain.jsp";
		</script>
	</c:otherwise>
</c:choose>


<jsp:include page="fbottom.jsp" />