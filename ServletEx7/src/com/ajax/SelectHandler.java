package com.ajax;

import java.io.IOException;
import java.util.HashMap;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SelectHandler implements AjaxHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		AjaxDao dao = new AjaxDao();
		
		Vector<AjaxDto> v = dao.selectData();		
		request.setAttribute("data", v);				
		
		return "/selectajax.jsp";
	}

}
