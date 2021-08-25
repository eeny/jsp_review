package com.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int idx = Integer.parseInt(request.getParameter("idx"));
		int result = new Dao().deleteData(idx);
		
		request.setAttribute("data", result);
		
		//return "redirect:/Select";
		return "/delete.jsp";
	}

}
