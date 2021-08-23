package com.company;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class InsertHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Dao dao = new Dao();
		
		String name = request.getParameter("name");
		String pw = request.getParameter("pw");
		String title = request.getParameter("title");
		String content  = request.getParameter("content");
		
		BoardDto dto = new BoardDto(name, pw, title, content);
		// 각 set 안하고 미리 Dto에 생성자 만들어서 값넣는 방법
		
		dao.insertData(dto);
		
		// 이것은 jsp페이지가 아닌 Controller의 if문 cmd로 바로 가는  방법임
		// Select를 거치지 않고 바로 select.jsp로 가면 
		// request.getAttribute("data")의 값을 가지고 가지 않으므로 null Exception뜸
		// 다시한번 컨트롤러의 select를 처리하고 가기 위해서 이렇게 함
		return "redirect:/Select";
	}

}
