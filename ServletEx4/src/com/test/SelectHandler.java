package com.test;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SelectHandler implements WorkHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ServletDao dao = new ServletDao();
		Vector<ServletDto> v = dao.selectData();
		
		request.setAttribute("data", v); // request에 값 담기
		
		return "/select.jsp";
	}

}
