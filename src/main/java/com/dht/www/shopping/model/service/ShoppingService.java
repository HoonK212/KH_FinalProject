package com.dht.www.shopping.model.service;

import java.util.List;
import java.util.Map;

import com.dht.www.shopping.model.vo.Basket;
import com.dht.www.user.model.vo.Users;

import common.util.Paging;

public interface ShoppingService {
	
	public List<Map<String, Object>> selectHome(String cate);
	
	public List<Map<String, Object>> selectList(int listno, int curPage, int cntPerPage);
	
	public List<Map<String, Object>> selectBasket(Users user);
	
	public int checkBasket(Basket basket);
	
	public int insertBasket(Basket basket);
	
	public int updateAmount(Basket basket);
	
	public List<Map<String, Object>> selectProuct(Basket basket);
	
	public int selectPoint(String id);
}
