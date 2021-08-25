package com.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String goPage = null;
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		// 로그인 처리
		// 1) 넘어온 id와 pw를 확인해서 맞는 값이 DB에 있다면 Dto를 가져와서
		MemberDto dto = new Dao().loginMember(id, pw);
		
		if (dto.getIdx() > 0) { // dto는 dao에서 생성이 되게 되어있고 안에 값이 안들어있다!
			// 현재 사용되고 있는 세션을 들고 온다!
			HttpSession session = request.getSession();
			
			// 2) session.setAttribute("userInfo", dto);
			session.setAttribute("userInfo", dto);
			// 이렇게 받아온 세션에 값을 넣으면 jsp에서도 사용이 가능하다!
			// 왜? session은 전체 웹프로그램에서 공유되니까!
			
			// 3) redirect로 원래 select.jsp로 간다! = redirect:/Select
			goPage = "redirect:/Select";
		} else {
			goPage = "/loginerr.jsp";
		}
		
		return goPage;
	}
}
