package com.test;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteHandler implements WorkHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		ServletDao dao = new ServletDao();		
		dao.deleteData(idx);
		return "redirect:/Select";
	}

}
