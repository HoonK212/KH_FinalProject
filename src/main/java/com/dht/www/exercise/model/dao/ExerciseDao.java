package com.dht.www.exercise.model.dao;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public int selectGradeValue(int userLevel) {
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

	
	
}