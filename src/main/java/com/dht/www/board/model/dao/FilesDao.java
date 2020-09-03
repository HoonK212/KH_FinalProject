package com.dht.www.board.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dht.www.board.model.vo.Board;

import common.util.Paging;

@Repository
public class FilesDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 게시판 첨부파일 조회
	public List<Map<String, String>> selectBoardFiles(int no) {
		return sqlSession.selectList("FILES.selectBoardFiles", no);
	}

	// 파일 업로드
	public int insertBoardFile(Map<String, String> fileInfo) {
		return sqlSession.insert("FILES.insertBoardFile", fileInfo);
	}

}
