package com.dht.www.exercise.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dht.www.exercise.model.dao.ExerciseDao;
import com.dht.www.user.model.vo.Users;

@Service
public class ExerciseServiceImpl implements ExerciseService {
	
	@Autowired
	private ExerciseDao exerciseDao;

	@Override
	public String selectExerciseMyRoutine(Users user) {
		return exerciseDao.selectExerciseMyRoutine(user);
	}

	@Override
	public int selectExerciseMyGrade(Users user) {
		return exerciseDao.selectExerciseMyGrade(user);
	}

	//설정한 목표있는지 찾기
	@Override
	public int selectGoalInfo(Users user) {
		return exerciseDao.selectGoalInfo(user);
	}

	// DB에 저장되어있는 운동개수 알아와서 등급과 계산
	@Override
	public int[] selectCalcExerCnt(String[] userExer, int userLevel) {
		
		// userExer 길이만큼 int형 배열 생성
		int[] calcExerCnt = new int[userExer.length];
		
		// 레벨에 대한 값 조회하기
		double level = exerciseDao.selectGradeValue(userLevel);
		System.out.println("조회한 level  : " + level);
		
		// calcExerCnt 배열에 [조회한 운동 * level] 저장
		for(int i=0; i<userExer.length; i++) {
			calcExerCnt[i] = (int) Math.ceil(exerciseDao.selectExerciseCount(userExer[i]) * level);
			System.out.println("calcExerCnt  : " + calcExerCnt[i]);
		}
		
		return calcExerCnt;
	}

	// 사용자 만 나이 구하기
	@Override
	public int selectUserAge(Map<String, Object> userInfo) {
		
		String birth = exerciseDao.selectUserBirth(userInfo);
		System.out.println("조회된 birthhday" + birth);
		
		userInfo.put("birth", birth);
		
		
		return exerciseDao.selectUserAge(userInfo);
		
	}
	
	
}