package com.dht.www.board.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import common.util.Paging;

@Repository
public class BoardDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<Map<String, String>> selectBoardList(Paging page) {
		return sqlSession.selectList("BOARD.selectBoardList", page);
	}
	
	public int selectContentCnt() {
		return sqlSession.selectOne("BOARD.selectContentCnt");
	}
}
