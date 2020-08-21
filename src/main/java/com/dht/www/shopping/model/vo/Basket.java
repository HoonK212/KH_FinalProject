package com.dht.www.shopping.model.vo;

import java.sql.Date;

public class Basket {
	
	private String id;
	private String code;
	private int amount;
	private Date dates;
	
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
	public Date getDates() {
		return dates;
	}
	public void setDates(Date dates) {
		this.dates = dates;
	}
	
	@Override
	public String toString() {
		return "Basket [id=" + id + ", code=" + code + ", amount=" + amount + ", dates=" + dates + "]";
	}
	
}
