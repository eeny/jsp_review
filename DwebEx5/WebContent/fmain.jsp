<%@page import="com.company.FDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="ftop.jsp"/>
		<div class="member">

<%
	FDto dto = (FDto)session.getAttribute("logindata");
	if(dto == null) {
%>
			<form action="flogin_proc.jsp">
				아이디<input type="text" name="id">
				비밀번호<input type="password" name="pw">
				<input type="submit" value="로그인">
				<input type="button" value="회원가입" onclick="location.href='fregist.jsp'">
			</form>
<%		
	} else {
%>
			<%=dto.getName() %>님 반갑습니다.
			<input type="button" value="로그아웃" onclick="location.href='flogout.jsp'">
<% 
			if(dto.getLv() == 10) {
%>
				<input type="button" value="관리자" onclick="location.href='fadmin.jsp'">
<%
			}
	} 
%>			
		</div>
		<div class="newtext">
			최신글(10개) - <a href="flist.jsp">더보기</a>
			<jsp:include page="fmainnew.jsp"/><br>
			<%
				if(session.getAttribute("logindata") != null) {
			%>
				<a href="fwrite.jsp">글쓰기</a>
			<%		
				}
			%>
		</div>
<jsp:include page="fbottom.jsp"/>









