package com.dht.www.event.model.service;

import java.util.List;
import java.util.Map;

import com.dht.www.exercise.model.vo.Compensation;

public interface EventService {

	public Map<String, Object> checkPC(Compensation com);
	
	public int insertPoint(Compensation com);
	
	public int insertCoin(Compensation com);
	
<<<<<<< HEAD
	public Map<Integer, List> selectRecord();
=======
	public Map<String, Object> selectQuiz(int day);
>>>>>>> 13407282e31d15eaf64a4d95cbdad52b88446185
	
	public int checkQuiz(Map<String, String> map);
}
