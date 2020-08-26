package com.dht.www.shopping.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dht.www.shopping.model.dao.ShoppingDao;
import com.dht.www.shopping.model.vo.Basket;
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
	public List<Map<String, Object>> selectBasket(Users user) {
		return shoppingDao.selectBasket(user);
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
	public int updateAmount(Basket basket) {
		return shoppingDao.updateAmount(basket);
	}

	@Override
	public List<Map<String, Object>> selectProuct(String code) {
		return shoppingDao.selectProduct(code);
	}

	@Override
	public int selectPoint(String id) {
		return shoppingDao.selectPoint(id);
	}

	


	/*
	 * @Override public Users selectUserInfo(String id) { return
	 * shoppingDao.selectUserInfo(id); }
	 */
	
	
}
