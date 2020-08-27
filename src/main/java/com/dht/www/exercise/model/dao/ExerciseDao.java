package com.dht.www.exercise.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dht.www.user.model.vo.Users;

@Repository
public class ExerciseDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int selectExerciseMyRoutine(Users user) {
		return sqlSession.selectOne("Exercise.selectRoutine", user);
	}

	public int selectExerciseMyGrade(Users user) {
		return sqlSession.selectOne("Exercise.selectGrade", user);
	}

	//설정한 목표있는지 찾기
	public int selectGoalInfo(Users user) {
		return sqlSession.selectOne("Exercise.selectGoalInfo", user);
	}
	
	
}