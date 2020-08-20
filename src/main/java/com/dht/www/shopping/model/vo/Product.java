package com.dht.www.shopping.model.vo;

import java.sql.Date;

public class Product {
	
	private String code;
	private String name;
	private String company;
	private int price;
	private String desc;
	private Date date;
	private int stock;
	private int sell;
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public int getSell() {
		return sell;
	}
	public void setSell(int sell) {
		this.sell = sell;
	}
	
	@Override
	public String toString() {
		return "Product [code=" + code + ", name=" + name + ", company=" + company + ", price=" + price + ", desc="
				+ desc + ", date=" + date + ", stock=" + stock + ", sell=" + sell + "]";
	}
	
}
