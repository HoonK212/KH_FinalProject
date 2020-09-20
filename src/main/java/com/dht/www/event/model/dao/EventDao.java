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
	
	//사용자 현재 포인트, 코인 조회
	public Map<String, Object> checkPC(Compensation com) {
		return sqlSession.selectOne("Event.checkPC", com);
	}
	
	//이벤트에서 얻은 포인트 추가
	public int insertPoint(Compensation com) {
		return sqlSession.insert("Event.insertPoint", com);
	}
	
	//코인 차감 : -1 (이벤트 1회 실행)
	public int insertCoin(Compensation com) {
		return sqlSession.insert("Event.insertCoin", com);
	}
	
	//신기록 랭킹 정보
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

	//요일별 초성퀴즈 문제
	public Map<String, Object> selectQuiz(int day) {
		return sqlSession.selectOne("Event.selectQuiz", day);
	}
	
	//이벤트 참여여부 판단
	public int checkAtt(Compensation com) {
		return sqlSession.selectOne("Event.checkAtt", com);
	}
	
	//사용자의 출석 정보 리스트
	public List<Map<String, Object>> selectAttend(String id) {
		return sqlSession.selectList("Event.selectAttend", id);
	}
	
	//사용자의 한주간 출석 횟수 정보(연속출석 체크)
	public int checkWeekAttend(String id) {
		return sqlSession.selectOne("Event.checkWeekAttend", id);
	}
	
	//신기록 랭킹 기간 정보
	public Map<String, Object> selectDates(int day) {
		return sqlSession.selectOne("Event.selectDates", day);
	}

}