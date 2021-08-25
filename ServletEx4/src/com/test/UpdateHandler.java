package com.test;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateHandler implements WorkHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		ServletDao dao = new ServletDao();
		ServletDto dto = dao.selectData(idx);
		request.setAttribute("data", dto);
		
		return "/update.jsp";
	}

}
