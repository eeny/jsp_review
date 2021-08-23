package com.command;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SelectHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		FDao dao = new FDao();
		Vector<FDto> dto = dao.selectData();
		request.setAttribute("result", dto);
		
		return "/selectView.jsp";
	}

}
