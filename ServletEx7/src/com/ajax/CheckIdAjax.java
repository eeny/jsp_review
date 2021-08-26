package com.ajax;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

public class CheckIdAjax {
	public CheckIdAjax(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id = request.getParameter("id");

		AjaxDao dao = new AjaxDao();
		JSONObject rtn = dao.CheckDataJSon(id);// dao를 통해서 값 가져오기 값은 json 타입
		// {"rtn":"이미 사용중인 아이디 입니다."}
		// 또는 {"rtn":"사용할수 있는 아이디 입니다."}
		response.getWriter().print(rtn.toString());// 메모리에 뿌려버리기
	}
}
