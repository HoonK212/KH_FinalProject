package com.dht.www.board.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dht.www.board.model.vo.Board;

import common.util.Paging;

@Repository
public class BoardDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 게시글 목록 조회
	public List<Map<String, String>> selectBoardList(Paging page) {
		return sqlSession.selectList("BOARD.selectBoardList", page);
	}
	
	// 게시글 개수 확인
	public int selectContentCnt() {
		return sqlSession.selectOne("BOARD.selectContentCnt");
	}
	
	// 게시글 상세 조회
	public Map<String, String> selectBoard(int no) {
		return sqlSession.selectOne("BOARD.selectBoard", no);
	}

	// 게시글 작성
	public int insertBoard(Board board) {
		return sqlSession.insert("BOARD.insertBoard", board);
	}

	
}
