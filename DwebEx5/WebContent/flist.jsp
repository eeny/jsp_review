<%@page import="com.company.FBDto"%>
<%@page import="java.util.Vector"%>
<%@page import="com.company.FDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="ftop.jsp"/>
<table border="1">
	<tr>
		<td>번호</td>
		<td>제목</td>
		<td>글쓴이</td>
		<td>날짜</td>
	</tr>

	<%
		FDao dao = new FDao();
	
		// 페이징 처리
		double totalCnt = (double)dao.getTotalCnt("fboard"); // 총 게시글 수
		int curPage = 5; // 한 페이지에 출력할 개수
		int totalPage = (int)Math.ceil(totalCnt/curPage); // 총 페이지 개수
	
		int pblock = 1; // 1 ~ 5 페이지
		// pblock = 2 일 때는 6 ~ 10 페이지
		
		int pnum = 1;
		
		if(request.getParameter("pnum") != null) {
			pnum = Integer.parseInt(request.getParameter("pnum"));
		}
	
		Vector<FBDto> v = dao.getFboardAll(pnum, curPage);

		if (v.size() > 0) {
	%>
	
	<c:forEach var="i" items="<%=v%>">
		<tr>
			<td>${i.idx }</td>
			<td>
				<a href="fread.jsp?idx=${i.idx }">${i.title }</a>
			</td>
			<td>${i.fmember_name }</td>
			<td>${i.regdate }</td>
		</tr>
	</c:forEach>
	<%
		} else {
	%>
	<tr>
		<td colspan="4">게시글이 없습니다.</td>
	</tr>
	<%
		}
	%>

</table>

<a href="fmain.jsp">메인으로</a>
<a href="flist.jsp?pnum=1">[처음]</a>

<%
	if(totalPage > 5) { // 한 번에 5쪽만 나오게 설정
		totalPage = 5;
	}
	
	for(int i=1; i<=totalPage; i++) {
%>
		<a href="flist.jsp?pnum=<%=i%>">[<%=i %>]</a>
<%
	}
	if(pnum >= 5) {
%>
		<a href="flist.jsp?pnum=6">[다음]</a>
<%
	}
%>
<br>
총게시글수: <%=totalCnt %> / 총페이지수: <%=totalPage %> / 현재페이지: <%=pnum %>
<!-- 
	한 페이지에 나올 개수? 5개 - 이거는 미리 정해야 한다!
	현재 개수는 1 ~ 34까지 총 34개다!
	한 페이지에 5개 총 34개면 전체 페이지는 7페이지이다!
	34 / 5 = 6.8 => 7
	31 / 5 = 6.2 => 7
	따라서 DB에서 총 개수 가져오기 (select count(idx) from fboard);
	여기서 5는 정해진 값! => 무조건 올림!
 -->
<jsp:include page="fbottom.jsp"/>