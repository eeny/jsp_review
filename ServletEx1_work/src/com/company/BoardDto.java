package com.company;

/*
CREATE TABLE servletboard1 (
	idx INT AUTO_INCREMENT PRIMARY KEY,
	NAME VARCHAR(20) NOT NULL,
	pw VARCHAR(100) NOT NULL,
	title VARCHAR(255) NOT NULL,
	content TEXT NOT NULL,
	reg_date DATETIME NOT null
);*/

public class BoardDto {
	private int idx;
	private String name;
	private String pw;
	private String title;
	private String content;
	private String reg_date;
	
	public BoardDto() {
	}
	
	public BoardDto(String name, String pw, String title, String content) {		
		this.name = name;
		this.pw = pw;
		this.title = title;
		this.content = content;
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
}
