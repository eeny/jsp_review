<%@page import="com.company.FDao"%>
<%@page import="com.oreilly.servlet.MultipartResponse"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 파일 업로드
	String dir = getServletContext().getRealPath("/upload");
	File f = new File(dir);
	if(!f.exists()) {
		f.mkdir();
	}
	
	String path = dir;
	int maxSize = 10*1024*1024;
	String enc = "utf-8";
	DefaultFileRenamePolicy dfrp = new DefaultFileRenamePolicy();
	
	MultipartRequest mreq = new MultipartRequest(request, path, maxSize, enc, dfrp);
	
	// testUpload.jsp에서 넘어온 값
	String title = mreq.getParameter("title");
	String writer = mreq.getParameter("writer");
	String content = mreq.getParameter("content");
	String myfile = mreq.getOriginalFileName("myfile");
	String copyfile = mreq.getFilesystemName("myfile");
	
	FDao dao = new FDao();
	int result = dao.uploadFile(title, writer, content, myfile, copyfile);
	if(result > 0) {
%>
		<script>
			alert("업로드완료");
			location.href = "testUpload.jsp";
		</script>
<%
	} else {
%>
		<script>
			alert("업로드실패");
			location.href = "testUpload.jsp";
		</script>
<%		
	}
%>