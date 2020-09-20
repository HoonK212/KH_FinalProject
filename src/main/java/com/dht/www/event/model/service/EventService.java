package com.dht.www.event.model.service;

import java.util.List;
import java.util.Map;

import com.dht.www.exercise.model.vo.Compensation;

public interface EventService {

	//사용자 현재 포인트, 코인 조회
	public Map<String, Object> checkPC(Compensation com);
	
	//이벤트에서 얻은 포인트 추가
	public int insertPoint(Compensation com);
	
	//코인 차감 : -1 (이벤트 1회 실행)
	public int insertCoin(Compensation com);

	//이벤트 참여여부 판단
	public int checkAtt(Compensation com);
	
	//신기록 랭킹 정보
	public List<List<Map<String, Object>>> selectRecord(int day);

	//요일별 초성퀴즈 문제
	public Map<String, Object> selectQuiz(int day);
	
	//사용자의 출석 정보 리스트
	public List<Map<String, Object>> selectAttend(String id);
	
	//사용자의 한주간 출석 횟수 정보(연속출석 체크)
	public int checkWeekAttend(String id);
	
	//신기록 랭킹 기간 정보
	public Map<String, Object> selectDates(int day);
}
