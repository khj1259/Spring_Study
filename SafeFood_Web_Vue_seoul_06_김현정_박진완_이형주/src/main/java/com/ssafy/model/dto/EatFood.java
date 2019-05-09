package com.ssafy.model.dto;

public class EatFood {
	private int eatfoodcode;
	private String id;
	private int code;
	private int cnt;
	
	public EatFood() {
		
	}

	public EatFood(int eatfoodcode, String id, int code, int cnt) {
		this.eatfoodcode = eatfoodcode;
		this.id = id;
		this.code = code;
		this.cnt = cnt;
	}

	public int getEatfoodcode() {
		return eatfoodcode;
	}

	public void setEatfoodcode(int eatfoodcode) {
		this.eatfoodcode = eatfoodcode;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	@Override
	public String toString() {
		return "EatFood [eatfoodcode=" + eatfoodcode + ", id=" + id + ", code=" + code + ", cnt=" + cnt + "]";
	}
	
	
}
