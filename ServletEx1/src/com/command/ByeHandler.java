package com.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ByeHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 실제로 여기에 존재해야 하는 것은 DAO처리이다.
		
		// DAO의 결과 담기
		request.setAttribute("data", "Bye");
		return "/byeView.jsp";
	}

}
