package com.test;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String idx = request.getParameter("idx");
		
		Dao dao = new Dao();
		BoardDto dto = dao.getSelectIdx(Integer.parseInt(idx));
		request.setAttribute("data", dto);
		
		
		return "/updateView.jsp";
	}

}
