package com.dht.www.board.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dht.www.board.model.vo.Recommend;

import common.util.Paging;

@Repository
public class RecommendDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int insertBoardRecommend(Recommend recommend) {
		return sqlSession.insert("RECOMMEND.insertBoardRecommend", recommend);
	}

}
