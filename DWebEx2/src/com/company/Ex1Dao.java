package com.company;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class Ex1Dao { // Database Access Object
	String id = "";
	public void login(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("idinfo", id);
	}
}
