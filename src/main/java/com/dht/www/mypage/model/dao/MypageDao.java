package com.dht.www.mypage.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import common.util.Paging;

@Repository
public class MypageDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int setGoal(Map<String, Object> goal) {

		return sqlSession.insert("MYPAGE.setGoal", goal);
	}

	public int updateGoal(Map<String, Object> goal) {

		return sqlSession.update("MYPAGE.updateGoal", goal);
	}
	
	public List<Map<String,Object>> selectOrderList(Map<String, Object> mp){
		
		return sqlSession.selectList("MYPAGE.selectOrderList", mp);
	}

	public int selectOrderCnt(String id) {

		return sqlSession.selectOne("MYPAGE.selectOrderCnt", id);
	}

	public int cancelOrder(String op_no) {
		// TODO Auto-generated method stub
		return sqlSession.update("MYPAGE.cancelOrder", op_no);
	}

	public int submitReturn(Map data) {
		
		return sqlSession.insert("MYPAGE.submitReturn", data);
	}

	public void insertReview(Map data) {
		sqlSession.insert("MYPAGE.insertReview", data);
	}

	public int selectOrderAmountCnt(String id) {
		
		return sqlSession.selectOne("MYPAGE.selectOrderAmountCnt", id);
	}


}
