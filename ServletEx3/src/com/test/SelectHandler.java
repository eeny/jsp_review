package com.test;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SelectHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Dao dao = new Dao();

		// 페이징 처리
		double totalCnt = (double)dao.getTotalCnt("servletboard2"); // 총 게시글 수
		int curPage = 5; // 한 페이지에 출력할 행의 개수
		int totalPage = (int)Math.ceil(totalCnt/curPage); // 총 페이지 개수
		int countPage = 3; // 한 페이지에 출력될 페이징 번호 개수
		int pnum = 1; // 현재 페이지, 시작 페이지 번호
		
		if(request.getParameter("pnum") != null) {
			pnum = Integer.parseInt(request.getParameter("pnum"));
		}
		
		int startPage = ((pnum - 1) / countPage) * countPage + 1;
		int endPage = startPage - 1 + countPage;
		if(endPage > totalPage) {
			endPage = totalPage;
		}
		
		// 게시글 목록
		Vector<FBoardDto> dto = dao.getSelect(pnum, curPage); 
		
		request.setAttribute("data", dto); // request에 값 담기
		request.setAttribute("totalCnt", totalCnt); 
		request.setAttribute("pnum", pnum);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		return "/mainView.jsp";
	}

}
