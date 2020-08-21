package com.dht.www.shopping.model.vo;

public class OrderProduct {
	
	private int no;
	private int amount;
	private int point;
	private String code;
	private int ordersNo;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public int getOrdersNo() {
		return ordersNo;
	}
	public void setOrdersNo(int ordersNo) {
		this.ordersNo = ordersNo;
	}
	
	@Override
	public String toString() {
		return "OrderProduct [amount=" + amount + ", code=" + code + ", no=" + no + ", ordersNo=" + ordersNo + ", point="
				+ point + "]";
	}
	
}
