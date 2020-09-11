package com.dht.www.mypage.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

}
