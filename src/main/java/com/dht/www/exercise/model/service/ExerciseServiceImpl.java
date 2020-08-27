package com.dht.www.exercise.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dht.www.exercise.model.dao.ExerciseDao;
import com.dht.www.user.model.vo.Users;

@Service
public class ExerciseServiceImpl implements ExerciseService {
	
	@Autowired
	private ExerciseDao exerciseDao;

	@Override
	public int selectExerciseMyRoutine(Users user) {
		return exerciseDao.selectExerciseMyRoutine(user);
	}

	@Override
	public int selectExerciseMyGrade(Users user) {
		return exerciseDao.selectExerciseMyGrade(user);
	}

	//설정한 목표있는지 찾기
	@Override
	public int selectGoalInfo(Users user) {
		// TODO Auto-generated method stub
		return exerciseDao.selectGoalInfo(user);
	}
	
	
}