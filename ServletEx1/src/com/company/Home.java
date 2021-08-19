package com.company;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Home
 * @ <= 애노테이션
 */
@WebServlet("/") // 애노테이션 설정으로 이 java파일(컨트롤러)로 올 수 있다!
public class Home extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Home() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		// jsp파일이 없는데도 화면이 뜬다!
		// 왜? response.getWriter() <= 이게 jsp의 out.println과 같다.
		// 여기에 append를 이용해서 값을 추가할 수 있다.
		
		//PrintWriter pw = response.getWriter();
		// 이거 언제 사용했나? 파일 입출력할 때 했었다!
		//pw.println("<input type='text'>");
		// 웹브라우저에 쓰기 = out.println(); 과 100% 동일하다!
		
		// 그냥 여기까지 실행하면 그것은 HTML이 아니고 웹브라우저에 그냥 글쓰기랑 같다.
		// 따라서 우리는 HTML로 출력을 해야한다!
		// HTML로 출력을 해야 여러가지 기능을 활용할 수 있다.
		// 그래서 우리가 보내는 해당 글 정보를 HTML이라고 설정해줘야 하고,
		// 그렇게 설정된 웹브라우저는 HTML 형식이라고 인식하고 처리한다!
		
		// 교재 p500 17번째 줄부터 작성하기
		response.setContentType("text/html; charset=utf-8");
		// 설정 정보 세팅하는 코드
		// 이 한 줄을 적음으로써 HTML 설정이 가능하다!
		
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head><title>현재시간</title></head>");
		out.println("<body>");
		out.println("현재 시간은");
		out.println(new Date());
		out.println("입니다");
		out.println("</body></html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
