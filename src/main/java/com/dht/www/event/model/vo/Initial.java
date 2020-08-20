package com.dht.www.event.model.vo;

public class Initial {
	private String code; // A: 기구 / B: 보조제 / C: 식품
	private String initial; // 해당 상품의 초성
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getInitial() {
		return initial;
	}
	public void setInitial(String initial) {
		this.initial = initial;
	}

	@Override
	public String toString() {
		return "Initial [code=" + code + ", initial=" + initial + "]";
	}
}