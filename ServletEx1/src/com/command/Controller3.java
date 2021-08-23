package com.command;

import java.io.IOException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Controller3
 */
@WebServlet("/Controller3")
public class Controller3 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Controller3() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String cmd = request.getParameter("cmd");

		String viewPage = "";
		CommandHandler handler = null;
		// 인터페이스를 사용하는 이유?
		// 1) 동일한 메서드 사용을 위해서(강제하기 위해서)
		// 2) 동일한 변수에 담기 위해서(handler 변수)
		
		if (cmd == null) {
			
			handler = new NullHandler();
		} else if (cmd.equals("hello")) {
			handler = new HelloHandler();
		} else if (cmd.equals("bye")) {
			handler = new ByeHandler();
		} else if (cmd.equals("select")) {
			handler = new SelectHandler();
		} else {
			handler = new NullHandler();
		}

		viewPage = handler.process(request, response);
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}

}
