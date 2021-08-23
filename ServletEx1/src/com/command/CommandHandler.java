package com.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CommandHandler {
	public String process(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException;
	// 들어오는 cmd(reqeuste.getParameter("cmd"))가 뭐냐에 따라서 insert, update, select 가 실행된다.
	// 그때마다 여기 있는 이 인터페이를 구현한 페이지가 실행된다!
	// return이 String인 이유는? 여기서 dao를 처리하고 결과로 어디로(jsp 페이지) 갈지 넘겨주기 때문이다!
}
