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
	
	public Map<Integer, List> selectRecord(String firstRange, String lastRange){
		
		Map<Integer, List> map = new HashMap<Integer, List>();
		
		for(int i=1; i<10; i++) {
			List rank = new ArrayList(); 
			
			Map<String, Object> param = new HashMap();
			System.out.println("돌아야지 왜 안돌아 " + i);
			param.put("num",i );
			param.put("first",firstRange );
			param.put("last",lastRange );
			
			rank = sqlSession.selectList("Event.selectRecord",param);
			System.out.println("이건 한번?" + rank);
			map.put(i, rank);
		}
		System.out.println(map);
		return map;
	}
	

	public Map<String, Object> selectQuiz(int day) {
		return sqlSession.selectOne("Event.selectQuiz", day);
	}
	
	public int checkAtt(Map<String, Object> map) {
		return sqlSession.selectOne("Event.checkAtt", map);
	}
	
	public List<Map<String, Object>> selectAttend(String id) {
		return sqlSession.selectList("Event.selectAttend", id);
	}
	
	public int checkWeekAttend(String id) {
		return sqlSession.selectOne("Event.checkWeekAttend", id);
	}

}