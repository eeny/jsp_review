package com.ds;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DsContoller")
public class DsContoller extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DsContoller() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String cmd = request.getRequestURI();
		cmd = cmd.substring(cmd.lastIndexOf("/")); // /기준으로 제일 마지막 글자
		
		DsHandler handler = null;
		
		if (cmd.equals("/InsertDs")) {
			
		} else if (cmd.equals("/InsertProcDs")) {
			
		} else if (cmd.equals("/SelectDs")) {
			handler = new SelectHandler();
		} else if (cmd.equals("/DeleteDs")) {
			
		} else {
			handler = new SelectHandler();
		}
		String viewPage = handler.process(request, response);
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
