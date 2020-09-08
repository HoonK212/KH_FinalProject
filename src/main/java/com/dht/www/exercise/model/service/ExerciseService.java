package com.dht.www.exercise.model.service;

import java.util.List;
import java.util.Map;

import com.dht.www.exercise.model.vo.Exercise;
import com.dht.www.user.model.vo.Users;

public interface ExerciseService {

	// 나의 운동정보 가져오기
	public String selectExerciseMyRoutine(Users user);

	// 나의 운동등급 가져오기
	public int selectExerciseMyGrade(Users user);

	// 설정한 목표있는지 찾기
	public int selectGoalInfo(Users user);

	// 해당 운동으로 전신,상체,하체 조회하기
	public List<Exercise> leftExerInfo(List<String> exerciseList);
	
	
	// DB에 저장되어있는 운동개수 알아와서 등급과 계산
	public int[] selectCalcExerCnt(String[] userExer, int userLevel);

	// 사용자 만 나이 구하기
	public int selectUserAge(Map<String, Object> userInfo);

	// 포인트지급 - 운동개수 * 운동등급
	public int insertRewardPoint(Map<String, Object> rewardMap);

	// 코인지급
	public int insertRewardCoin(Map<String, Object> rewardMap);
	
	// 운동 기록
	public void insertEventRecord(Map<String, Object> recordMap);

	




	
}