package com.dht.www.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dht.www.board.model.vo.Board;

import common.util.Paging;

@Repository
public class AdminDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

}
