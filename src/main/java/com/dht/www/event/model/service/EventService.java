package com.dht.www.event.model.service;

import java.util.List;
import java.util.Map;

import com.dht.www.exercise.model.vo.Compensation;

public interface EventService {

	public Map<String, Object> checkPC(Compensation com);
	
	public int insertPoint(Compensation com);
	
	public int insertCoin(Compensation com);

	public int checkAtt(Map<String, Object> map);
	
	public Map<Integer, List> selectRecord(String firstRange, String lastRange);

	public Map<String, Object> selectQuiz(int day);
	
	public List<Map<String, Object>> selectAttend(String id);
	
	public int checkWeekAttend(String id);
}
