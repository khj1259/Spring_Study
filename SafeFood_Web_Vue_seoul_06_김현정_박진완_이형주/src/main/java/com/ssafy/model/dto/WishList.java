package com.ssafy.model.dto;

public class WishList {
	private int wishcode;
	private String id;
	private int code;
	private int cnt;
	
	public WishList() {
		// TODO Auto-generated constructor stub
	}

	public WishList(int wishcode, String id, int code, int cnt) {
		super();
		this.wishcode = wishcode;
		this.id = id;
		this.code = code;
		this.cnt = cnt;
	}

	public int getWishcode() {
		return wishcode;
	}

	public void setWishcode(int wishcode) {
		this.wishcode = wishcode;
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
		return "WishList [wishcode=" + wishcode + ", id=" + id + ", code=" + code + ", cnt=" + cnt + "]";
	}
	
}
