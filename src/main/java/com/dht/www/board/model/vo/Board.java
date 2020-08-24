package com.dht.www.board.model.vo;

import java.sql.Date;

public class Board {

	private int no;
	private int type;
	private String title;
	private String content;
	private int count;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
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
		return "Board [no=" + no + ", type=" + type + ", title=" + title + ", content=" + content + ", count=" + count
				+ ", dates=" + dates + ", id=" + id + "]";
	}
	
}
