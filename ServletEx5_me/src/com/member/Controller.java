package com.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Controller() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String cmd = request.getRequestURI();
		System.out.println("원본 cmd : " + cmd);
		cmd = cmd.substring(cmd.lastIndexOf("/"));
		System.out.println("잘린 cmd : " + cmd);
		
		String viewPage = null;
		CommandHandler handler = null;
		
		if (cmd.equals("/Select")) {
			handler = new SelectHandler();
		} else if (cmd.equals("/Insert")) {
			viewPage = "/insert.jsp";
		} else if (cmd.equals("/InsertProc")) {
			handler = new InsertProcHandler();
		} else if (cmd.equals("/Delete")) {
			handler = new DeleteHandler();
		} else if (cmd.equals("/Login")) {
			handler = new LoginHandler();
		} else if (cmd.equals("/Logout")) {
			handler = new LogoutHandler();
		} else {
			handler = new SelectHandler();
		}
		
		if (viewPage == null) {
			viewPage = handler.process(request, response);
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
