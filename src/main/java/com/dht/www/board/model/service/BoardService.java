package com.dht.www.board.model.service;

import java.util.Map;

import com.dht.www.board.model.vo.Board;

public interface BoardService {

	// 게시글 목록 조회
	public Map<String, Object> selectBoardList(int currentPage, int cntPerPage);

	// 게시판 상세 조회
	public Map<String, String> selectBoard(int no);

	// 게시글 작성
	public int insertBoard(Board board);
	
}
