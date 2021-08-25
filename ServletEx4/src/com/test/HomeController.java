package com.test;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HomeController
 */
@WebServlet("/HomeController")
public class HomeController extends HttpServlet {
	// private static final long serialVersionUID = 1L; //버전관리용 상수
	private Map<String, WorkHandler> workHandlerMap = new HashMap<String, WorkHandler>();

	@Override
	public void init() throws ServletException {
		// web.xml에서 init-param의 이름을 들고옴
		String configFile = getInitParameter("configFile");
		// /WEB-INF/WorkHandler.properties 이 문자열을 들고옴.
		// 이문자열의 의미는 properties 파일의 위치.

		Properties prop = new Properties(); // 자바가 들고 있는 일종의 맵 클래스

		// 실제 파일 위치 가져오기 // 실제 하드디스크에 저장된 전체 위치 => RealPath
		String configFilePath = getServletContext().getRealPath(configFile);
		System.out.println("컨피그 파일 패스 : " + configFilePath);

		FileInputStream fis = null;
		try {
			// fis = new FileReader(configFilePath);// 를 밑처럼 수정
			fis = new FileInputStream(configFilePath); // 실제 위치에서 파일 읽음
			prop.load(fis); // 프로퍼티스 객체에 담음
			// 담으면 "=" 를 기준으로 키와 value로 담는다. 키=값
		} catch (IOException e) {
			throw new ServletException(e);
		}

		// 프로퍼티스 파일안에 무슨키가 있는지 알수 없으므로 전체를 다 가져오기 위해 사용
		Iterator ketIter = prop.keySet().iterator();

		while (ketIter.hasNext()) {// 한줄씩 있을때 까지 읽어옴
			String command = (String) ketIter.next();

			// System.out.println(command); // 프로퍼티스 파일의 키 값 출력

			 // 키를 이용해서 value 값을 가져온다.
			String handlerClassName = prop.getProperty(command);
			System.out.println(handlerClassName); // 키 값을 가져온다.
			// 실제로 키값도 String이다. 우리가 프로퍼티스에 넣은 키와 값은 둘다 문자다
	         
	         // 여기까지 하면 우리는 프로퍼티스 파일의 값을 가져올수 있고
	         // 이 값이 여기서 의미하는 바는 실제 클래스의 위치를 포함한 이름이다.
	         // com.company.InsertHandler <== 이런 위치값. 실제로 있어야 다음줄 에러없음

			try {
				// 이 Class 라는 클래스는 실제 클래스가 있는 문자열을 받아서 자바 객체로 변환해줌 
	        	 // 이 클래스가 실행되면 문자열 위치로 실제 클래스를 만든다
				Class<?> handlerClass = Class.forName(handlerClassName);

				// 문자열로 읽어와 만들어진 클래스를 실제로 생성(new) 하는 작업
				WorkHandler handlerInstance = (WorkHandler) handlerClass.newInstance();

				// map에는 원래 있던 key와 실제로 생성된 핸들러들을 넣는다.
				workHandlerMap.put(command, handlerInstance);
			} catch (ClassNotFoundException | InstantiationException | IllegalAccessException e) {
				throw new ServletException(e);
			}
		}
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
		// 한글처리 + db연결주소 + 보내는 페이지 최상단 utf-8
		request.setCharacterEncoding("utf-8");
		// 다른 request 전에 미리 인코딩 작업을 해야 이후 들어오는 내용이 utf-8로 바껴서 들어옴

		String cmd = request.getRequestURI();

		System.out.println("원본 cmd : " + cmd); //  => http://localhost:8080/ServletEx1_work/

		cmd = cmd.substring(cmd.lastIndexOf("/"));
		// 이렇게 하면 /를 포함한 값을 가져옴   =>  ex) /
		// http://localhost:8080/ServletEx1_work/ 에서 마지막 /를 잘라서 가져옴 => /
		System.out.println("자른 후 cmd : " + cmd);

		WorkHandler handler = null;
		String viewPage = null;

		if (cmd == null || cmd.equals("/")) {
			handler = new SelectHandler();
		} else {
			handler = workHandlerMap.get(cmd);
		}

		viewPage = handler.process(request, response);
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}

}
