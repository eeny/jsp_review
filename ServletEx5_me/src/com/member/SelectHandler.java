package com.member;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SelectHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Vector<MemberDto> v = new Dao().getSelect();
		request.setAttribute("data", v);
		
		return "/select.jsp";
	}

}
