package com.dht.www.board.model.service;

import java.util.Map;

import com.dht.www.board.model.vo.Board;
import com.dht.www.board.model.vo.Comments;

public interface CommentsService {

	// 댓글 목록 조회 (게시글 상세 조회)
	public Map<String, Object> selectCommentsList(int no);

	// 댓글 작성
	public int insertComments(Comments comments);
	
}
