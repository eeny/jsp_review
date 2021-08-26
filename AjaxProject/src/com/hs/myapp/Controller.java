package com.hs.myapp;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Controller
 */
@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public Controller() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		System.out.println(uri);
		if(uri.equals("/AjaxProject/*.do")){
		  Main m = new Main();
		  String addr=
			m.serviceProc(request, response);
		  RequestDispatcher rd 
		    = request.getRequestDispatcher(addr);
		  rd.forward(request, response);
			
		}else if(uri.equals("/AjaxProject/ajax.do")){
			  AjaxMain m = new AjaxMain();
			  String addr=
				m.serviceProc(request, response);
			  RequestDispatcher rd 
			    = request.getRequestDispatcher(addr);
			  rd.forward(request, response);
				
			}
		else if(uri.equals("/AjaxProject/ajaxdata.do")){
			  new Ajaxdata(request,response);
			 
				
			}
		
		
	}
}









