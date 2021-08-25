package com.test;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateProcHandler implements WorkHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ServletDao dao = new ServletDao();
		int idx = Integer.parseInt(request.getParameter("idx"));
		String name = request.getParameter("name");
		String pw = request.getParameter("pw");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String myfile = request.getParameter("myfile");
		
		ServletDto dto = new ServletDto(idx, name, pw, title, content, myfile);
		dao.updateData(dto);
		
		return "redirect:/Read?idx="+idx;
	}

}
