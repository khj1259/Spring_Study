package com.vo;

public class Car {
	private int id;
	private String name;
	private String manufacturer;
	private int price;
	
	public Car() {
		// TODO Auto-generated constructor stub
	}
	
	public Car(int id, String name, String manufacturer, int price) {
		super();
		this.id = id;
		this.name = name;
		this.manufacturer = manufacturer;
		this.price = price;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getManufacturer() {
		return manufacturer;
	}
	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "Car [id=" + id + ", name=" + name + ", manufacturer=" + manufacturer + ", price=" + price + "]";
	}
	
	
}
