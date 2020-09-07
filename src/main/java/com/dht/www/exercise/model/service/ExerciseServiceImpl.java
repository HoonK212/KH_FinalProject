package com.dht.www.exercise.model.service;

import java.util.ArrayList;
import java.util.HashMap;
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

	// 포인트지급 - 운동개수 * 운동등급
	@Override
	public void insertExerciseReward(Map<String, Object> rewardMap) {
		
		// 레벨에 대한 값 조회하기
		double level = exerciseDao.selectGradeValue((int) rewardMap.get("exerciseLevel"));
		System.out.println("조회한 level  : " + level);
		
		int exerciseLength = (int) rewardMap.get("exerciseLength");
		
		System.out.println("exerciseLength  : " + exerciseLength);
		
		
		// 포인트 지급
		double point = Math.ceil(exerciseLength * 10.0 * level);
		System.out.println("point  : " + point);
		
		rewardMap.put("point", point);
		
		exerciseDao.insertExerciseReward(rewardMap);
		
		String userid = (String) rewardMap.get("userid");
		
		// 사용자 당일 지급받은 코인 조회
		int todayUserCoin = exerciseDao.selectUserCoin(userid);
		
		int maxCoin = 3;
		
		// 당일지급 받은 코인 - 운동 횟수
		int calcCoin = maxCoin - todayUserCoin;
		
		
		
		// 코인지급
		if(todayUserCoin <= 3 && calcCoin > 0) {
			rewardMap.put("coin", calcCoin);
			exerciseDao.insertRewardCoin(rewardMap);
		}
	}

	
	
	
	
	
	@Override
	public void insertEventRecord(Map<String, Object> recordMap) {
		
		int exerciseLength = (int) recordMap.get("exerciseLength");
		
		ArrayList<String> exerciseList = (ArrayList<String>) recordMap.get("exerciseList");
		int[] exerciseCount = (int[]) recordMap.get("exerciseCount");
		
		// 운동번호
		int[] exerciseNo = new int[exerciseLength];
		
		// 가져온 운동정보로 운동번호 조회
		for(int i=0; i<exerciseLength; i++) {
			exerciseNo[i] = exerciseDao.selectExerciseNo(exerciseList.get(i));
		}
		
		
		Map<String, Object> exerciseInfo = new HashMap<>();
		
		exerciseInfo.put("userid", recordMap.get("userid"));
		
		for(int i=0; i<exerciseLength; i++) {
			// i번째 운동번호
			exerciseInfo.put("exerciseNo", exerciseNo[i]);
			// i번째 운동개수
			exerciseInfo.put("exerciseCount", exerciseCount[i]);
			
			System.out.println("exerciseNo   : " + exerciseNo[i]);
			System.out.println("exerciseCount   : " + exerciseCount[i]);
					
			exerciseDao.insertEventRecord(exerciseInfo);
		}
	}
	
}