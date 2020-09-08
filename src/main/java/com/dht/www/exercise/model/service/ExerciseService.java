package com.dht.www.exercise.model.service;

import java.util.Map;

import com.dht.www.user.model.vo.Users;

public interface ExerciseService {

	public String selectExerciseMyRoutine(Users user);

	public int selectExerciseMyGrade(Users user);

	// 설정한 목표있는지 찾기
	public int selectGoalInfo(Users user);

	// DB에 저장되어있는 운동개수 알아와서 등급과 계산
	public int[] selectCalcExerCnt(String[] userExer, int userLevel);

	// 사용자 만 나이 구하기
	public int selectUserAge(Map<String, Object> userInfo);

	// 포인트지급 - 운동개수 * 운동등급
	public void insertExerciseReward(Map<String, Object> rewardMap);

	// 운동 기록
	public void insertEventRecord(Map<String, Object> recordMap);




	
}