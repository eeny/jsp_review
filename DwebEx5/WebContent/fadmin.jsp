<%@page import="com.company.FDao"%>
<%@page import="com.company.FDto"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="ftop.jsp"/>
<%
	FDto logindata = (FDto)session.getAttribute("logindata");
	// 로그인을 했다면 값이 있을거고 없으면 null
	if(logindata == null || logindata.getLv() != 10) {
%>
		<script>
			alert("잘못된 접근입니다.");
			location.href = "fmain.jsp";
		</script>
<%		
	} else {
	
	FDao dao = new FDao();
	
	// 페이징 처리
	double totalCnt = (double)dao.getTotalCnt("fmember"); // 총 회원 수
	int curPage = 5; // 한페이지에 5명씩
	int totalPage = (int)Math.ceil(totalCnt/curPage); // 총 페이지개수
	
	int pnum = 1;
	
	if(request.getParameter("pnum") != null) {
		pnum = Integer.parseInt(request.getParameter("pnum"));
	}
	
	Vector<FDto> v = dao.getAllFmember(pnum, curPage);
%>
	관리자 페이지
	<table border="1">
		<tr>
			<td>번호</td>
			<td>아이디</td>
			<td>이름</td>
			<td>이메일</td>
			<td>권한</td>
		</tr>
		<c:forEach var="i" items="<%=v %>">
			<tr>
				<td>${i.idx }</td>
				<td>${i.id }</td>
				<td>${i.name }</td>
				<td>${i.email }</td>
				<td>${i.lv }</td>
			</tr>
		</c:forEach>
	</table>
	<a href="fmain.jsp">처음으로</a>
<% 
		if(totalPage > 5) { // 한 페이지에 5쪽만 나오게
			totalPage = 5;
		}

		for(int i=1; i<=totalPage; i++) {
%>
			<a href="fadmin.jsp?pnum=<%=i%>">[<%=i %>]</a>
<%		
		}
		if(totalPage > 5) {
%>
			<a href="fadmin.jsp?pnum=6">[다음]</a>
<%				
		}
	} %>
<jsp:include page="fbottom.jsp"/>