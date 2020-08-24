package com.dht.www.board.model.vo;

public class Recommend {

	private String id;
	private int type;
	private int ref;
	private int goodBad;
	
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
	public int getGoodBad() {
		return goodBad;
	}
	public void setGoodBad(int goodBad) {
		this.goodBad = goodBad;
	}

	@Override
	public String toString() {
		return "Recommend [id=" + id + ", type=" + type + ", ref=" + ref + ", goodBad=" + goodBad + "]";
	}
	
}
