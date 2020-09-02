package com.dht.www.board.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dht.www.board.model.dao.CommentsDao;
import com.dht.www.board.model.vo.Comments;

import common.util.Paging;

@Service
public class CommentsServiceImpl implements CommentsService {

	@Autowired
	private CommentsDao commentsDao;

	// 댓글 목록 조회 (게시글 상세 조회)
	@Override
	public Map<String, Object> selectCommentsList(int no) {
		
		Map<String, Object> commentsListMap = new HashMap<String, Object>();
		
		List<Map<String, String>> clist = commentsDao.selectCommentsList(no);
		commentsListMap.put("clist", clist);
		
		return commentsListMap;
	}
	
	// 댓글 작성
	@Override
	public int insertComments(Comments comments) {
		return commentsDao.insertComments(comments);
	}

}
