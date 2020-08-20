package com.dht.www.exercise.model.vo;

import java.sql.Date;

public class Record {
	private String id;
	private Date date;
	private int record; // 기록(횟수 OR 초)
	private int exNo; // 운동번호

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getRecord() {
		return record;
	}
	public void setRecord(int record) {
		this.record = record;
	}
	public int getExNo() {
		return exNo;
	}
	public void setExNo(int exNo) {
		this.exNo = exNo;
	}

	@Override
	public String toString() {
		return "Record [id=" + id + ", date=" + date + ", record=" + record + ", exNo=" + exNo + "]";
	}
}