package com.test;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class UpdateProcHandler implements CommandHandler {

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
		
		int idx = Integer.parseInt(mrequest.getParameter("idx"));
		String title = mrequest.getParameter("title");
		String descr = mrequest.getParameter("descr");
		String ofilename = mrequest.getOriginalFileName("ofilename");
		String sfilename = mrequest.getFilesystemName("ofilename");

		
		FBoardDto dto = new FBoardDto(idx, title, descr, ofilename, sfilename);
		dao.updateData(dto);
		
		return "redirect:/Content?idx=" + idx;
	}

}
