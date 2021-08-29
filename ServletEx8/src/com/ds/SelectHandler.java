package com.ds;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SelectHandler implements DsHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		DsDao dao = new DsDao();
		Vector<DsDto> v = dao.selectData();
		request.setAttribute("data", v);
		
		return "/selectds.jsp";
	}

}
