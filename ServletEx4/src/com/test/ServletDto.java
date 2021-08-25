package com.test;

public class ServletDto {
	private int idx;
	private String name;
	private String pw;
	private String title;
	private String content;
	private String reg_date;
	private String myfile;
	
	public ServletDto() {}
	
	public ServletDto(String name, String pw, String title, String content, String myfile) {		
		this.name = name;
		this.pw = pw;
		this.title = title;
		this.content = content;
		this.myfile = myfile;
	}
	public ServletDto(int idx, String name, String pw, String title, String content, String myfile) {
		this.idx = idx;
		this.name = name;
		this.pw = pw;
		this.title = title;
		this.content = content;
		this.myfile = myfile;
	}
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public String getMyfile() {
		return myfile;
	}

	public void setMyfile(String myfile) {
		this.myfile = myfile;
	}
	
	
}
