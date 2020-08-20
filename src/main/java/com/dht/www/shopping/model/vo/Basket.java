package com.dht.www.shopping.model.vo;

import java.sql.Date;

public class Basket {
	
	private String id;
	private String code;
	private int amount;
	private Date date;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	@Override
	public String toString() {
		return "Basket [id=" + id + ", code=" + code + ", amount=" + amount + ", date=" + date + "]";
	}
	
}
