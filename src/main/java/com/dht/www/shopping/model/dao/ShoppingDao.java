package com.dht.www.shopping.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dht.www.shopping.model.vo.Basket;
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
	
	public List<Map<String, Object>> selectBasket(Users user) {
		return sqlSession.selectList("Shopping.selectBasket", user);
	}
	
	public int checkBasket(Basket basket) {
		return sqlSession.selectOne("Shopping.checkBasket");
	}
	
	public int insertBasket(Basket basket) {
		return sqlSession.insert("Shopping.insertBasket");
	}
	
	public int updateAmount(Basket basket) {
		return sqlSession.update("Shopping.updateAmount", basket);
	}

	public List<Map<String, Object>> selectProduct(Basket basket){
		System.out.println("왜 안되냐" + sqlSession.selectList("Shopping.selectProduct", basket));
		return sqlSession.selectList("Shopping.selectProduct", basket);
	}
	
	public int selectPoint(String id) {
		return sqlSession.selectOne("Shopping.selectPoint", id);
	}
	
}
