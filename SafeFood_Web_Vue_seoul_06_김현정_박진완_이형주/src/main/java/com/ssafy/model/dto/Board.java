package com.ssafy.model.dto;

import java.util.Date;

public class Board {
	private int bnum;
	private String bdate;
	private String id;
	private String title;
	private String content;
	private int cnt;
	
	public Board() {
		// TODO Auto-generated constructor stub
	}
	
	public Board(int bnum, String id, String title, String content, int cnt) {
		super();
		this.bnum = bnum;
		this.id = id;
		this.title = title;
		this.content = content;
		this.cnt = cnt;
	}

	public int getBnum() {
		return bnum;
	}

	public void setBnum(int bnum) {
		this.bnum = bnum;
	}

	public String getBdate() {
		return bdate;
	}


	public void setBdate(String bdate) {
		this.bdate = bdate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	@Override
	public String toString() {
		return "Board [bnum=" + bnum + ", bdate=" + bdate + ", id=" + id + ", title=" + title + ", content=" + content
				+ ", cnt=" + cnt + "]";
	}
	
}
