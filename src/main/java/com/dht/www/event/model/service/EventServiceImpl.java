package com.dht.www.event.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dht.www.event.model.dao.EventDao;
import com.dht.www.exercise.model.vo.Compensation;

@Service
public class EventServiceImpl implements EventService {
	
	@Autowired
	private EventDao eventDao;

	@Override
	public Map<String, Object> checkPC(Compensation com) {
		return eventDao.checkPC(com);
	}

	@Override
	public int insertPoint(Compensation com) {
		return eventDao.insertPoint(com);
	}

	@Override
	public int insertCoin(Compensation com) {
		return eventDao.insertCoin(com);
	}

	@Override
	public List<List<Map<String, Object>>> selectRecord(int day) {
		return eventDao.selectRecord(day);
	}
	
	@Override
	public Map<String, Object> selectQuiz(int day) {
		return eventDao.selectQuiz(day);
	}

	@Override
	public int checkAtt(Compensation com) {
		return eventDao.checkAtt(com);

	}

	@Override
	public List<Map<String, Object>> selectAttend(String id) {
		return eventDao.selectAttend(id);
	}

	@Override
	public int checkWeekAttend(String id) {
		return eventDao.checkWeekAttend(id);
	}
	
}