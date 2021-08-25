package com.test;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class InsertProcHandler implements WorkHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String dir = request.getServletContext().getRealPath("/upload");
		File f = new File(dir);
		if (!f.exists()) {// 실제 저 폴더가 존재하지 않는다면
			f.mkdir();
		}

		String path = dir;
		int maxSize = 10 * 1024 * 1024;// 10 메가
		String enc = "utf-8";
		DefaultFileRenamePolicy dfrp = new DefaultFileRenamePolicy();
		// 파일명 중복처리

		MultipartRequest mrequest = new MultipartRequest(request, path, maxSize, enc, dfrp);// 업로드
																							// 끝

		ServletDao dao = new ServletDao();

		String name = mrequest.getParameter("name");
		String pw = mrequest.getParameter("pw");
		String title = mrequest.getParameter("title");
		String content = mrequest.getParameter("content");
		// String myfile = mrequest.getParameter("myfile");
		String myfile = mrequest.getFilesystemName("myfile");// 실제 저장 파일 명
		// a.png, a1.png, a2.png 이름 알아서 중복안되게 바꿔줌 <- 실제 저장되는 이름
		// String myfile2 = mrequest.getOriginalFileName("myfile");// 우리가 업로드 한
		// 파일 명
		// 이 이름은 실제 저장되는 이름이랑 다를수 있다.
		// 저장된 파일 중에 중복된 이름이 없다면 FilesystemtName이랑 같을수 있지만
		// 중복된 파일명이 있다면 다를수 있다.

		ServletDto dto = new ServletDto(name, pw, title, content, myfile);
		// 각 set 안하고 미리 Dto에 생성자 만들어서 값넣는 방법

		dao.insertData(dto);

		// 이것은 jsp페이지가 아닌 Controller의 if문 cmd로 바로 가는 방법임
		// Select를 거치지 않고 바로 select.jsp로 가면
		// request.getAttribute("data")의 값을 가지고 가지 않으므로 null Exception뜸
		// 다시한번 컨트롤러의 select를 처리하고 가기 위해서 이렇게 함
		return "redirect:/Select";// SelectHandler을 실행 시키기 위해서 보냄
	}

}
