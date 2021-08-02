<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>제이쿼리로 쿠키 팝업창 만들기</title>
<style>
	* {
		margin: 0;
		padding: 0;
		box-sizing: border-box;
	}
	
	#wrap {
		width: 100%;
		height: 100vh;
		border: 1px solid red;
	}
	
	.pop_content {
		width: 300px;
		height: 300px;
		background-color: orange;
		position: absolute;
		top: 25%;
		left: 25%;
		display: none;
	}
	
	.pop_content_close {
		position: absolute;
		right: 0;
	}
	
	.chk {
		position: absolute;
		bottom: 0;
	}
</style>
</head>
<body>
	<div id="wrap">
		<p></p>
		<button class="delcookie">쿠키삭제</button>
		<div class="pop_content">
			레이어 팝업
			<button class="pop_content_close">&nbsp;X&nbsp;</button>
			<div class="chk">
				<input type="checkbox" id="howlong">
				<label for="howlong">24시간동안 보지 않기</label>
			</div>
		</div>
	</div>
	
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js"></script>
	<script>
		$(document).ready(function() {
			$("#wrap p").text("현재 쿠기값 : " + $.cookie('pop1'));
				
			if ($.cookie('pop1') == undefined) {
				$(".pop_content").fadeIn(500);
				$(".pop_content").draggable();
			}
			
			$(".pop_content_close").click(function() {
				if ($("#howlong").is(":checked") == true) {
					$.cookie('pop1', 'true', {
						expires : 1
					});
				}
				$(".pop_content").fadeOut(500);
			});
			
			$(".delcookie").click(function() {
				$.removeCookie('pop1');
			});
		});
	</script>
</body>
</html>