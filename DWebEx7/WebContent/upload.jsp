<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
		일이 너무 많아서 파일 업로드를 직접 구현하지는 않는다!
		일반적인 타입은 name을 기준으로 넘겨서 받아 처리한다.
		하지만, 파일 업로드의 경우 스트림으로 넘겨서 처리해야 한다!
		스트림으로 넘어온 파일 데이터를 다시 원래 형식으로 복구시키고 저장을 하면 된다.
		이러한 작업이 너무 많기 때문에 라이브러리를 이용해 해결한다!
		=> cos.jar 또는 commons 파일 업로드 라이브러리들이 있다.
		(cos는 사용하기 쉽고, commons는 cos보다 사용은 어렵지만 더 안정적이라 많이 쓰인다.)
		(cos는 jsp에서 사용할거고 commons는 server에서 할 예정이다!)
		
		파일 업로드를 할 때는 반드시 POST 방식이다! 
		왜? 내용이 많기 때문에!(그림이 String으로 바뀌면서 글자가 엄청 많아진다)
		enctype 속성을 반드시 추가해야 한다!
	 -->
	<form action="upload_proc.jsp" method="post" enctype="multipart/form-data">
		글씨 <input type="text" name="word"><br>
		파일 <input type="file" name="myfile"><br>
		<input type="submit" value="업로드">
	</form>
	
	<hr>
	<form action="upload_proc2.jsp" method="post" enctype="multipart/form-data">
		글씨 <input type="text" name="word"><br>
		파일 <input type="file" name="myfile"><br>
		<input type="submit" value="업로드">
	</form>
	<pre>
	여기서 파일 중복처리 하는 경우도 있다.
	id + 현재시간의 밀리초로 파일명을 바꿔서 업로드를 한다!
	<%= getServletContext().getRealPath("/upload") %>
	</pre>
	
	<hr>
</body>
</html>