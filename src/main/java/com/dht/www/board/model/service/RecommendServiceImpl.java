package com.dht.www.board.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dht.www.board.model.dao.BoardDao;
import com.dht.www.board.model.dao.RecommendDao;
import com.dht.www.board.model.vo.Board;
import com.dht.www.board.model.vo.Recommend;

import common.util.Paging;

@Service
public class RecommendServiceImpl implements RecommendService {

	@Autowired
	private RecommendDao recommendDao;

	// 게시글 추천/비추천
	@Override
	public int insertBoardRecommend(Recommend recommend) {
		return recommendDao.insertBoardRecommend(recommend);
	}

}
