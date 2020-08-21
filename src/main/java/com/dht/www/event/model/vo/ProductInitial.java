package com.dht.www.event.model.vo;

public class ProductInitial {
	private String code; // A: 기구 / B: 보조제 / C: 식품
	private String productInitial; // 해당 상품의 초성

	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getProductInitial() {
		return productInitial;
	}
	public void setProductInitial(String productInitial) {
		this.productInitial = productInitial;
	}
	
	@Override
	public String toString() {
		return "ProductInitial [code=" + code + ", productInitial=" + productInitial + "]";
	}
	
}