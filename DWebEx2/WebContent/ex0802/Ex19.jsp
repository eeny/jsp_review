<%@page import="com.company.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>p267 EL에서 객체의 메서드 호출 예제</title>
</head>
<body>
	<%
		Thermometer thermometer = new Thermometer(); // 생성
		request.setAttribute("t", thermometer); // 생성된 객체를 request에 담는다
		// 오로지 EL로 쓰기 위해 이런 작업을 거친다!
		
		// out.println(thermometer.getCelsius("서울")); // 이렇게 해도 결과는 같다.
	%>
	
	${t.setCelsius('서울', 27.3) } <!-- 메서드 사용하기 -->
	서울 온도: 섭씨 ${t.getCelsius('서울') }도 / 화씨 ${t.getFahrenheit('서울') }
	
	<br>
	정보: ${t.info }
	<!-- 
		toString() 메서드와 유사하다. 기본적으로 들고 있는 메서드!
		toString을 출력하고 싶으면 생성된 객체를 출력하면 된다! => 주소값이 출력된다.
		toString()을 오버라이딩으로 내용을 바꿔주면 객체 변수를 출력했을 때 원하는 값이 나온다.
		
		이처럼 getInfo()도 info를 출력하면 getInfo()메서드를 실행한 것과 같은 결과가 출력된다!
		
		<직접 만든 메서드가 static일 경우 사용하는 방법 2가지 (p270~273)>
		- 1번째 방법
			1) 클래스 만들기 - static 메서드가 포함된 클래스
			2) TLD(Tag Library Descriptor) 파일 만들기 - xxx.tld 파일
			3) web.xml에 등록하기
			4) jsp페이지에서 불러오기 - 정확하게는 taglib 사용 설정
			5) EL을 이용해서 출력하기
			이렇게 하면 좋은 점? 자주 쓰는 경우에 위와 같이 등록해 두면 바로바로 사용이 가능하다!
			또, 어디서든지 사용이 가능하다!
		
		- 2번째 방법은 해당 페이지에서만 사용 가능한 방법이다.
			1) import
			2) 사용
	-->
</body>
</html>