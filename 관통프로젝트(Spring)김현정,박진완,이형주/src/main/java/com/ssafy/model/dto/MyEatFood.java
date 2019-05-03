package com.ssafy.model.dto;

public class MyEatFood {
	private int code;
	private String img;
	private String name;
	private int cnt;
	private int eatfoodcode;
	
	public MyEatFood() {
		// TODO Auto-generated constructor stub
	}

	public MyEatFood(int code, String img, String name, int cnt, int eatfoodcode) {
		super();
		this.code = code;
		this.img = img;
		this.name = name;
		this.cnt = cnt;
		this.eatfoodcode = eatfoodcode;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public int getEatfoodcode() {
		return eatfoodcode;
	}

	public void setEatfoodcode(int eatfoodcode) {
		this.eatfoodcode = eatfoodcode;
	}

	@Override
	public String toString() {
		return "MyEatFood [code=" + code + ", img=" + img + ", name=" + name + ", cnt=" + cnt + ", eatfoodcode="
				+ eatfoodcode + "]";
	}
	
	
}
