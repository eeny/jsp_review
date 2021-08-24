package com.test;

import java.io.FileInputStream;
import java.io.FileReader;
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

@WebServlet("/Controller")
public class Controller extends HttpServlet {
	//private static final long serialVersionUID = 1L; // 버전관리용 상수
	
	private Map<String, CommandHandler> commandHandlerMap = new HashMap<String, CommandHandler>();
	
	@Override
	public void init() throws ServletException {
		// web.xml에서 init-param의 이름을 들고온다.
		String configFile = getInitParameter("configFile");
		// /WEB-INF/WorkHandler.properties <= 이 문자열을 들고온다!
		// 이 문자열의 의미는 properties 파일의 위치이다!
		
		Properties prop = new Properties(); // 자바가 가진 일종의 맵 클래스
		
		// 실제 파일 위치 가져오기
		// 실제 하드디스크에 저장된 전체 위치 = RealPath
		String configFilePath = getServletContext().getRealPath(configFile);
		System.out.println("configFilePath : " + configFilePath);
		// D:\worksapce\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\ServletEx2\WEB-INF\WorkHandler.properties
		
		FileInputStream fis = null;
		try {
			// fis = new FileReader(configFilePath); 를 아래처럼 수정했다!
			fis = new FileInputStream(configFilePath); // 실제 위치에서 파일을 읽는다.
			prop.load(fis); // 프로퍼티스 객체에 담는다.
			// 담으면 "=" 를  기준으로 key와 value로 나눠 담긴다! (key=value)
		} catch (IOException e) {
			throw new ServletException(e);
		}
		
		// 프로퍼티스 파일 안에 무슨 키가 얼마나 있는지 알 수 없으므로 전체를 다 가져오기 위해 사용한다!
		Iterator keyIter = prop.keySet().iterator();
		
		while (keyIter.hasNext()) { // 한 줄씩 있을 때 까지 읽어온다.
			String command = (String)keyIter.next();
			
			//System.out.println(command); // 프로퍼티스 파일의 키 값 출력
			
			// key를 이용해서 value값을 가져온다.
			String handlerClassName = prop.getProperty(command);
			System.out.println(handlerClassName); // 키 값을 가져온다!
			// 실제로 키 값도 String이다! 우리가 프로퍼티스에 넣은 키와 값은 둘 다 문자다!
			
			// 여기까지 하면 우리는 프로퍼티스 파일의 값을 가져올 수 있고,
			// 이 값이 여기서 의미하는 것은? 실제 클래스의 위치를 포함한 이름이다!
			// com.company.InsertHandler <= 이런 위치값. 실제로 있어야 다음 줄에서 에러가 발생하지 않는다!
			
			try {
				// 이 Class라는 클래스는 실제 클래스가 있는 문자열을 받아서 자바 객체로 변환해준다.
				// 이 클래스가 실행되면 문자열 위치로 실제 클래스를 만든다!
				Class<?> handlerClass = Class.forName(handlerClassName);
				
				// 문자열로 읽어와 만들어진 클래스를 실제로 생성(new) 하는 작업
				CommandHandler handlerInstance = (CommandHandler)handlerClass.newInstance();
				
				// map에는 원래 있던 key와 실제로 생성된 핸들러들을 집어넣는다!
				commandHandlerMap.put(command, handlerInstance);
			} catch (ClassNotFoundException | InstantiationException | IllegalAccessException e) {
				throw new ServletException(e);
			}
		}
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
		System.out.println("원본  cmd : " + cmd); // => http://localhost:8080/ServletEx1_work/
		
		cmd = cmd.substring(cmd.lastIndexOf("/"));
		// 이렇게 하면 /를 포함한 값을 가져옴   =>  ex) /Insert
		// http://localhost:8080/ServletEx1_work/ 에서 마지막 /를 잘라서 가져옴 => /
		System.out.println("자른 후 cmd : " + cmd);
		
		String viewPage = null;
		CommandHandler handler = null;
		
		if (cmd == null || cmd.equals("/")) {
			handler = new SelectHandler();			
		} else {
			handler = commandHandlerMap.get(cmd);
		}
		
		viewPage = handler.process(request, response);
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
