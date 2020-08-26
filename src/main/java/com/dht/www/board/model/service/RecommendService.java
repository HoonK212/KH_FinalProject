package com.dht.www.board.model.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.dht.www.board.model.vo.Board;
import com.dht.www.board.model.vo.Comments;
import com.dht.www.board.model.vo.Recommend;

public interface RecommendService {

	// 게시글 좋아요 & 싫어요
	public int insertBoardRecommend(Recommend recommend);
	
}
