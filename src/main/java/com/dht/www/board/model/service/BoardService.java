package com.dht.www.board.model.service;

import java.util.Map;

public interface BoardService {

	public Map<String, Object> selectBoardList(int currentPage, int cntPerPage);
	
}
