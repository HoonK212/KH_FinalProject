package com.dht.www.shopping.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dht.www.shopping.model.vo.Basket;
import com.dht.www.shopping.model.vo.Orders;
import com.dht.www.user.model.vo.Users;

import common.util.Paging;

@Repository
public class ShoppingDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<Map<String, Object>> selectHome(String cate) {
		return sqlSession.selectList("Shopping.selectHome", cate);
	}

	public int selectCntList(int listno) {
		return sqlSession.selectOne("Shopping.selectCnt", listno);
	}
	
	public List<Map<String, Object>> selectList(Paging paging){
		return sqlSession.selectList("Shopping.selectList", paging);
		
	}
	
	public Map<String, Object> selectItem(String code) {
		return sqlSession.selectOne("Shopping.selectItem", code);
	}
	
	public List<Map<String, Object>> selectBasket(Users user) {
		return sqlSession.selectList("Shopping.selectBasket", user);
	}
	
	public Map<String, Object> sessionBasket(String code) {
		return sqlSession.selectOne("Shopping.sessionBasket", code);
	}
	
	public int checkBasket(Basket basket) {
		return sqlSession.selectOne("Shopping.checkBasket", basket);
	}
	
	public int insertBasket(Basket basket) {
		return sqlSession.insert("Shopping.insertBasket", basket);
	}
	
	public int addAmount(Basket basket) {
		return sqlSession.update("Shopping.addAmount", basket);
	}
	
	public int updateAmount(Basket basket) {
		return sqlSession.update("Shopping.updateAmount", basket);
	}
	
	public int deleteBasket(Basket basket) {
		return sqlSession.delete("Shopping.deleteBasket", basket);
	}
	
	public int deleteList(Map<String,Object> map) {
		return sqlSession.delete("Shopping.deleteList", map);
	}

	public List<Map<String, Object>> selectProduct(Map map){
		return sqlSession.selectList("Shopping.selectProduct", map);
	}
	
	public int selectPoint(String id) {
		return sqlSession.selectOne("Shopping.selectPoint", id);
	}
	
	public int insertOrders(Orders order) {
		return sqlSession.insert("Shopping.insertOrders", order);
	}
	
}
