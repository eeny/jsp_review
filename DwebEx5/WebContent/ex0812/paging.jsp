<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int totalCount = 256; // 전체 데이터의 양
	// select count(*) from fboard;
	
	int pageRow = 10; // 한 페이지에 출력될 행의 개수
	 
	int nowPage = 1; // 시작 페이지 번호
	
	// 첫번째 방법
	int totalPage = (int)Math.ceil(totalCount / (double)pageRow); // 전체 페이지 개수 - 26페이지가 나온다!
	
	// 두번째 방법 - 정수로 나눴기 때문에 소수점 짤린다!
	/* int totalPage = totalCount / pageRow;
	if(totalCount % pageRow > 0) { // 나머지가 있다면
		totalPage++;
	} */
	
	int countPage = 10; // 한 페이지에 출력될 페이징 번호의 개수

	if(request.getParameter("nowPage") != null) { // 현재 페이지 번호를 받는 부분
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}

	// nowPage 값에 따라서 바뀌므로 반드시 nowPage request 이후에 작성해야 한다!
	int startPage = ((nowPage - 1) / countPage) * countPage + 1;
	// 계산 공식
	// 1 nowPage <= 10 일 경우 === start는 1
	//((nowPage - 1) / countPage) * countPage + 1 = 1
	// 11 11 <= nowPage <= 20 일 경우 ==== start는 11
	//((nowPage - 1) / countPage) * countPage + 1
	//			10/10 * 10 + 1 = 11
	// 21 21 <= nowPage <= 30 일 경우 ==== start는 21
	// 31 31 <= nowPage <= 40 일 경우 ==== start는 31
	
	int endPage = startPage - 1 + countPage;
	if(endPage > totalPage) {
		endPage = totalPage;
	}
	
	
	if(nowPage > 1) { // [처음] 버튼은 2페이지부터 나타나면 된다!
		
%>	
		<a href="paging.jsp?nowPage=1" style="color: green;">[처음]</a>
		<a href="paging.jsp?nowPage=<%=nowPage-1 %>" style="color: orange;">[이전]</a>
<%	
	}
	
	
	
	//for(int i = 1; i <= totalPage; i++) { // 전체 페이징 번호 다 출력되는 것
	for(int i = startPage; i <= endPage; i++) {
		if(nowPage == i) {
%>
			<span style="color: red;font-weight: bolder;">[<%=i %>]</span>		
<%			
		} else {
			
%>
			<a href="paging.jsp?nowPage=<%=i%>" style="color: blue">[<%=i %>]</a>
<%		
		}
	}
	
	if(nowPage < totalPage) { // [끝] 버튼은 마지막페이지 이전까지만 나타나게!
		
%>
		<a href="paging.jsp?nowPage=<%=nowPage+1 %>" style="color: orange;">[다음]</a>
		<a href="paging.jsp?nowPage=<%=totalPage %>" style="color: green;">[끝]</a>
<% 
	}
%>
</body>
</html>