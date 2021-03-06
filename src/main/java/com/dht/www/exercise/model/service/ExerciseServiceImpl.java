package com.dht.www.exercise.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dht.www.exercise.model.dao.ExerciseDao;
import com.dht.www.exercise.model.vo.Exercise;
import com.dht.www.user.model.vo.Users;

@Service
public class ExerciseServiceImpl implements ExerciseService {
	
	@Autowired
	private ExerciseDao exerciseDao;

	
	// 나의 운동정보 가져오기
	@Override
	public String selectExerciseMyRoutine(Users user) {
		return exerciseDao.selectExerciseMyRoutine(user);
	}

	// 나의 운동등급 가져오기
	@Override
	public int selectExerciseMyGrade(Users user) {
		return exerciseDao.selectExerciseMyGrade(user);
	}

	// 설정한 목표있는지 찾기
	@Override
	public int selectGoalInfo(Users user) {
		return exerciseDao.selectGoalInfo(user);
	}
	
	// 해당 운동으로 전신,상체,하체 조회하기
	@Override
	public List<Exercise> leftExerInfo(List<String> exerciseList) {
		
		List<Exercise> leftExerInfo = new ArrayList<>();
		Exercise exercise = new Exercise();
		
		// 운동개수만큼 list에 전신, 상체, 하체 조회
		for(int i=0; i<exerciseList.size(); i++) {
			exercise = exerciseDao.leftExerInfo(exerciseList.get(i));
			leftExerInfo.add(exercise);
		}
		
		return leftExerInfo;
	}

	// DB에 저장되어있는 운동개수 알아와서 등급과 계산
	@Override
	public int[] selectCalcExerCnt(String[] userExer, int userLevel) {
		
		// userExer 길이만큼 int형 배열 생성
		int[] calcExerCnt = new int[userExer.length];
		
		// 레벨에 대한 값 조회하기
		double level = exerciseDao.selectGradeValue(userLevel);
		
		// calcExerCnt 배열에 [조회한 운동 * level] 저장
		for(int i=0; i<userExer.length; i++) {
			calcExerCnt[i] = (int) Math.ceil(exerciseDao.selectExerciseCount(userExer[i]) * level);
		}
		
		return calcExerCnt;
	}

	// 사용자 만 나이 구하기
	@Override
	public int selectUserAge(Map<String, Object> userInfo) {
		
		// 생년월일 가져오기
		String birth = exerciseDao.selectUserBirth(userInfo);
		
		// map에 생년월일 넣기
		userInfo.put("birth", birth);
		
		// 만 나이 구해서 반환
		return exerciseDao.selectUserAge(userInfo);
	}

	// 포인트지급 - 운동개수 * 10P * 운동등급
	@Override
	public int insertRewardPoint(Map<String, Object> rewardMap) {
		
		// 레벨에 대한 값 조회하기
		double level = exerciseDao.selectGradeValue((int) rewardMap.get("exerciseLevel"));
		
		// 운동개수 꺼내기
		int exerciseLength = (int) rewardMap.get("exerciseLength");
		
		// 포인트 지급
		int point = (int) Math.ceil(exerciseLength * 10.0 * level);
		
		// 계산된 point map에 넣기
		rewardMap.put("point", point);
		
		// 포인트지급
		exerciseDao.insertRewardPoint(rewardMap);
		
		return point;
	}

	// 코인지급
	@Override
	public int insertRewardCoin(Map<String, Object> rewardMap) {
		
		int coin = 0; // 지급 코인 수 
		int maxCoin = 3; // 일 최대 코인 지급 수
		int todayUserCoin = 0; // 당일 지급받은 코인 횟수
		int exerciseLength = (int) rewardMap.get("exerciseLength");
		
		String userid = (String) rewardMap.get("userid");
		
		// 당일 지급받은 코인이 있는지 조회
		int todayUserCoinCnt = exerciseDao.selectUserCoinCnt(userid);
		
		// 0보다 크면 코인 보유개수 조회
		if(todayUserCoinCnt > 0) {
			todayUserCoin = exerciseDao.selectUserCoin(userid);
		}
		
		// 운동길이 + 당일지급 받은 코인
		int calcCoin = exerciseLength + todayUserCoin;

		// 조건문에 맞게 coin을 map에 담아 지급
		if(calcCoin > maxCoin) {
			coin = maxCoin - todayUserCoin;
			rewardMap.put("coin", coin);
			exerciseDao.insertRewardCoin(rewardMap);
		} else {
			coin = exerciseLength;
			rewardMap.put("coin", coin);
			exerciseDao.insertRewardCoin(rewardMap);
		}
		
		return coin;
	}
	
	// 운동기록 저장
	@Override
	public void insertEventRecord(Map<String, Object> recordMap) {
		
		// 완료한 운동 개수
		int exerciseLength = (int) recordMap.get("exerciseLength");
		
		// 운동 목록 저장
		ArrayList<String> exerciseList = (ArrayList<String>) recordMap.get("exerciseList");
		
		// 운동 횟수 저장
		int[] exerciseCount = (int[]) recordMap.get("exerciseCount");
		
		// 운동번호 배열생성
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
			
			exerciseDao.insertEventRecord(exerciseInfo);
		}
	}
}