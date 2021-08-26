package com.hs.myapp;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

public class Ajaxdata {
  public Ajaxdata(HttpServletRequest request
		, HttpServletResponse response){
	try { 
		SensorDAO dao = new SensorDAO();
		Vector<SensorDTO> v = dao.getAllData();
		
		JSONArray ja = new JSONArray();
		for(int i=0;i<v.size();i++){
			JSONArray jdata = new JSONArray();
			jdata.add(v.get(i).getIdx());
			jdata.add(v.get(i).getTemperature());
			jdata.add(v.get(i).getHumidity());
			jdata.add(v.get(i).getPrecipitation());
			ja.add(jdata);
		}		
			response.getWriter().print(ja.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
  }
}










