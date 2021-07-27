<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>input태그 추가 삭제하기</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<button id="add">추가</button>
	<button id="delete">삭제</button>
	<br>
	
	<script type="text/javascript">
		$(function () {
			var i = 1;
			$("#add").click(function() {
				$("body").append("<div id='div" + i + "'>값: <input type='text' name='txt" + i + "'></div>");
				i++;
			});
			
			var j = 0;
			$("#delete").click(function() {
				j = $("div").length;
				$("div").remove("#div" + j);
				if(i < 2) {
					i = 1;
				} else {
					i--;
				}
			});
		});
	</script>
</body>
</html>