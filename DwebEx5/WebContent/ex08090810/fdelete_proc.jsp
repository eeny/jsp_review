<%@page import="com.company.FDto"%>
<%@page import="com.company.FDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/* 
		if(session.getAttribute("logindata") == null) {
			<script>alert("로그인해주세요");</script>
		}
		이런식으로 처리하면 아무 아이디나 로그인한 이후에 idx를 넘겨서 지울 수 있는 문제가 생긴다!
	*/

	FDto dto = (FDto)session.getAttribute("logindata");
	
	int idx = Integer.parseInt(request.getParameter("idx"));
	String fid = request.getParameter("fid");
	
	FDao dao = new FDao();
	
	int result = 0;
	
	if(dto.getLv() == 10) { // 관리자
		result = dao.deleteBoard(idx, fid);
	} else { // 일반회원
		result = dao.deleteBoard(idx, dto.getId()); 		
	}
	// delete from fboard where idx = ? and fmember_id = ?;
	// delete from fboard where idx = 3 and fmember_id = null;
	// delete from fboard where idx = 3 and fmember_id = 로그인한 사람의 id;
	
	if(result > 0) {
		response.sendRedirect("fmain.jsp");
	} else {
%>
		<script>
			alert("문제 발생");
			location.href = "fmain.jsp";
		</script>
<%		
	}
%>