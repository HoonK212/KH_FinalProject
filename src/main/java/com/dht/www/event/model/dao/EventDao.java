package com.dht.www.event.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dht.www.exercise.model.vo.Compensation;

@Repository
public class EventDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public Map<String, Object> checkPC(Compensation com) {
		return sqlSession.selectOne("Event.checkPC", com);
	}
	
	public int insertPoint(Compensation com) {
		return sqlSession.insert("Event.insertPoint", com);
	}
	
	public int insertCoin(Compensation com) {
		return sqlSession.insert("Event.insertCoin", com);
	}
	
	public Map<String, Object> selectQuiz(int day) {
		return sqlSession.selectOne("Event.selectQuiz", day);
	}
	
	public int checkQuiz(Map<String, String> map) {
		return sqlSession.selectOne("Event.checkQuiz", map);
	}
}