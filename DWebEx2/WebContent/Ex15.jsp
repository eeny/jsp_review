<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="org.jsoup.Jsoup"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 로또 페이지 소스 전부 긁어오기(크롤링) -->
	<%
		String url = "https://dhlottery.co.kr/gameResult.do?method=byWin&wiselog=H_C_1_1";
		Document doc = null;
		
		doc = Jsoup.connect(url).get();
	%>
	==============이하의 내용이 긁어온 것===============<br>
	<%
		Elements numbers = doc.select("div.win_result");
		// 텍스트만 그대로 긁어오기
		for(Element number : numbers) {
			out.print(number.text());
		}
		// html 태그까지 긁어오기
		for(Element number : numbers) {
			out.print(number);
		}
	%>
	
	<!-- 왜 이런걸 하는가? 우리가 어디선가 많은 정보를 가져와야할 때 불법이지만... 편하게 뽑아올 수 있다! -->
</body>
</html>