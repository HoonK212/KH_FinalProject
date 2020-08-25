package com.dht.www.board.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dht.www.board.model.dao.BoardDao;
import com.dht.www.board.model.vo.Board;

import common.util.Paging;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao boardDao;
	
	// 게시글 목록 조회
	@Override
	public Map<String, Object> selectBoardList(int currentPage, int cntPerPage) {
		
		Map<String, Object> boardListMap = new HashMap<String, Object>();
		
		Paging page = new Paging(boardDao.selectContentCnt(), currentPage, cntPerPage);
		
		List<Map<String, String>> blist = boardDao.selectBoardList(page);
		boardListMap.put("paging", page);
		boardListMap.put("blist", blist);
		
		return boardListMap;
	}

	// 게시글 상세 조회
	@Override
	public Map<String, String> selectBoard(int no) {
		return boardDao.selectBoard(no);
	}

	// 게시글 작성
	@Override
	public int insertBoard(Board board) {
		return boardDao.insertBoard(board);
	}


}
