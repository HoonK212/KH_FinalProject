package com.dht.www.shopping.model.service;

import java.util.List;
import java.util.Map;

import com.dht.www.user.model.vo.Users;

import common.util.Paging;

public interface ShoppingService {
	
	public List<Map<String, Object>> selectHome(String cate);
	
	public List<Map<String, Object>> selectList(int listno, int curPage, int cntPerPage);
	
	public List<Map<String, Object>> selectBasket(Users user);
}
