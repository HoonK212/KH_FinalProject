package com.dht.www.event.model.service;

import java.util.Map;

import com.dht.www.exercise.model.vo.Compensation;

public interface EventService {

	public Map<String, Object> checkPC(Compensation com);
	
	public int insertPoint(Compensation com);
	
	public int insertCoin(Compensation com);
	
	public Map<String, Object> selectQuiz(int day);
	
	public int checkQuiz(Map<String, String> map);
}
