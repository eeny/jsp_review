package com.ajax;

public class AjaxDto {
	private int idx;
	private String id;
	private String pw;
	
	public AjaxDto() {}	

	public AjaxDto(String id, String pw) {
		this.id = id;
		this.pw = pw;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}	
}