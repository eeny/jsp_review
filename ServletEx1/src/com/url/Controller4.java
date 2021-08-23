package com.url;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Controller4
 */
@WebServlet("/Controller4")
public class Controller4 extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Controller4() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//String cmd = request.getParameter("cmd");
		// 매우 불편하다! 무조건 주소줄에 cmd= 이렇게 넘겨야 한다.
		// 나중에 input으로 받을 때도 따로 처리해야 한다!
		
		String cmd = request.getRequestURI();
		// /ServletEx1/Controller4 <= Controller4만 끊어서 가져오고 싶다!
		//System.out.println("넘어온 cmd값: " + cmd.split("/")[2]); 
		cmd = cmd.substring(cmd.lastIndexOf("/")+1, cmd.length());
		System.out.println("넘어온 cmd값: " + cmd); 
		
		// web.xml 설정이 필요하다!
		
		UrlHandler handler = null;
		String viewPage = "";
		
		
		if (cmd == null) {
			handler = new NullHandler();
		} else if (cmd.equals("Select")) {
			handler = new SelectHandler();
		} else if (cmd.equals("Insert")) {
			
		} else if (cmd.equals("Delete")) {
			
		} else if (cmd.equals("Update")) {
			
		} else {
			handler = new NullHandler();
		}
		
		viewPage = handler.process(request, response);
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
