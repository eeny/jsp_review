<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input type="button" value="링크" onclick="myFunc()">
	
	<script type="text/javascript">
		function myFunc() {
			//location.href = "ex0727/Ex7-2.jsp?id=ididid&pw=pwpwpwpw";
			
			// 스크립트에서 form없이 값을 넘기기 위해서는 GET을 사용한다!
			// 일단 넘기는 name을 안다는 가정하에 가능하다.
			// name = id / name = pw
			// name과 value를 주소줄에 직접 써서 넘길 수 있다.
			// 시작은 반드시 ?로 시작해서 연결은 &로 한다.
					
			location.href = "https://search.naver.com/search.naver?oquery=apple";
			// 이런식으로 바로 결과로 넘어갈 수도 있다!
		}
	</script>
</body>
</html>