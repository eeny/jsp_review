<%@page import="com.oreilly.servlet.MultipartResponse"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	/* MultipartRequest mrequest 
		= new MultipartRequest(
					request,
					경로,
					파일 업로드 최대 크기,
					인코딩 타입,
					중복 파일 관리 설정
				);
		이 객체가 생성됨과 동시에 설정한 경로에 파일이 업로드 된다!
	*/
	String dir = getServletContext().getRealPath("/upload");
	File f = new File(dir);
	
	if(!f.exists()) { // 실제 저 폴더가 존재하지 않는다면
		f.mkdir(); // 디렉토리 생성하기
	}
	
	String path = dir;
	int maxSize = 10 * 1024 * 1024; // 10MB = 10 * 1024 * 1024 byte
	String enc = "UTF-8";
	DefaultFileRenamePolicy dfrp = new DefaultFileRenamePolicy();
	// 중복 파일 관리 설정은 upload.jsp에서도 가능은 하지만 이게 더 간단하다!
	
	MultipartRequest mrequest = new MultipartRequest(
										request,
										path,
										maxSize,
										enc,
										dfrp
			);
	// 생성과 동시에 업로드 완료!
	// 이 코드 실행 후 MultipartRequest가 원래 쓰던 request를 대체한다.
	
	MultipartResponse mresponse = new MultipartResponse(response);
	// 이 코드 실행 후 MultipartResponse가 원래 쓰던 response를 대체한다.
	
	// DB랑 연동하기
	//String word = request.getParameter("word");
	// 원래 이렇게 썼는데 파일 업로드에서는 request를 쓸 수가 없다! 그래서~
	String word = mrequest.getParameter("word");
	out.println(word);
	
	
	String filename1 = mrequest.getOriginalFileName("myfile");
	// 원래 내가 업로드했던 파일명
	String filename2 = mrequest.getFilesystemName("myfile");
	// 실제 저장된 파일명
	
	// DB에는 실제적으로 두 파일명 다 저장해야한다! 사용자는 자기가 올린 파일명으로 받아야 하니까!
	// 따라서 나중에 파일명을 replace로 교체하는 작업이 필요하다! (안해도 되긴하는데 하면 사용자입장에서 좋다)
	
	System.out.println(filename1);
	System.out.println(filename2);
%>

<%-- <img src="<%=getServletContext().getRealPath("/upload")%>/<%=dto.getFileName()%>"> --%>

</body>
</html>