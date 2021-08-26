package com.ajax;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CheckHandler implements AjaxHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String id = request.getParameter("id");
		AjaxDao dao = new AjaxDao();
		int result = dao.CheckData(id);
		String rtn = "사용할 수 있는 아이디 입니다.";
		if(result>0){
			rtn = "이미 사용중인 아이디 입니다.";
		}
		request.setAttribute("ck", rtn);
		return "redirect:/SelectAjax";
	}
}
