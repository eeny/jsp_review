package com.ajax;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AjaxController")
public class AjaxController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AjaxController() {
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
		request.setCharacterEncoding("utf-8");
		String cmd = request.getRequestURI();
		cmd = cmd.substring(cmd.lastIndexOf("/"));

		AjaxHandler handler = null;

		if (cmd.equals("/InsertAjaxProc")) {
			handler = new InsertProcHandler();
		} else if (cmd.equals("/CheckAjax")) {
			handler = new CheckHandler();
		} else if (cmd.equals("/CheckIdAjax")) {

			new CheckIdAjax(request, response);
			// 결과를 생성과 동시에 화면에 메모리에 출력해 버린다.
			// 그 결과를 ajax가 긁어간다.
			// 이 클래스는 고정된 형태로 유지 되므로 forward()를 하면 안된다!
			// 현재 상태에서는 클래스를 미리 생성 후 메서드로 호출하면 더 좋다!

		} else if (cmd.equals("/CheckPwAjax")) {
			new CheckPwAjax(request, response);
			
		} else if (cmd.equals("/SelectAjax")) {
			handler = new SelectHandler();
		} else if (cmd.equals("/DeleteAjax")) {
			handler = new DeleteHandler();
		} else {
			handler = new SelectHandler();
		}

		if (!cmd.equals("/CheckIdAjax") && !cmd.equals("/CheckPwAjax")) {

			String viewPage = handler.process(request, response);

			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);

		}
	}
}
