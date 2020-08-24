package com.dht.www.board.model.vo;

import java.sql.Date;

public class Comments {

	private int no;
	private int type;
	private int ref;
	private String content;
	private Date dates;
	private String id;
	
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
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getDates() {
		return dates;
	}
	public void setDates(Date dates) {
		this.dates = dates;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	@Override
	public String toString() {
		return "Comments [no=" + no + ", type=" + type + ", ref=" + ref + ", content=" + content + ", dates=" + dates
				+ ", id=" + id + "]";
	}
	
}
