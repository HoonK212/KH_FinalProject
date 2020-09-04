package com.dht.www.event.model.service;

import java.util.List;
import java.util.Map;

import com.dht.www.exercise.model.vo.Compensation;

public interface EventService {

	public Map<String, Object> checkPC(Compensation com);
	
	public int insertPoint(Compensation com);
	
	public int insertCoin(Compensation com);

	public int checkQuiz(Map<String, String> map);
	
	public Map<Integer, List> selectRecord();

	public Map<String, Object> selectQuiz(int day);
}
