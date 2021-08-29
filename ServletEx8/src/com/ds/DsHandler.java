package com.ds;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface DsHandler {
	public String process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
}