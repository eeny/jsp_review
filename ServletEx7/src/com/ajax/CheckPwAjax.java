package com.ajax;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

public class CheckPwAjax {
	public CheckPwAjax(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String pw = request.getParameter("pw");
		
		String rtn = "ok";
		if (pw.length() < 4) {
			rtn = "4 or more digits";
		}
		
		JSONObject json = new JSONObject();
		json.put("rtn", rtn);
		response.getWriter().print(json.toString());
	}
}
