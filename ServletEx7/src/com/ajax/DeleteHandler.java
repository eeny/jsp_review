package com.ajax;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteHandler implements AjaxHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		AjaxDao dao = new AjaxDao();		
		int result = dao.deleteData(idx);
		
		request.setAttribute("data", result);  // data에는 머가? 1 또는 0
		
		return "/deletemember.jsp";
	}
}
