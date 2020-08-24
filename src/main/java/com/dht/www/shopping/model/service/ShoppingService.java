package com.dht.www.shopping.model.service;

import java.util.List;
import java.util.Map;

import common.util.Paging;

public interface ShoppingService {
	
	public List<Map<String, Object>> selectHome(String cate);

}
