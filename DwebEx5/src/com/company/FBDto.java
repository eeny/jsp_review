package com.company;

public class FBDto {
	private int idx;
	private String fmember_id;
	private String fmember_name;
	private String title;
	private String content;
	private String regdate; 
	// 값을 가져올 때 굳이 Date타입이 아닌 String타입을 하는 게 편하다!
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getFmember_id() {
		return fmember_id;
	}
	public void setFmember_id(String fmember_id) {
		this.fmember_id = fmember_id;
	}
	public String getFmember_name() {
		return fmember_name;
	}
	public void setFmember_name(String fmember_name) {
		this.fmember_name = fmember_name;
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
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
}
