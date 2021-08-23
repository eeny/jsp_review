package com.company;

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
		// 한글 처리 + db연결 주소 + 보내는 페이지 최상단 UTF-8
		request.setCharacterEncoding("UTF-8");
		
		String cmd = request.getRequestURI();
		cmd = cmd.substring(cmd.lastIndexOf("/"));
		// 이렇게 하면 /를 포함한 값을 가져옴   =>  ex) /Insert
		
		String viewPage = null;
		CommandHandler handler = null;
		
		if (cmd.equals("/Select")) {
			handler = new SelectHandler();
			
		} else if (cmd.equals("/Insert")) {
			viewPage = "/insertView.jsp";// 가져갈 값이 필요 없을때는 이동할 주소만 넘기면 된다.
			
		} else if (cmd.equals("/InsertProc")) {
			handler = new InsertHandler();
			
		} else if (cmd.equals("/Content")) {
			handler = new SelectContentHandler();
			
		} else if (cmd.equals("/Delete")) {
			handler = new DeleteHandler();
			
		} else if (cmd.equals("/Update")) {
			handler = new UpdateHandler();
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
