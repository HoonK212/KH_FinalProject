package com.dht.www.board.model.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.dht.www.board.model.vo.Board;
import com.dht.www.board.model.vo.Comments;
import com.dht.www.board.model.vo.Recommend;

public interface RecommendService {

	// 게시글 추천/비추천
	public int insertBoardRecommend(Recommend recommend);

	// 댓글 추천/비추천
	public int insertCommentsRecommend(Recommend recommend);
	
}
