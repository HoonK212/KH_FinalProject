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
	public Map<Integer, List> selectRecord() {
		return eventDao.selectRecord();
	}
	
	@Override
	public Map<String, Object> selectQuiz(int day) {
		return eventDao.selectQuiz(day);
	}

	@Override
	public int checkQuiz(Map<String, String> map) {
		return eventDao.checkQuiz(map);

	}
	
}