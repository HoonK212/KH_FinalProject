package com.dht.www.exercise.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ExerciseDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
}