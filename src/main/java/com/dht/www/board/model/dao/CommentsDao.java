package com.dht.www.board.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dht.www.board.model.vo.Board;
import com.dht.www.board.model.vo.Comments;

import common.util.Paging;

@Repository
public class CommentsDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 댓글 목록 조회 (게시글 상세 조회)
	public List<Map<String, String>> selectCommentsList(int no) {
		return sqlSession.selectList("COMMENTS.selectCommentsList", no);
	}
	
	// 댓글 작성
	public int insertComments(Comments comments) {
		return sqlSession.insert("COMMENTS.insertComments", comments);
	}
	
}
