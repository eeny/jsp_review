package com.company;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

// 서버가 실행되면서 드라이버자체를 불러오는 부분 Class.forName~ 을 미리 빼놓는 역할.
// HttpServlet은 JSP든 서블릿이든 자바를 이용한 웹프로젝트에서 
// 서블릿 사용을 위한 최상위 클래스이다!
// 이 클래스는 서버가 실행될 때 자동으로 실행되는 메서드(init() 이라는 초기화 메서드)를 가지고 있다!
public class LoaderClass extends HttpServlet {
	@Override
	public void init(ServletConfig config) throws ServletException {
		// 서버가 로딩될 때 초기화하는 메서드
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
}
