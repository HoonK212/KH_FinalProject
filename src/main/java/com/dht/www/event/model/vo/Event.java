package com.dht.www.event.model.vo;

import java.sql.Date;

public class Event {
	private int id;
	private Date dates;
	private int type; // 1: 출석 / 2: 초성

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getDates() {
		return dates;
	}
	public void setDates(Date dates) {
		this.dates = dates;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "Event [id=" + id + ", dates=" + dates + ", type=" + type + "]";
	}
}