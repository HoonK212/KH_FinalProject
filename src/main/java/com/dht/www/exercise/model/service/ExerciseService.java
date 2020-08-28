package com.dht.www.exercise.model.service;

import com.dht.www.user.model.vo.Users;

public interface ExerciseService {

	public String selectExerciseMyRoutine(Users user);

	public int selectExerciseMyGrade(Users user);

	//설정한 목표있는지 찾기
	public int selectGoalInfo(Users user);
	
}