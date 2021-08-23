package com.company;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SelectContentHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String idx = request.getParameter("idx");
		
		Dao dao = new Dao();
		BoardDto dto = dao.getSelectIdx(Integer.parseInt(idx));
		request.setAttribute("data", dto);
		
		return "/contentView.jsp";
	}

}
