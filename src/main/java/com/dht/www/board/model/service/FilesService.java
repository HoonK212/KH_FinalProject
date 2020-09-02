package com.dht.www.board.model.service;

import java.util.Map;

import com.dht.www.board.model.vo.Board;
import com.dht.www.board.model.vo.Comments;

public interface FilesService {

	// 게시판 첨부파일 조회
	public Map<String, Object> selectBoardFiles(int no);

}
