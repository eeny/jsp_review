<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
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
	boolean isMultipart = ServletFileUpload.isMultipartContent(request);
	// 이전 페이지로부터 넘어온 값의 타입이 multipart가 맞는가?
			
	File tmpFolder = new File("/tmp"); // 임시 폴더
	int maxFileSize = 1024 * 1024 * 10; // 10mb
	int maxBufferSize = 1024 * 1024; // 1mb
	
	if(isMultipart) {
		DiskFileItemFactory factory = new DiskFileItemFactory(); // 업로드 기능 제공
		factory.setSizeThreshold(maxBufferSize); // 버퍼 세팅
		factory.setRepository(tmpFolder); // 저장 임시 폴더
		
		ServletFileUpload upload = new ServletFileUpload(factory); // 팩토리 연결
		upload.setFileSizeMax(maxFileSize); // 업로드될 파일 크기 설정
		// 여기까지 업로드 준비 끝!
		
		List<FileItem> items = upload.parseRequest(request);
		// request로 넘어온 모든 정보를 잘라서 items에 넣는다!
		
		Iterator<FileItem> iter = items.iterator(); // 반복자 설정(몇 개가 들었는지 모르니까 Iterator타입)
		
		while(iter.hasNext()) { // 넘어온 게 있다면~
			FileItem fitem = iter.next();
		
			// 비교 - 파일인가? 글씨인가?
			if(fitem.isFormField()) { // formField일 경우 일반 input이다. ex) text, radio, ...
			// 방법 1)	
			//out.print("글씨 : " + fitem.getString() + "<br>");
			
			// 방법 2)
			out.print("넘어온 글씨 name : " + fitem.getFieldName() + "<br>"); // name
			out.print("넘어온 글씨 name의 값 : " + fitem.getString("utf-8") + "<br>"); // value			
			} else { // 파일일 경우
				out.print("파일명 : " + fitem.getName() + "<br>");
				out.print("용량 : " + fitem.getSize() + "<br>");
				if(fitem.getSize() > 0) {
					int idx = fitem.getName().lastIndexOf("\\");
					if(idx == -1) { // 브라우저에 따라서 넘어오는 값의 형태가 다르므로 추가로 설정
						idx = fitem.getName().lastIndexOf("/");
					}
					
					String fileName = fitem.getName().substring(idx + 1);
					// 경로를 제외한 파일명 가져오기
					
					String path = getServletContext().getRealPath("/upload");
					File upfolder = new File(path); // 폴더 없으면 만들기 위해서 작업
					if(!upfolder.exists()) { // 실제 폴더가 존재하지 않는다면
						upfolder.mkdir(); // 폴더를 만들어라
					}
					
					File f = new File(path, fileName);
					fitem.write(f); // 파일 저장
					// 파일명으로 폴더에 저장된다!
					
					out.println("업로드 완료<br>");
					out.println(path + "/" + fileName);
				}
			}
		}
		
		
	} else {
		out.println("multipart가 아닙니다. multipart로 다시 넘겨주세요!");
	}
%>
</body>
</html>