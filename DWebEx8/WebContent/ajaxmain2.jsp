<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<form action="ajaxproc.jsp">
		아이디<input type="text" name="id" id="aja">
		<input type="submit" value="전송">		
	</form>
	<br>
	<div id="res1">idx 나올 부분</div>
	<div id="res2">id 나올 부분</div>
	
	<script>
		$(function() {
			$("#aja").keyup(function() { // 키를 눌렀다가 뗄 때 발생
				//$("#res").text($("#aja").val()); // 테스트 코드
				
				var params = "idx=" + $("#aja").val();
				
				// Ajax
				$.ajax({
					type: "post", // method
					url: "ajaxproc3.jsp",
					data: params, // 넘길 값. 우리는 나중에 id를 넘길 것이다.
					dataType: "json", // 돌려받을 결과의 타입
					
					success: function(args){ // 문제 없이 이전 페이지의 결과를 가져왔다면 실행
						// 결과는 args에 담긴다
						$("#res1").text(args.result3);
						$("#res2").text(args.result4);
					}, 
					error: function(args){ // 문제 발생했을 때 실행
						// 에러 내용이 args에 담긴다
						$("#res1").text(args.responseText + "에러!");
					}
					});
				}
			);
		});
	</script>
</body>
</html>