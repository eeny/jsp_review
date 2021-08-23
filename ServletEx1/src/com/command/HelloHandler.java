package com.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloHandler implements CommandHandler {
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// DAO를 통해서 값을 가져온다.
		// 책 예제라서 DAO연결은 안하고 가져왔다는 가정하에 문자만 넘긴다!
		request.setAttribute("data", "Hello");
		
		return "/helloView.jsp";
	}
}
