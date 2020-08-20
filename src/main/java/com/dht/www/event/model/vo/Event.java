package com.dht.www.event.model.vo;

import java.sql.Date;

public class Event {
	private int id;
	private Date date;
	private int type; // 1: 출석 / 2: 초성

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "Event [id=" + id + ", date=" + date + ", type=" + type + "]";
	}
}