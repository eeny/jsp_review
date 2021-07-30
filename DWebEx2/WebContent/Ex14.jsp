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
	<!-- 페이지 소스 전부 긁어오기(크롤링) -->
	<%
		String url = "https://finance.naver.com/item/main.nhn?code=005930";
		Document doc = null;
		
		doc = Jsoup.connect(url).get(); // 전체 내용을 읽어온다.
		
		// out.println(doc); // 그냥 실행하는 것과 같음
	%>
	<%//= doc %>
	Elements = 복수형 = CSS의 선택자를 통해서 값을 가져올 때 그것이 여러개면 이거<br>
	Element = 단수형 = CSS의 선택자를 통해서 값을 가져올 때 그것이 한개면 이거<br>
	Elements에서 하나 가져오면 그게 Element이다.<br>
	==============이하의 내용이 긁어온 것===============<br>
	<%= doc.select("title").text() %><br>

	<%
		Elements titles = doc.select("title");
		Element title = titles.get(0);
	%>
	<%= title.text() %><br>
	
	<%
		Elements companies = doc.select(".tb_type1 .left");
		for(Element company : companies) {
			out.print(company.text() + "<br>");
		}
	%>
	
	<!-- 
		왜 이런걸 하는가? 우리가 어디선가 많은 정보를 가져와야할 때 불법이지만... 
		편하게 뽑아올 수 있다!
		원래는 파이썬으로 처리한다!
	-->
</body>
</html>