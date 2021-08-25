package com.company;

import java.io.IOException;
import java.util.HashMap;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SelectHandler implements MemberHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		MemberDao dao = new MemberDao();

		int totalCount = dao.selectDataCnt(); // 전체 데이터의 양
		int pageRow = 10;// 한 페이지에 출력될 행의 개수
		int nowPage = 1;// 시작 페이지 번호
		int totalPage = (int) Math.ceil(totalCount / (double) pageRow);// 전체 페이지
																		// 개수
		int countPage = 10;// 한 페이지에 출력될 페이징 번호의 개수

		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}

		int startPage = ((nowPage - 1) / countPage) * countPage + 1;
		int endPage = startPage - 1 + countPage;

		if (endPage > totalPage) {
			endPage = totalPage;
		}

		HashMap<String, Integer> map = new HashMap<>();
		map.put("nowPage", nowPage);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("totalPage", totalPage);

		Vector<MemberDto> v = dao.selectData(nowPage, pageRow);
		request.setAttribute("data", v);
		request.setAttribute("pageData", map);

		return "/selectmember.jsp";
	}

}
