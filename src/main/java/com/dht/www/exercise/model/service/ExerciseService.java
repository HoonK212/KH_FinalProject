package com.dht.www.exercise.model.service;

import java.sql.Date;
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

	
}