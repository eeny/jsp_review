package com.company;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginHandler implements MemberHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		// 1 넘어온 id와 비밀번호를 확인해서 맞는값이 DB에 있다면 dto를 가져와라
		MemberDao dao = new MemberDao();
		MemberDto dto = dao.loginMember(id, pw);

		// MemberDto dto = new MemberDto();// 테스트코드 지울것!

		String goPage = null;
		if (dto.getIdx() > 0) {
			// 2 session.setAtttibute("userInfo",dto);
			HttpSession session = request.getSession();
			// 현재 사용되고 있는 세션을 들고 온다.
			session.setAttribute("userInfo", dto);
			// 이렇게 받아온 세션에 값을 넣으면 jsp에서도 사용이 가능하다.
			// 왜냐면 session은 전체 웹프로그램에서 공유되니까.
			goPage = "redirect:/SelectMember";
		} else {
			goPage = "/loginerr.jsp";
		}

		// 3 redirect로 원래 select.jsp로간다. => redirect:/SelectMember
		return goPage;
	}

}
