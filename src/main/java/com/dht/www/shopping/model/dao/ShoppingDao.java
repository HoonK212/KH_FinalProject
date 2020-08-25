package com.dht.www.shopping.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import common.util.Paging;

@Repository
public class ShoppingDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<Map<String, Object>> selectHome(String cate) {
		return sqlSession.selectList("Shopping.selectHome", cate);
	}

	public int selectCntList(int listno) {
		return sqlSession.selectOne("Shopping.selectCnt",listno);
	}
	
	public List<Map<String, Object>> selectList(Paging paging){
		return sqlSession.selectList("Shopping.selectList", paging);
		
	}
	
}
