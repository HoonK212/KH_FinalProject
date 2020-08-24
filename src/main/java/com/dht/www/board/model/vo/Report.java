package com.dht.www.board.model.vo;

import java.sql.Date;

public class Report {

	private String id;
	private int type;
	private int ref;
	private int reason;
	private String detail;
	private int manage;
	private int days;
	private String note;
	private Date dates;
	private String target;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public int getReason() {
		return reason;
	}
	public void setReason(int reason) {
		this.reason = reason;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public int getManage() {
		return manage;
	}
	public void setManage(int manage) {
		this.manage = manage;
	}
	public int getDays() {
		return days;
	}
	public void setDays(int days) {
		this.days = days;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public Date getDates() {
		return dates;
	}
	public void setDates(Date dates) {
		this.dates = dates;
	}
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}
	
	@Override
	public String toString() {
		return "Report [id=" + id + ", type=" + type + ", ref=" + ref + ", reason=" + reason + ", detail=" + detail
				+ ", manage=" + manage + ", days=" + days + ", note=" + note + ", dates=" + dates + ", target=" + target
				+ "]";
	}
	
}
