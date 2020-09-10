package com.dht.www.exercise.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dht.www.exercise.model.vo.Exercise;
import com.dht.www.user.model.vo.Users;

@Repository
public class ExerciseDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public String selectExerciseMyRoutine(Users user) {
		return sqlSession.selectOne("EXERCISE.selectRoutine", user);
	}

	public int selectExerciseMyGrade(Users user) {
		return sqlSession.selectOne("EXERCISE.selectGrade", user);
	}

	//설정한 목표있는지 찾기
	public int selectGoalInfo(Users user) {
		return sqlSession.selectOne("EXERCISE.selectGoalInfo", user);
	}

	// 운동 개수 조회하기
	public int selectExerciseCount(String userExer) {
		return sqlSession.selectOne("EXERCISE.selectExerciseCount", userExer);
	}

	// 등급 값 조회하기
	public double selectGradeValue(int userLevel) {
		return sqlSession.selectOne("EXERCISE.selectGradeValue", userLevel);
	}

	// 사용자 만 나이 구하기 - 생년월일 조회
	public String selectUserBirth(Map<String, Object> userInfo) {
		return sqlSession.selectOne("EXERCISE.selectUserBirth", userInfo);
	}

	// 사용자 만 나이 구하기 - 만 나이 계산
	public int selectUserAge(Map<String, Object> userInfo) {
		return sqlSession.selectOne("EXERCISE.selectUserAge", userInfo);
	}

	// 해당 운동으로 전신,상체,하체 조회하기
	public Exercise leftExerInfo(String exerName) {
		return sqlSession.selectOne("EXERCISE.leftExerInfo", exerName);
	}
	
	// 포인트지급 - 운동개수 * 운동등급
	public int insertRewardPoint(Map<String, Object> map) {
		return sqlSession.insert("EXERCISE.insertRewardPoint", map);
	}
	
	// 당일 지급받은 코인이 있는지 조회
	public int selectUserCoinCnt(String userid) {
		return sqlSession.selectOne("EXERCISE.selectUserCoinCnt", userid);
	}
	
	// 보유 코인 조회
	public int selectUserCoin(String userid) {
		return sqlSession.selectOne("EXERCISE.selectUserCoin", userid);
		
	}
	
	// 코인지급
	public int insertRewardCoin(Map<String, Object> rewardMap) {
		return sqlSession.insert("EXERCISE.insertRewardCoin", rewardMap);
	}
	
	// 운동이름으로 운동번호 조회
	public int selectExerciseNo(String exerciseName) {
		return sqlSession.selectOne("EXERCISE.selectExerciseNo", exerciseName);
	}
	
	// 운동기록 저장
	public int insertEventRecord(Map<String, Object> exerciseInfo) {
		return sqlSession.insert("EXERCISE.insertEventRecord", exerciseInfo);
	}
}