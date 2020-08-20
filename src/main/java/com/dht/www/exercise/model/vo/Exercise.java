package com.dht.www.exercise.model.vo;

public class Exercise {
	private int no;
	private int type; // 1: 전신 / 2: 상체 / 3: 하체
	private String name; // 운동이름
	private int cal; // 소모 칼로리
	private String desc; // 운동 설명
	private int count; // 1단계 기준 횟수/시간

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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCal() {
		return cal;
	}
	public void setCal(int cal) {
		this.cal = cal;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		
		this.count = count;
	}
	
	@Override
	public String toString() {
		return "Exercise [no=" + no + ", type=" + type + ", name=" + name + ", cal=" + cal + ", desc=" + desc
				+ ", count=" + count + "]";
	}
}