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
	
	@Override
	public Map<String, Object> selectBoardList(int currentPage, int cntPerPage) {
		
		Map<String, Object> commandMap = new HashMap<String, Object>();
		
		Paging page = new Paging(boardDao.selectContentCnt(), currentPage, cntPerPage);
		
		List<Map<String, String>> blist = boardDao.selectBoardList(page);
		commandMap.put("paging", page);
		commandMap.put("blist", blist);
		
		return commandMap;
	}

}
