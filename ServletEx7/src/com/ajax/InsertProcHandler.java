package com.ajax;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class InsertProcHandler implements AjaxHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		AjaxDao dao = new AjaxDao();
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		AjaxDto dto = new AjaxDto(id, pw);
		dao.insertData(dto);
			
		return "redirect:/SelectAjax";
	}

}
