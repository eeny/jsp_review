package com.company;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteHandler implements MemberHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		MemberDao dao = new MemberDao();		
		int result = dao.deleteData(idx);
		
		request.setAttribute("data", result); // data에는  1 또는 0이 들어있다!
		
		return "/deletemember.jsp";
	}

}
