package com.dht.www.shopping.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dht.www.shopping.model.dao.ShoppingDao;
import com.dht.www.shopping.model.vo.Basket;
import com.dht.www.shopping.model.vo.OrderProduct;
import com.dht.www.shopping.model.vo.Orders;
import com.dht.www.user.model.vo.Users;

import common.util.Paging;

@Service
public class ShoppingServiceImpl implements ShoppingService {
	
	@Autowired
	private ShoppingDao shoppingDao;
	

	@Override
	public List<Map<String, Object>> selectHome(String cate) {
		return shoppingDao.selectHome(cate);
	}

	@Override
	public List<Map<String, Object>> selectList(int listno, int curPage, int cntPerPage) {
	
		int total = shoppingDao.selectCntList(listno);
		Paging paging = new Paging(total, curPage, cntPerPage);
		paging.setListno(listno);

		System.out.println("total" + total);
		return shoppingDao.selectList(paging);
				
	}
	
	@Override
	public Map<String, Object> selectItem(String code) {
		return shoppingDao.selectItem(code);
	}

	@Override
	public List<Map<String, Object>> selectBasket(Users user) {
		return shoppingDao.selectBasket(user);
	}
	
	@Override
	public Map<String, Object> sessionBasket(String code) {
		return shoppingDao.sessionBasket(code);
	}

	@Override
	public int checkBasket(Basket basket) {
		return shoppingDao.checkBasket(basket);
	}

	@Override
	public int insertBasket(Basket basket) {
		return shoppingDao.insertBasket(basket);
	}
	
	@Override
	public int addAmount(Basket basket) {
		return shoppingDao.addAmount(basket);
	}
	
	@Override
	public int updateAmount(Basket basket) {
		return shoppingDao.updateAmount(basket);
	}
	
	@Override
	public int deleteBasket(Basket basket) {
		return shoppingDao.deleteBasket(basket);
	}
	
	@Override
	public int deleteList(Map<String,Object> map) {
		return shoppingDao.deleteList(map);
	}

	@Override
	public List<Map<String, Object>> selectProuct(Map map) {
		return shoppingDao.selectProduct(map);
	}

	@Override
	public int selectPoint(String id) {
		return shoppingDao.selectPoint(id);
	}

	@Override
	public List<Map<String, Object>> selectProuct(Basket basket) {
		return null;
	}

	@Override
	public int insertOrders(Orders order) {
		return shoppingDao.insertOrders(order);
	}
	
	public int insertOrderProduct(List<OrderProduct> orderProduct) {
		return shoppingDao.insertOrderProduct(orderProduct);
	}

}
