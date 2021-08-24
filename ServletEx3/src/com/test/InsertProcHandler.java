package com.test;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class InsertProcHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 파일 업로드 작업
		String dir = request.getServletContext().getRealPath("/upload");
		File f = new File(dir);
		
		if (!f.exists()) {
			f.mkdir();
		}
		
		String path = dir;
		int maxSize = 10 * 1024 * 1024;
		String enc = "UTF-8";
		DefaultFileRenamePolicy dfrp = new DefaultFileRenamePolicy();
		
		MultipartRequest mrequest = new MultipartRequest(request, path, maxSize, enc, dfrp);
		
		// dao 작업
		Dao dao = new Dao();
		
		String title = mrequest.getParameter("title");
		String descr = mrequest.getParameter("descr");
		String ofilename = mrequest.getOriginalFileName("ofilename");
		String sfilename = mrequest.getFilesystemName("ofilename");
		
		FBoardDto dto = new FBoardDto(title, descr, ofilename, sfilename);
		// 각 set 안하고 미리 Dto에 생성자 만들어서 값넣는 방법
		
		dao.insertData(dto);
		
		// 이것은 jsp페이지가 아닌 Controller의 if문 cmd로 바로 가는  방법임
		// Select를 거치지 않고 바로 select.jsp로 가면 
		// request.getAttribute("data")의 값을 가지고 가지 않으므로 null Exception뜸
		// 다시한번 컨트롤러의 select를 처리하고 가기 위해서 이렇게 함
		return "redirect:/Select"; // SelectHandler를 실행 시키기 위해서 보낸다!
	}

}
