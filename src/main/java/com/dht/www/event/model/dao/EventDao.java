package com.dht.www.event.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
	
	public List<List<Map<String, Object>>> selectRecord(int day){
		List<List<Map<String, Object>>> list = new ArrayList<List<Map<String,Object>>>();
		
		for(int i=1; i<10; i++) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("no", i);
			map.put("day", day);
			List<Map<String, Object>> rank = sqlSession.selectList("Event.selectRecord", map);
			list.add(rank);
		}
		return list;
	}

	public Map<String, Object> selectQuiz(int day) {
		return sqlSession.selectOne("Event.selectQuiz", day);
	}
	
	public int checkAtt(Compensation com) {
		return sqlSession.selectOne("Event.checkAtt", com);
	}
	
	public List<Map<String, Object>> selectAttend(String id) {
		return sqlSession.selectList("Event.selectAttend", id);
	}
	
	public int checkWeekAttend(String id) {
		return sqlSession.selectOne("Event.checkWeekAttend", id);
	}

}