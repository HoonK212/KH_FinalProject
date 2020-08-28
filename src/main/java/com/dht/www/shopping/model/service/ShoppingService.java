package com.dht.www.shopping.model.service;

import java.util.List;
import java.util.Map;

import com.dht.www.shopping.model.vo.Basket;
import com.dht.www.shopping.model.vo.Orders;
import com.dht.www.user.model.vo.Users;

import common.util.Paging;

public interface ShoppingService {
	
	public List<Map<String, Object>> selectHome(String cate);
	
	public List<Map<String, Object>> selectList(int listno, int curPage, int cntPerPage);
	
	public Map<String, Object> selectItem(String code);
	
	public List<Map<String, Object>> selectBasket(Users user);

	public Map<String, Object> sessionBasket(String code);
	
	public int checkBasket(Basket basket);
	
	public int insertBasket(Basket basket);
	
	public int addAmount(Basket basket);

	public int updateAmount(Basket basket);
	
	public int deleteBasket(Basket basket);
	
	public int deleteList(Map<String,Object> map);
	
	public List<Map<String, Object>> selectProuct(Basket basket);
	
	public List<Map<String, Object>> selectProuct(Map map);
	
	public int selectPoint(String id);
	
	public int insertOrders(Orders order);
}
