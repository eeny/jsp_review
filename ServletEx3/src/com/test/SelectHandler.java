package com.test;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SelectHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Dao dao = new Dao();
		Vector<FBoardDto> dto = dao.getSelect();
		request.setAttribute("data", dto); // request에 값 담기
		
		return "/mainView.jsp";
	}

}
