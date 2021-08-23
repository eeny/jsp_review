package com.company;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Controller2
 */
@WebServlet("/Controller2")
public class Controller2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Controller2() {
        super();
    }
    // 1단계 - 요청 받기
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
		// get방식으로 데이터가 넘어와도 doProcess()가 실행된다.
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);	
		// post방식으로 데이터가 넘어와도 doProcess()가 실행된다.
	}
	// 1단계가 실행되는 실제 코드
	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*String page = "ex1";
		if (request.getParameter("page") != null) {
			page = request.getParameter("page");
		}*/
		request.setCharacterEncoding("utf-8");
		
		// 2단계 - 사용자 요청 분석하기
		String page = request.getParameter("page");
		if (page == null) {
			page = "insert";
		}
		
		// 3단계 - 모델을 사용하여 기능 수행하기
		// FDao를 이용해서 select 해서 Ex1.jsp에 출력
		FDao dao = new FDao();
		Vector<FDto> dto = dao.selectData();
		
		/*if (page.equals("ex1")) {
			request.setAttribute("data", "Ex1 페이지로 잘 왔다. 환영! 환영!");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/Ex1.jsp");
			dispatcher.forward(request, response);
		} else if (page.equals("ex2")) {
			request.setAttribute("data", "Hello Hello Ex2 page!!!");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/Ex2.jsp");
			dispatcher.forward(request, response);
		} else {
			response.sendRedirect("Ex3.jsp");
		}*/
		
		// 위의 코드 줄인 버전
		String go = "";
		
		if (page.equals("insert")) {
			go = "/ser_insert.jsp"; // insert 페이지 만들기
		} else if (page.equals("insertproc")) {
			// request 내용받고 dao.insert처리를 하면 된다.
			String name = request.getParameter("name");
			String id = request.getParameter("id");
			String myfile = request.getParameter("myfile");
			String ofname = request.getParameter("ofname");
			String sfname = request.getParameter("sfname");
			
			FDto dto2 = new FDto();
			dto2.setName(name);
			dto2.setId(id);
			dto2.setMyfile(myfile);
			dto2.setOfname(ofname);
			dto2.setSfname(sfname);
			
			dao.insertData(dto2);
			
			response.sendRedirect("Controller2?page=ex1");
			return;
		} else if (page.equals("ex1")) {
			// 4단계 - 결과를 reqeust를 통해서 담음
			request.setAttribute("data", "Ex1 페이지로 잘 왔다. 환영! 환영!");
			request.setAttribute("selectResult", dto);
			go = "/Ex1.jsp";
		} else if (page.equals("ex2")) {
			request.setAttribute("data", "Hello Hello Ex2 page!!!");
			go = "/Ex2.jsp";
		} else {
			go = "/Ex3.jsp";
		}
		
		// 5단계 - 실제 jsp페이지로 이동
		RequestDispatcher dispatcher = 
				request.getRequestDispatcher(go);
		dispatcher.forward(request, response);
	}

}
