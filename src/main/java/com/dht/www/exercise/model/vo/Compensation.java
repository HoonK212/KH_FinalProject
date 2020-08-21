package com.dht.www.exercise.model.vo;

import java.sql.Date;

public class Compensation {
	private String id;
	private Date dates;
	private int type; // 1: 포인트 / 2: 코인
	private int event; // 1: 출석 / 2: 초성 / 3: 룰렛 / 4: 묵찌빠 / 5: 기록 / 6: 단어
	private int inc; // 증가
	private int dec; // 감소

	public String getId() {
		return id;
	}
	public void setId(String id) {
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
	public int getEvent() {
		return event;
	}
	public void setEvent(int event) {
		this.event = event;
	}
	public int getInc() {
		return inc;
	}
	public void setInc(int inc) {
		this.inc = inc;
	}
	public int getDec() {
		return dec;
	}
	public void setDec(int dec) {
		this.dec = dec;
	}

	@Override
	public String toString() {
		return "Compensation [id=" + id + ", dates=" + dates + ", type=" + type + ", event=" + event + ", inc=" + inc
				+ ", dec=" + dec + "]";
	}
}