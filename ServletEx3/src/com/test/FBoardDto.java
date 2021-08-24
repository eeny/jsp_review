package com.test;

public class FBoardDto {
	private int idx;
	private String title;
	private String descr;
	private String ofilename;
	private String sfilename;
	private String regdate;
	
	public FBoardDto() {}
	
	public FBoardDto(String title, String descr, String ofilename, String sfilename) {
		this.title = title;
		this.descr = descr;
		this.ofilename = ofilename;
		this.sfilename = sfilename;
	}
	
	public FBoardDto(int idx, String title, String descr, String ofilename, String sfilename) {
		this.idx = idx;
		this.title = title;
		this.descr = descr;
		this.ofilename = ofilename;
		this.sfilename = sfilename;
	}

	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescr() {
		return descr;
	}
	public void setDescr(String descr) {
		this.descr = descr;
	}
	public String getOfilename() {
		return ofilename;
	}
	public void setOfilename(String ofilename) {
		this.ofilename = ofilename;
	}
	public String getSfilename() {
		return sfilename;
	}
	public void setSfilename(String sfilename) {
		this.sfilename = sfilename;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
}
