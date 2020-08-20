package com.dht.www.shopping.model.vo;

import java.sql.Date;

public class Order {
	
	private int no;
	private int type;
	private int status;
	private Date date;
	private String mUid;
	private String id;
	private String toName;
	private String toTel;
	private String toAddr;
	private String toPost;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getmUid() {
		return mUid;
	}
	public void setmUid(String mUid) {
		this.mUid = mUid;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getToName() {
		return toName;
	}
	public void setToName(String toName) {
		this.toName = toName;
	}
	public String getToTel() {
		return toTel;
	}
	public void setToTel(String toTel) {
		this.toTel = toTel;
	}
	public String getToAddr() {
		return toAddr;
	}
	public void setToAddr(String toAddr) {
		this.toAddr = toAddr;
	}
	public String getToPost() {
		return toPost;
	}
	public void setToPost(String toPost) {
		this.toPost = toPost;
	}
	
	@Override
	public String toString() {
		return "Order [no=" + no + ", type=" + type + ", status=" + status + ", date=" + date + ", mUid=" + mUid
				+ ", id=" + id + ", toName=" + toName + ", toTel=" + toTel + ", toAddr=" + toAddr + ", toPost=" + toPost
				+ "]";
	}
	
}
