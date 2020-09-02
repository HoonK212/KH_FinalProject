package com.dht.www.board.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dht.www.board.model.vo.Report;

@Repository
public class ReportDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 게시글 작성
	public int insertReport(Report report) {
		return sqlSession.insert("REPORT.insertReport", report);
	}
	
}
