package com.dht.www.event.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EventDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	
}