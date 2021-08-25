package com.company;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SessionController
 */
@WebServlet("/SessionController")
public class SessionController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SessionController() {
		super();
		// TODO Auto-generated constructor stub
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
		request.setCharacterEncoding("utf-8");
		String cmd = request.getRequestURI();
		cmd = cmd.substring(cmd.lastIndexOf("/"));

		MemberHandler handler = null;

		if (cmd.equals("/InsertMember")) {
			handler = new InsertHandler();
		} else if (cmd.equals("/InsertMemberProc")) {
			handler = new InsertProcHandler();
		} else if (cmd.equals("/SelectMember")) {
			handler = new SelectHandler();
		} else if (cmd.equals("/DeleteMember")) {
			handler = new DeleteHandler();
		} else if (cmd.equals("/LoginMember")) {
			handler = new LoginHandler();
		} else if (cmd.equals("/LogoutMember")) {
			handler = new LogoutHandler();
		} else {
			handler = new SelectHandler();
		}

		String viewPage = handler.process(request, response);

		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
