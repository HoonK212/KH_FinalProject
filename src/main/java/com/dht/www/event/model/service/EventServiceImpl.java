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

	//사용자 현재 포인트, 코인 조회
	@Override
	public Map<String, Object> checkPC(Compensation com) {
		return eventDao.checkPC(com);
	}

	//이벤트에서 얻은 포인트 추가
	@Override
	public int insertPoint(Compensation com) {
		return eventDao.insertPoint(com);
	}

	//코인 차감 : -1 (이벤트 1회 실행)
	@Override
	public int insertCoin(Compensation com) {
		return eventDao.insertCoin(com);
	}

	//신기록 랭킹 정보
	@Override
	public List<List<Map<String, Object>>> selectRecord(int day) {
		return eventDao.selectRecord(day);
	}
	
	//요일별 초성퀴즈 문제
	@Override
	public Map<String, Object> selectQuiz(int day) {
		return eventDao.selectQuiz(day);
	}

	//이벤트 참여여부 판단
	@Override
	public int checkAtt(Compensation com) {
		return eventDao.checkAtt(com);

	}

	//사용자의 출석 정보 리스트
	@Override
	public List<Map<String, Object>> selectAttend(String id) {
		return eventDao.selectAttend(id);
	}

	//사용자의 한주간 출석 횟수 정보(연속출석 체크)
	@Override
	public int checkWeekAttend(String id) {
		return eventDao.checkWeekAttend(id);
	}

	//신기록 랭킹 기간 정보
	@Override
	public Map<String, Object> selectDates(int day) {
		return eventDao.selectDates(day);
	}
}