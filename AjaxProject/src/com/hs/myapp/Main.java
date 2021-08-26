package com.hs.myapp;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Main {
	public String serviceProc(
			HttpServletRequest req,
			HttpServletResponse res){
		
		SensorDAO dao = new SensorDAO();
		Vector<SensorDTO> v =dao.getAllData();
		req.setAttribute("data", v);
		
		return "main.jsp";
	}
}





